import logging
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
import requests
import jwt

from ..tasks.service import (
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
logger = logging.getLogger(__name__)

# --- full receipt service ---

def create_processing_task_with_token(user_id: UUID, image_url: str, access_token: str) -> ReceiptProcessingTask:
    headers = {
        "apikey": SUPABASE_KEY,
        "Authorization": f"Bearer {access_token}",
        "Content-Type": "application/json"
    }
    payload = {
        "user_id": str(user_id),
        "status": ProcessingStatus.PENDING.value,
        "image_url": image_url
    }
    logger.info("Sending insert request to Supabase with user_id: %s", user_id)
    response = requests.post(f"{SUPABASE_URL}/rest/v1/receipt_processing_tasks", headers=headers, json=payload)
    try:
        jwt_payload = jwt.decode(access_token, options={"verify_signature": False})
        logger.debug("Token sub: %s", jwt_payload.get("sub"))
        logger.debug("Expected user_id: %s", user_id)
    except Exception as e:
        logger.warning("Could not decode JWT token: %s", str(e))
    if response.status_code != 201:
        raise Exception(f"Failed to insert processing task: {response.status_code} - {response.text}")
    return ReceiptProcessingTask(**response.json()[0])

def create_receipt(user_id: UUID, receipt_data: ReceiptCreate) -> ReceiptResponse:
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
    data = {
        "user_id": str(user_id),
        "receipt_data": receipt_data.receipt_data.model_dump(by_alias=True),
        "merchant": merchant_name,
        "total": total_amount,
        "currency": currency,
        "date": date_for_db,
        "image_url": str(receipt_data.image_url) if receipt_data.image_url else None
    }
    response = supabase.table("receipts").insert(data).execute()
    if not response.data:
        raise Exception("Failed to create receipt")
    return ReceiptResponse(**response.data[0])

def get_receipt(receipt_id: UUID, user_id: UUID) -> Optional[ReceiptResponse]:
    response = supabase.table("receipts").select("*").eq("id", str(receipt_id)).eq("user_id", str(user_id)).execute()
    if not response.data:
        return None
    return ReceiptResponse(**response.data[0])

def get_user_receipts(user_id: UUID, limit: int = 50, offset: int = 0) -> tuple[List[ReceiptListResponse], int]:
    response = supabase.table("receipts") \
        .select("id, user_id, merchant, total, currency, date, image_url, created_at", count="exact") \
        .eq("user_id", str(user_id)) \
        .eq("receipt_data->>isValid", "true") \
        .order("created_at", desc=True) \
        .range(offset, offset + limit - 1) \
        .execute()
    total = response.count if hasattr(response, 'count') else 0
    if not response.data:
        return [], total
    return [ReceiptListResponse(**r) for r in response.data], total

def update_receipt(receipt_id: UUID, user_id: UUID, receipt_data: ReceiptUpdate) -> Optional[ReceiptResponse]:
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
    response = supabase.table("receipts").delete().eq("id", str(receipt_id)).eq("user_id", str(user_id)).execute()
    return len(response.data) > 0

def search_receipts(user_id: UUID, merchant: Optional[str] = None, min_total: Optional[float] = None, max_total: Optional[float] = None, start_date: Optional[str] = None, end_date: Optional[str] = None) -> List[ReceiptResponse]:
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
    return [ReceiptResponse(**r) for r in response.data]

def search_receipts_by_category(user_id: UUID, category: str) -> List[ReceiptResponse]:
    response = supabase.table("receipts").select("*").eq("user_id", str(user_id)).execute()
    return [r for r in (ReceiptResponse(**d) for d in response.data) if any(i.category and i.category.lower() == category.lower() for i in r.receipt_data.items)]

def get_receipt_statistics(user_id: UUID) -> Dict[str, Any]:
    response = supabase.table("receipts").select("*").eq("user_id", str(user_id)).execute()
    if not response.data:
        return {"total_receipts": 0, "total_spent": 0, "average_transaction": 0, "categories": {}}
    receipts = [ReceiptResponse(**r) for r in response.data]
    total_spent = sum(r.total for r in receipts if r.total)
    total_receipts = len(receipts)
    categories = {}
    for r in receipts:
        for i in r.receipt_data.items:
            if i.category:
                c = i.category
                categories.setdefault(c, {"count": 0, "total_spent": 0})
                categories[c]["count"] += i.quantity
                categories[c]["total_spent"] += i.line_total
    return {
        "total_receipts": total_receipts,
        "total_spent": total_spent,
        "average_transaction": total_spent / total_receipts if total_receipts else 0,
        "categories": categories
    }

async def upload_image_to_cloudinary(file: UploadFile) -> str:
    if not CLOUDINARY_CLOUD_NAME or not CLOUDINARY_API_KEY or not CLOUDINARY_API_SECRET:
        raise Exception("Cloudinary credentials are not set.")
    preset = os.getenv("CLOUDINARY_UPLOAD_PRESET")
    if not preset:
        raise Exception("Cloudinary upload preset is not set.")
    data = aiohttp.FormData()
    data.add_field('file', await file.read(), filename=file.filename, content_type=file.content_type)
    data.add_field('upload_preset', preset)
    async with aiohttp.ClientSession() as session:
        async with session.post(CLOUDINARY_UPLOAD_URL, data=data) as resp:
            if resp.status != 200:
                raise Exception(f"Cloudinary upload failed: {resp.status} {await resp.text()}")
            result = await resp.json()
            return result.get("secure_url")
