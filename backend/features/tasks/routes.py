from fastapi import APIRouter, HTTPException, Depends, Query, Security
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
from typing import List
from uuid import UUID
import jwt
import os
from .schemas import TaskListResponse, TaskStatusResponse
from .service import get_user_tasks, get_processing_task
from ..common.schemas import PaginatedResponse
from pydantic import BaseModel

SUPABASE_JWT_SECRET = os.getenv("SUPABASE_JWT_SECRET")
SUPABASE_JWT_AUD = os.getenv("SUPABASE_JWT_AUD", "authenticated")
security = HTTPBearer()

router = APIRouter(
    tags=["Tasks"],
    prefix="/tasks"
)

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

@router.get("/", response_model=PaginatedResponse[TaskListResponse])
def list_user_tasks(
    limit: int = Query(50, ge=1, le=100),
    offset: int = Query(0, ge=0),
    user_id: UUID = Depends(get_current_user_id)
):
    """Get all receipt processing tasks for the current user with pagination"""
    try:
        tasks, total = get_user_tasks(user_id, limit, offset)
        return PaginatedResponse(
            items=tasks,
            total=total,
            limit=limit,
            offset=offset,
            has_more=(offset + len(tasks) < total)
        )
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@router.get("/{task_id}", response_model=TaskStatusResponse)
def get_task_status(
    task_id: UUID,
    user_id: UUID = Depends(get_current_user_id)
):
    """Get the status of a specific task"""
    task = get_processing_task(task_id, user_id)
    if not task:
        raise HTTPException(status_code=404, detail="Task not found")
    return task