from fastapi import APIRouter, HTTPException, Depends, Query, BackgroundTasks, UploadFile, File, Request, Security, Header
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
from .schemas import (
    ReceiptCreate, ReceiptUpdate, ReceiptResponse,
    ReceiptProcessingResponse, ReceiptListResponse
)
from .service import (
    create_receipt,
    get_receipt,
    get_user_receipts,
    update_receipt,
    delete_receipt,
    search_receipts,
    search_receipts_by_category,
    get_receipt_statistics,
    process_receipt_task,
    upload_image_to_cloudinary,
    create_processing_task
)
from ..common.schemas import PaginatedResponse
from typing import List, Optional
from uuid import UUID
import jwt
import os
import asyncio

router = APIRouter(
    tags=["Receipts"],
    prefix="/receipts"
)

SUPABASE_JWT_SECRET = os.getenv("SUPABASE_JWT_SECRET")
SUPABASE_JWT_AUD = os.getenv("SUPABASE_JWT_AUD", "authenticated")
security = HTTPBearer()

async def get_current_user_id(
    credentials: HTTPAuthorizationCredentials = Security(security)
) -> UUID:
    """Extract user ID from the Authorization header using Supabase JWT."""
    token = credentials.credentials
    try:
        payload = jwt.decode(
            token,
            SUPABASE_JWT_SECRET,
            algorithms=["HS256"],
            audience=SUPABASE_JWT_AUD
        )
        user_id = payload.get("sub")
        if not user_id:
            raise HTTPException(status_code=401, detail="Invalid token: no user id")
        return UUID(user_id)
    except Exception as e:
        raise HTTPException(status_code=401, detail=f"Invalid token: {e}")

def run_process_receipt_task_in_background(task_id, user_id, image_url):
    asyncio.run(process_receipt_task(task_id, user_id, image_url))

# Receipt processing endpoints
@router.post("/process", response_model=ReceiptProcessingResponse)
async def process_receipt_image(
    background_tasks: BackgroundTasks,
    file: UploadFile = File(...),
    user_id: UUID = Depends(get_current_user_id),
    credentials: HTTPAuthorizationCredentials = Security(security),
    x_refresh_token: str = Header(...)
):
    """Upload a receipt image, store it in Cloudinary, and start processing with Gemini LLM"""
    try:
        # Upload image to Cloudinary
        image_url = await upload_image_to_cloudinary(file)

        # Create processing task (átadjuk a JWT access_token-t és refresh_token-t is)
        task = create_processing_task(user_id, image_url, credentials.credentials, x_refresh_token)

        # Add background task for processing (now using sync wrapper)
        background_tasks.add_task(
            run_process_receipt_task_in_background,
            task.id,
            user_id,
            image_url
        )

        return ReceiptProcessingResponse(
            task_id=task.id,
            status=task.status,
            message="Receipt processing started. Check status with /tasks/{task_id}"
        )
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@router.get("/{receipt_id}", response_model=ReceiptResponse)
def get_receipt_by_id(receipt_id: UUID, user_id: UUID = Depends(get_current_user_id)):
    """Get a specific receipt by ID"""
    receipt = get_receipt(receipt_id, user_id)
    if not receipt:
        raise HTTPException(status_code=404, detail="Receipt not found")
    return receipt

@router.get("/", response_model=PaginatedResponse[ReceiptListResponse])
def list_user_receipts(
    limit: int = Query(50, ge=1, le=100),
    offset: int = Query(0, ge=0),
    user_id: UUID = Depends(get_current_user_id)
):
    """Get all receipts for the current user with pagination"""
    try:
        receipts, total = get_user_receipts(user_id, limit, offset)
        return PaginatedResponse(
            items=receipts,
            total=total,
            limit=limit,
            offset=offset,
            has_more=(offset + len(receipts) < total)
        )
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@router.put("/{receipt_id}", response_model=ReceiptResponse)
def update_receipt_by_id(
    receipt_id: UUID,
    receipt_data: ReceiptUpdate,
    user_id: UUID = Depends(get_current_user_id)
):
    """Update a receipt"""
    receipt = update_receipt(receipt_id, user_id, receipt_data)
    if not receipt:
        raise HTTPException(status_code=404, detail="Receipt not found")
    return receipt

# @router.delete("/{receipt_id}")
# def delete_receipt_by_id(receipt_id: UUID, user_id: UUID = Depends(get_current_user_id)):
#     """Delete a receipt"""
#     success = delete_receipt(receipt_id, user_id)
#     if not success:
#         raise HTTPException(status_code=404, detail="Receipt not found")
#     return {"message": "Receipt deleted successfully"}

@router.get("/search/", response_model=List[ReceiptResponse])
def search_user_receipts(
    merchant: Optional[str] = Query(None),
    min_total: Optional[float] = Query(None, ge=0),
    max_total: Optional[float] = Query(None, ge=0),
    start_date: Optional[str] = Query(None),
    end_date: Optional[str] = Query(None),
    user_id: UUID = Depends(get_current_user_id)
):
    """Search receipts with filters"""
    try:
        return search_receipts(
            user_id,
            merchant,
            min_total,
            max_total,
            start_date,
            end_date
        )
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@router.get("/search/category/{category}", response_model=List[ReceiptResponse])
def search_receipts_by_item_category(category: str, user_id: UUID = Depends(get_current_user_id)):
    """Search receipts by item category"""
    try:
        return search_receipts_by_category(user_id, category)
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@router.get("/statistics/")
def get_user_receipt_statistics(user_id: UUID = Depends(get_current_user_id)):
    """Get receipt statistics for the current user"""
    try:
        return get_receipt_statistics(user_id)
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))