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
