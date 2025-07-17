from supabase import create_client, Client
from .schemas import (
    ReceiptCreate, ReceiptUpdate, ReceiptResponse, ReceiptData,
    ReceiptProcessingTask, ReceiptProcessingCreate, ProcessingStatus,
    ReceiptListResponse, LLMResponse
)
from typing import List, Optional, Dict, Any, Union
from uuid import UUID
import os
import asyncio
import aiohttp
import json
from datetime import datetime, date
from fastapi import UploadFile
from google import genai
from google.genai import types
from decimal import Decimal
import base64
import re
from ..tasks.service import (
    create_processing_task,
    update_processing_task_status,
    store_llm_response,
    ProcessingStatus
)

SUPABASE_URL = os.getenv("SUPABASE_URL")
SUPABASE_KEY = os.getenv("SUPABASE_ANON_KEY")
GEMINI_API_KEY = os.getenv("GEMINI_API_KEY")

CLOUDINARY_CLOUD_NAME = os.getenv("CLOUDINARY_CLOUD_NAME")
CLOUDINARY_API_KEY = os.getenv("CLOUDINARY_API_KEY")
CLOUDINARY_API_SECRET = os.getenv("CLOUDINARY_API_SECRET")
CLOUDINARY_UPLOAD_URL = f"https://api.cloudinary.com/v1_1/{CLOUDINARY_CLOUD_NAME}/image/upload"

supabase: Client = create_client(SUPABASE_URL, SUPABASE_KEY)

# Receipt processing task functions
def create_processing_task(user_id: UUID, image_url: str) -> ReceiptProcessingTask:
    """Create a new receipt processing task"""
    data = {
        "user_id": str(user_id),
        "status": ProcessingStatus.PENDING.value,
        "image_url": image_url
    }

    response = supabase.table("receipt_processing_tasks").insert(data).execute()

    if not response.data:
        raise Exception("Failed to create processing task")

    return ReceiptProcessingTask(**response.data[0])

def get_processing_task(task_id: UUID, user_id: UUID) -> Optional[ReceiptProcessingTask]:
    """Get a specific processing task by ID"""
    response = supabase.table("receipt_processing_tasks").select("*").eq("id", str(task_id)).eq("user_id", str(user_id)).execute()

    if not response.data:
        return None

    return ReceiptProcessingTask(**response.data[0])

def update_processing_task_status(task_id: UUID, status: ProcessingStatus, receipt_id: Optional[UUID] = None, error_message: Optional[str] = None, exception_details: Optional[str] = None) -> ReceiptProcessingTask:
    """Update the status of a processing task"""
    update_data = {
        "status": status.value,
        "updated_at": datetime.utcnow().isoformat()
    }
    if receipt_id:
        update_data["receipt_id"] = str(receipt_id)
    if error_message:
        update_data["error_message"] = error_message
    if exception_details:
        update_data["exception_details"] = exception_details
    response = supabase.table("receipt_processing_tasks").update(update_data).eq("id", str(task_id)).execute()
    if not response.data:
        raise Exception("Failed to update processing task")
    return ReceiptProcessingTask(**response.data[0])

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

async def process_receipt_with_gemini(task_id: UUID, image_url: str) -> ReceiptData:
    """Process receipt image with Gemini LLM using the official google-genai client and gemini-2.5-flash model."""
    if not GEMINI_API_KEY:
        raise Exception("GEMINI_API_KEY not configured")

    client = genai.Client(api_key=GEMINI_API_KEY)

    # Download the image from Cloudinary
    import requests
    response = requests.get(image_url)
    if response.status_code != 200:
        raise Exception(f"Failed to download image from Cloudinary: {response.status_code}")
    image_bytes = response.content

    # Prepare the prompt
    prompt = """
    You are ReceiptParserGPT, a highly accurate document‐understanding AI specialized in parsing purchase receipts. Your job is to extract structured data in JSON, minimize hallucinations, and leave any field blank if your confidence is below 80%.

    Please process the following receipt image and produce ONLY a valid JSON object with this exact structure:

    {
    "isValid": "boolean", // true if the image is a receipt and data could be extracted; false otherwise
    "merchantInfo": {
        "name": "string | null",  // Full name of the merchant/store
        "taxId": "string | null", // tax ID, company registration
        "additionalInfo": "string | null" // Any other merchant-related text
    },
    "location": {
        "address": "string | null", // Full street address
        "city": "string | null",
        "state": "string | null", // If applicable (e.g., US receipts)
        "zipCode": "string | null",
        "country": "string | null" // Infer from context if not explicit
    },
    "buyerInfo": {
        "name": "string | null",
        "taxId": "string | null",
        "address": "string | null",
        "zipCode": "string | null",
        "city": "string | null",
        "state": "string | null",
        "country": "string | null",
        "phone": "string | null",
        "email": "string | null"
    },
    "dateTime": "string | null", // ISO 8601 format (YYYY-MM-DDTHH:MM:SS) for purchase date and time
    "items": [ // Array of purchased items
        {
        "description": "string", // Name/description of the item
        "itemCode": "string | null", // Item code
        "category": "string | null", // Infer category (e.g., "Fuel", "Beverage", "Food")
        "unitPrice": "number | null", // Price per unit of the item (decimal)
        "quantity": "number", // Quantity purchased (decimal, can be e.g., liters, units)
        "lineTotal": "number", // Total price for this specific item line (decimal)
        "currency": "string" // Currency code (e.g., "Ft", "EUR", "USD")
        }
    ],
    "financialSummary": {
        "subtotal": "number | null", // Total before taxes and discounts
        "taxAmount": "number | null", // Total tax amount
        "finalTotal": "number", // The absolute final total amount paid (decimal)
        "currency": "string" // Primary currency of the transaction
    },
    "taxDetails": [ // Optional: breakdown of taxes if present
        {
        "rate": "string | null", // Tax rate as percentage string (e.g., "5%", "27%")
        "taxableAmount": "number | null", // Amount to which this tax rate applies
        "taxAmount": "number | null", // Actual tax amount for this rate
        "totalWithTax": "number | null", // Amount including this tax
        "currency": "string"
        }
    ],
    "discounts": [ // Optional: Array of discounts if present
        {
        "description": "string", // Description of the discount
        "amount": "number", // Discount amount (decimal)
        "currency": "string"
        }
    ],
    "serviceCharge": { // Optional: service charge details
        "percentage": "string | null", // Service charge percentage (e.g., "12%")
        "amount": "number | null", // Service charge amount (decimal)
        "currency": "string | null"
    },
    "paymentInfo": {
        "type": "string | null", // Payment method (e.g., "BANKKARTYA", "Cash", "Credit Card")
        "terminalId": "string | null",
        "transactionId": "string | null", // Any transaction ID or reference
        "slip": "string | null", // Slip number
        "bankCardType": "string | null" // Specific card type if mentioned
    },
    "exchangeRate": { // If currency conversion is shown
        "currency": "string | null", // Target currency (e.g., "EUR")
        "rate": "number | null", // Exchange rate (decimal)
        "equivalentAmount": "number | null" // Equivalent amount in the target currency
    },
    "notes": [ // Array of any additional printed notes or messages on the receipt
        "string"
    ],
    "handwrittenNotes": [ // Array of any handwritten annotations on the receipt
        "string"
    ]
    }

    Rules:
    1. If the image is not a purchase receipt or you cannot extract any meaningful data, set `"isValid": false` and return only `{ "isValid": false }`.
    2. If `"isValid": true`, populate the rest of the fields; otherwise omit them.
    3. If the same "description" appears multiple times, merge into one entry, summing "quantity" and "total_price" (keep "unit_price" unchanged).
    4. Category should be inferred from the description.
    5. Unit price should be inferred if not provided.
    6. Also, if the receipt contains buyer information (typically when issued to a company or private customer), extract it into the buyerInfo field. This includes the buyer’s name, tax ID (if a company), and address components (zip code, city, state, country, street). If any of these fields cannot be confidently extracted (confidence below 80%), leave them as null.
    7. Output only the raw JSON object without any surrounding code fences, markdown, or additional text.
    """


    # Use the Gemini client to process the image with the correct multimodal format
    result = client.models.generate_content(
        model="gemini-2.5-flash",
        contents=[
            {
                "role": "user",
                "parts": [
                    {"text": prompt},
                    {"inline_data": {"mime_type": "image/jpeg", "data": image_bytes}}
                ]
            }
        ],
        config={
            "response_mime_type": "application/json",
            "response_schema": ReceiptData,
        }
    )

    # The result should be a JSON string
    try:
        print(result.text)

        # Store the raw response first
        store_llm_response(task_id, result.text)

        return result.parsed
    except Exception as e:
        # Store the failed response for debugging
        store_llm_response(task_id, {
            "error": str(e),
            "raw_text": getattr(result, 'text', 'No text available')
        })
        raise

async def process_receipt_task(task_id: UUID, user_id: UUID, image_url: str):
    """Background task to process receipt with Gemini"""
    try:
        # Update status to processing
        update_processing_task_status(task_id, ProcessingStatus.PROCESSING)

        # Process with Gemini
        receipt_data = await process_receipt_with_gemini(task_id, image_url)

        # Create receipt in database
        receipt_create = ReceiptCreate(receipt_data=receipt_data, image_url=image_url)
        receipt = create_receipt(user_id, receipt_create)

        # Update task status to completed
        update_processing_task_status(task_id, ProcessingStatus.COMPLETED, receipt_id=receipt.id)
    except Exception as e:
        import traceback, json
        tb = traceback.format_exc()
        update_processing_task_status(
            task_id,
            ProcessingStatus.FAILED,
            error_message=str(e),
            exception_details=json.dumps({"error": str(e), "traceback": tb})
        )

# Original receipt functions

def create_buyer_from_receipt(buyer_info: dict) -> Optional[str]:
    """Create a buyer entry if buyer_info is present and return its ID."""
    if not buyer_info or not buyer_info.get("name"):
        return None

    data = {
        "name": buyer_info.get("name"),
        "tax_id": buyer_info.get("taxId"),
        "address": buyer_info.get("address"),
        "zip_code": buyer_info.get("zipCode"),
        "city": buyer_info.get("city"),
        "state": buyer_info.get("state"),
        "country": buyer_info.get("country"),
        "phone": buyer_info.get("phone"),
        "email": buyer_info.get("email"),
    }
    response = supabase.table("buyers").insert(data).execute()
    if not response.data:
        return None
    return response.data[0]["id"]

def create_receipt(user_id: UUID, receipt_data: ReceiptCreate) -> ReceiptResponse:
    """Create a new receipt for a user"""
    merchant_name = receipt_data.receipt_data.merchant_info.name if receipt_data.receipt_data.merchant_info else None
    total_amount = receipt_data.receipt_data.financial_summary.final_total if receipt_data.receipt_data.financial_summary else None
    currency = receipt_data.receipt_data.financial_summary.currency if receipt_data.receipt_data.financial_summary and hasattr(receipt_data.receipt_data.financial_summary, 'currency') else None
    date_str = receipt_data.receipt_data.date_time if receipt_data.receipt_data.date_time else None
    date_val = None
    if date_str:
        try:
            date_val = date.fromisoformat(date_str[:10])
        except Exception:
            date_val = None
    date_for_db = date_val.isoformat() if date_val else None

    # ÚJ: buyer mentése
    buyer_info = receipt_data.receipt_data.buyer_info.model_dump(by_alias=True) if receipt_data.receipt_data.buyer_info else None
    buyer_id = create_buyer_from_receipt(buyer_info) if buyer_info and buyer_info.get("name") else None

    data = {
        "user_id": str(user_id),
        "receipt_data": receipt_data.receipt_data.model_dump(by_alias=True),
        "merchant": merchant_name,
        "total": total_amount,
        "currency": currency,
        "date": date_for_db,
        "image_url": str(receipt_data.image_url) if receipt_data.image_url else None,
        "buyer_id": str(buyer_id) if buyer_id else None,  # ÚJ
    }
    response = supabase.table("receipts").insert(data).execute()
    if not response.data:
        raise Exception("Failed to create receipt")
    return ReceiptResponse(**response.data[0])

def get_receipt(receipt_id: UUID, user_id: UUID) -> Optional[ReceiptResponse]:
    """Get a specific receipt by ID for a user, including buyer name if available"""
    response = supabase.table("receipts").select("*").eq("id", str(receipt_id)).eq("user_id", str(user_id)).execute()

    if not response.data:
        return None

    receipt = response.data[0]
    buyer_name = None
    if receipt.get("buyer_id"):
        buyer_resp = supabase.table("buyers").select("name").eq("id", receipt["buyer_id"]).execute()
        if buyer_resp.data:
            buyer_name = buyer_resp.data[0].get("name")
    return ReceiptResponse(**{**receipt, "buyer": buyer_name})

def get_user_receipts(user_id: UUID, limit: int = 50, offset: int = 0) -> tuple[List[ReceiptListResponse], int]:
    """Get all receipts for a user with pagination"""
    response = supabase.table("receipts") \
        .select(
        "id, user_id, merchant, total, currency, date, image_url, created_at",
        count="exact"
    ) \
        .eq("user_id", str(user_id)) \
        .eq("receipt_data->>isValid", "true") \
        .order("created_at", desc=True) \
        .range(offset, offset + limit - 1) \
        .execute()

    total = response.count if hasattr(response, 'count') else 0

    if not response.data:
        return [], total

    return [ReceiptListResponse(**receipt) for receipt in response.data], total

def update_receipt(receipt_id: UUID, user_id: UUID, receipt_data: ReceiptUpdate) -> Optional[ReceiptResponse]:
    """Update a receipt"""
    update_data = {}
    if receipt_data.receipt_data is not None:
        update_data["receipt_data"] = receipt_data.receipt_data.model_dump(by_alias=True)
    if receipt_data.image_url is not None:
        update_data["image_url"] = str(receipt_data.image_url)

    if not update_data:
        return get_receipt(receipt_id, user_id)

    response = supabase.table("receipts").update(update_data).eq("id", str(receipt_id)).eq("user_id", str(user_id)).execute()

    if not response.data:
        return None

    return ReceiptResponse(**response.data[0])

def delete_receipt(receipt_id: UUID, user_id: UUID) -> bool:
    """Delete a receipt"""
    response = supabase.table("receipts").delete().eq("id", str(receipt_id)).eq("user_id", str(user_id)).execute()

    return len(response.data) > 0

def search_receipts(user_id: UUID, merchant: Optional[str] = None, min_total: Optional[float] = None, max_total: Optional[float] = None, start_date: Optional[str] = None, end_date: Optional[str] = None) -> List[ReceiptResponse]:
    """Search receipts with filters"""
    query = supabase.table("receipts").select("*").eq("user_id", str(user_id))

    if merchant:
        query = query.eq("merchant", merchant)
    if min_total is not None:
        query = query.gte("total", min_total)
    if max_total is not None:
        query = query.lte("total", max_total)
    if start_date:
        query = query.gte("date", start_date)
    if end_date:
        query = query.lte("date", end_date)

    response = query.order("created_at", desc=True).execute()

    return [ReceiptResponse(**receipt) for receipt in response.data]

def search_receipts_by_category(user_id: UUID, category: str) -> List[ReceiptResponse]:
    """Search receipts by item category"""
    # This is a simplified implementation. In a real application, you might want to:
    # 1. Use a more sophisticated search mechanism
    # 2. Add proper indexing for JSON fields
    # 3. Consider moving categories to a separate table
    response = supabase.table("receipts") \
        .select("*") \
        .eq("user_id", str(user_id)) \
        .execute()

    matching_receipts = []
    for receipt_data in response.data:
        receipt = ReceiptResponse(**receipt_data)
        # Check if any item in the receipt matches the category
        if any(item.category and item.category.lower() == category.lower()
               for item in receipt.receipt_data.items):
            matching_receipts.append(receipt)

    return matching_receipts

def get_receipt_statistics(user_id: UUID) -> Dict[str, Any]:
    """Get receipt statistics for a user"""
    response = supabase.table("receipts") \
        .select("*") \
        .eq("user_id", str(user_id)) \
        .execute()

    if not response.data:
        return {
            "total_receipts": 0,
            "total_spent": 0,
            "average_transaction": 0,
            "categories": {}
        }

    receipts = [ReceiptResponse(**r) for r in response.data]

    # Calculate basic statistics
    total_receipts = len(receipts)
    total_spent = sum(r.total for r in receipts if r.total is not None)
    average_transaction = total_spent / total_receipts if total_receipts > 0 else 0

    # Calculate category statistics
    categories = {}
    for receipt in receipts:
        for item in receipt.receipt_data.items:
            if item.category:
                if item.category not in categories:
                    categories[item.category] = {
                        "count": 0,
                        "total_spent": 0
                    }
                categories[item.category]["count"] += item.quantity
                categories[item.category]["total_spent"] += item.line_total

    return {
        "total_receipts": total_receipts,
        "total_spent": total_spent,
        "average_transaction": average_transaction,
        "categories": categories
    }

async def upload_image_to_cloudinary(file: UploadFile) -> str:
    """Upload an image to Cloudinary and return the public URL."""
    if not CLOUDINARY_CLOUD_NAME or not CLOUDINARY_API_KEY or not CLOUDINARY_API_SECRET:
        raise Exception("Cloudinary credentials are not set.")

    CLOUDINARY_UPLOAD_PRESET = os.getenv("CLOUDINARY_UPLOAD_PRESET")
    if not CLOUDINARY_UPLOAD_PRESET:
        raise Exception("Cloudinary upload preset is not set.")

    data = aiohttp.FormData()
    data.add_field('file', await file.read(), filename=file.filename, content_type=file.content_type)
    data.add_field('upload_preset', CLOUDINARY_UPLOAD_PRESET)

    async with aiohttp.ClientSession() as session:
        async with session.post(CLOUDINARY_UPLOAD_URL, data=data) as resp:
            if resp.status != 200:
                text = await resp.text()
                raise Exception(f"Cloudinary upload failed: {resp.status} {text}")
            result = await resp.json()
            if not result.get("secure_url"):
                raise Exception(f"Cloudinary upload error: {result}")
            return result["secure_url"]