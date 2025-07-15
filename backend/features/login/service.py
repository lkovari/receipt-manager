from supabase import create_client, Client
from .schemas import LoginRequest, LoginResponse
import os

SUPABASE_URL = os.getenv("SUPABASE_URL")
SUPABASE_KEY = os.getenv("SUPABASE_ANON_KEY")

supabase: Client = create_client(SUPABASE_URL, SUPABASE_KEY)

def login_user(login_data: LoginRequest) -> LoginResponse:
    # Call Supabase Auth API
    response = supabase.auth.sign_in_with_password({
        "email": login_data.email,
        "password": login_data.password
    })
    session = getattr(response, "session", None)
    if not session or not getattr(session, "access_token", None):
        raise Exception("Invalid credentials")
    access_token = session.access_token
    refresh_token = session.refresh_token
    expires_in = session.expires_in
    expires_at = session.expires_at
    return LoginResponse(
        access_token=access_token,
        refresh_token=refresh_token,
        expires_in=expires_in,
        expires_at=expires_at
    )

def refresh_token_user(refresh_token: str) -> LoginResponse:
    response = supabase.auth.refresh_session(refresh_token)
    session = getattr(response, "session", None)
    if not session or not getattr(session, "access_token", None):
        raise Exception("Invalid refresh token")
    access_token = session.access_token
    refresh_token = session.refresh_token
    expires_in = session.expires_in
    expires_at = session.expires_at
    return LoginResponse(
        access_token=access_token,
        refresh_token=refresh_token,
        expires_in=expires_in,
        expires_at=expires_at
    )