from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from features.login.routes import router as login_router
from features.receipts.routes import router as receipts_router
from features.tasks.routes import router as tasks_router

app = FastAPI(
    title = "Receipt Manager API",
    description = "Turning crumpled paper chaos into digital order",
    docs_url = "/",
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=[
        "https://receipt-manager-client.onrender.com",
        "*"
    ],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(login_router)
app.include_router(receipts_router)
app.include_router(tasks_router)