from fastapi import APIRouter, HTTPException, Depends, Query, BackgroundTasks, UploadFile, File, Request, Security
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
from .schemas import (
    ReceiptCreate, ReceiptUpdate, ReceiptResponse,
    ReceiptProcessingResponse, ReceiptListResponse
)
from .service import (
    create_processing_task_with_token,
    process_receipt_task,
    upload_image_to_cloudinary
)
from ..tasks.service import update_processing_task_status
from ..common.schemas import PaginatedResponse
from uuid import UUID
from typing import List, Optional
import jwt
import os
import asyncio

router = APIRouter(tags=["Receipts"], prefix="/receipts")

SUPABASE_JWT_SECRET = os.getenv("SUPABASE_JWT_SECRET")
SUPABASE_JWT_AUD = os.getenv("SUPABASE_JWT_AUD", "authenticated")
security = HTTPBearer()

async def get_current_user_id(credentials: HTTPAuthorizationCredentials = Security(security)) -> UUID:
    token = credentials.credentials
    try:
        payload = jwt.decode(token, SUPABASE_JWT_SECRET, audience=SUPABASE_JWT_AUD, algorithms=["HS256"])
        return UUID(payload["sub"])
    except Exception:
        raise HTTPException(status_code=401, detail="Invalid Supabase JWT token")

@router.post("/process", response_model=ReceiptProcessingResponse)
async def process_receipt(
    background_tasks: BackgroundTasks,
    file: UploadFile = File(...),
    user_id: UUID = Depends(get_current_user_id),
    credentials: HTTPAuthorizationCredentials = Security(security)
):
    image_url = await upload_image_to_cloudinary(file)
    token = credentials.credentials

    task = create_processing_task_with_token(user_id, image_url, token)
    background_tasks.add_task(process_receipt_task, task.id, user_id, image_url)
    return ReceiptProcessingResponse(task_id=task.id, image_url=image_url)