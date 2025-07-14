from pydantic import BaseModel, Field
from typing import Optional, Dict, Any, List
from datetime import datetime
from uuid import UUID
from enum import Enum

class ProcessingStatus(str, Enum):
    PENDING = "pending"
    PROCESSING = "processing"
    COMPLETED = "completed"
    FAILED = "failed"

class TaskListResponse(BaseModel):
    id: UUID
    user_id: UUID
    status: ProcessingStatus
    receipt_id: Optional[UUID] = None
    error_message: Optional[str] = None
    created_at: datetime
    updated_at: datetime
    llm_error: Optional[Dict[str, Any]] = None

    class Config:
        from_attributes = True
        json_encoders = {
            datetime: lambda v: v.isoformat() if v else None,
        }

class TaskCreateRequest(BaseModel):
    user_id: UUID
    image_url: str

class TaskStatusResponse(BaseModel):
    id: UUID = Field(..., description="The task ID")
    user_id: UUID
    status: ProcessingStatus
    receipt_id: Optional[UUID] = None
    error_message: Optional[str] = None
    created_at: datetime
    updated_at: datetime
    image_url: Optional[str] = None
    exception_details: Optional[str] = None

    class Config:
        from_attributes = True
        json_encoders = {
            datetime: lambda v: v.isoformat() if v else None,
        }

class LLMResponse(BaseModel):
    id: UUID
    task_id: UUID
    raw_response: Dict[str, Any]
    created_at: datetime

    class Config:
        from_attributes = True
        json_encoders = {
            datetime: lambda v: v.isoformat() if v else None,
        }