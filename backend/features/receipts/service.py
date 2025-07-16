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

def create_processing_task_with_token(user_id: UUID, image_url: str, access_token: str) -> ReceiptProcessingTask:
    """Create a new receipt processing task using Supabase REST API with token auth"""
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
    logger.info("Authorization header (Bearer token provided)")

    response = requests.post(
        f"{SUPABASE_URL}/rest/v1/receipt_processing_tasks",
        headers=headers,
        json=payload
    )

    try:
        jwt_payload = jwt.decode(access_token, options={"verify_signature": False})
        logger.debug("Token sub: %s", jwt_payload.get("sub"))
        logger.debug("Expected user_id: %s", user_id)
    except Exception as e:
        logger.warning("Could not decode JWT token: %s", str(e))

    if response.status_code != 201:
        logger.error("Supabase insert failed: %s - %s", response.status_code, response.text)
        raise Exception(f"Failed to insert processing task: {response.status_code} - {response.text}")

    return ReceiptProcessingTask(**response.json()[0])

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
    """Get a specific receipt by ID for a user"""
    response = supabase.table("receipts").select("*").eq("id", str(receipt_id)).eq("user_id", str(user_id)).execute()
    if not response.data:
        return None
    return ReceiptResponse(**response.data[0])
