from fastapi import APIRouter, HTTPException, Depends
from .schemas import LoginRequest, LoginResponse
from .service import login_user, refresh_token_user
from pydantic import BaseModel

router = APIRouter(
    tags=["Auth"],
    prefix="/auth"
)

@router.post("/login", response_model=LoginResponse)
def login(login_data: LoginRequest):
    try:
        return login_user(login_data)
    except Exception as e:
        raise HTTPException(status_code=401, detail=str(e))

class RefreshRequest(BaseModel):
    refresh_token: str

@router.post("/refresh", response_model=LoginResponse)
def refresh_token_endpoint(refresh: RefreshRequest):
    try:
        return refresh_token_user(refresh.refresh_token)
    except Exception as e:
        raise HTTPException(status_code=401, detail=str(e))