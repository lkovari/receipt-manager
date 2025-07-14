from supabase import create_client, Client
from typing import List, Optional, Dict, Any, Union
from uuid import UUID
import os
import json
import re
from datetime import datetime
from .schemas import (
    ProcessingStatus,
    TaskListResponse,
    TaskStatusResponse,
    LLMResponse
)

SUPABASE_URL = os.getenv("SUPABASE_URL")
SUPABASE_KEY = os.getenv("SUPABASE_ANON_KEY")

supabase: Client = create_client(SUPABASE_URL, SUPABASE_KEY)

def create_processing_task(user_id: UUID, image_url: str) -> TaskStatusResponse:
    """Create a new receipt processing task"""
    data = {
        "user_id": str(user_id),
        "status": ProcessingStatus.PENDING.value,
        "image_url": image_url
    }

    response = supabase.table("receipt_processing_tasks").insert(data).execute()

    if not response.data:
        raise Exception("Failed to create processing task")

    return TaskStatusResponse(**response.data[0])

def get_processing_task(task_id: UUID, user_id: UUID) -> Optional[TaskStatusResponse]:
    """Get a specific processing task"""
    response = supabase.table("receipt_processing_tasks") \
        .select("*") \
        .eq("id", str(task_id)) \
        .eq("user_id", str(user_id)) \
        .execute()

    if not response.data:
        return None

    return TaskStatusResponse(**response.data[0])

def update_processing_task_status(
    task_id: UUID,
    status: ProcessingStatus,
    receipt_id: Optional[UUID] = None,
    error_message: Optional[str] = None,
    exception_details: Optional[str] = None
) -> TaskStatusResponse:
    """Update the status of a processing task"""
    data = {
        "status": status.value,
        "updated_at": datetime.utcnow().isoformat()
    }

    if receipt_id:
        data["receipt_id"] = str(receipt_id)
    if error_message:
        data["error_message"] = error_message
    if exception_details:
        data["exception_details"] = exception_details

    response = supabase.table("receipt_processing_tasks") \
        .update(data) \
        .eq("id", str(task_id)) \
        .execute()

    if not response.data:
        raise Exception("Failed to update processing task status")

    return TaskStatusResponse(**response.data[0])

def get_user_tasks(user_id: UUID, limit: int = 50, offset: int = 0) -> tuple[List[TaskListResponse], int]:
    """Get all processing tasks for a user with their LLM responses"""
    # First get the tasks
    response = supabase.table("receipt_processing_tasks") \
        .select(
            "*, llm_responses!fk_task(raw_response)",
            count="exact"
        ) \
        .eq("user_id", str(user_id)) \
        .order("created_at", desc=True) \
        .range(offset, offset + limit - 1) \
        .execute()

    total = response.count if hasattr(response, 'count') else 0

    if not response.data:
        return [], total

    tasks = []
    for task_data in response.data:
        # Extract LLM error if present
        llm_error = None
        if task_data.get("llm_responses"):
            llm_responses = task_data.pop("llm_responses")
            if llm_responses and len(llm_responses) > 0:
                raw_response = llm_responses[0].get("raw_response", {})
                if isinstance(raw_response, dict) and "error" in raw_response:
                    llm_error = raw_response

        # Create task response
        task = TaskListResponse(
            **task_data,
            llm_error=llm_error
        )
        tasks.append(task)

    return tasks, total

def clean_json_string(json_str: str) -> str:
    """Clean JSON string by removing null bytes and invalid Unicode characters"""
    # Remove null bytes
    cleaned = json_str.replace('\u0000', '')
    # Remove other invalid Unicode characters
    cleaned = re.sub(r'[\x00-\x1F\x7F-\x9F]', '', cleaned)
    return cleaned

def parse_raw_response(raw_response: Union[str, Dict[str, Any]]) -> Dict[str, Any]:
    """Parse and clean raw response into a dictionary"""
    if isinstance(raw_response, str):
        try:
            # Clean the JSON string before parsing
            cleaned_json = clean_json_string(raw_response)
            return json.loads(cleaned_json)
        except json.JSONDecodeError as e:
            # If JSON parsing fails, return as error object
            return {
                "error": "Failed to parse JSON",
                "raw_text": raw_response,
                "json_error": str(e)
            }
    return raw_response

def store_llm_response(task_id: UUID, raw_response: Union[str, Dict[str, Any]]) -> LLMResponse:
    """Store the raw LLM response in the database"""
    try:
        # Parse and clean the response
        parsed_response = parse_raw_response(raw_response)

        data = {
            "task_id": str(task_id),
            "raw_response": parsed_response
        }

        response = supabase.table("llm_responses").insert(data).execute()

        if not response.data:
            raise Exception("Failed to store LLM response")

        return LLMResponse(**response.data[0])
    except Exception as e:
        # If storing fails, try to store a simplified error response
        fallback_data = {
            "task_id": str(task_id),
            "raw_response": {
                "error": str(e),
                "original_response_type": type(raw_response).__name__
            }
        }
        response = supabase.table("llm_responses").insert(fallback_data).execute()
        return LLMResponse(**response.data[0])