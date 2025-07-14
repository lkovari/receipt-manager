from pydantic import BaseModel, HttpUrl, Field
from typing import Optional, Dict, Any, List
from datetime import datetime, date
from uuid import UUID
from enum import Enum
from ..tasks.schemas import ProcessingStatus

# Processing status enum
class ProcessingStatus(str, Enum):
    PENDING = "pending"
    PROCESSING = "processing"
    COMPLETED = "completed"
    FAILED = "failed"

# Nested models for the Gemini LLM output schema
class MerchantInfo(BaseModel):
    name: Optional[str] = None
    tax_id: Optional[str] = Field(None, alias="taxId")
    additional_info: Optional[str] = Field(None, alias="additionalInfo")

class Location(BaseModel):
    address: Optional[str] = None
    city: Optional[str] = None
    state: Optional[str] = None
    zip_code: Optional[str] = Field(None, alias="zipCode")
    country: Optional[str] = None

class ReceiptItem(BaseModel):
    description: str
    item_code: Optional[str] = Field(None, alias="itemCode")
    category: Optional[str] = None
    unit_price: Optional[float] = Field(None, alias="unitPrice")
    quantity: float
    line_total: float = Field(..., alias="lineTotal")
    currency: str

class FinancialSummary(BaseModel):
    subtotal: Optional[float] = None
    tax_amount: Optional[float] = Field(None, alias="taxAmount")
    final_total: float = Field(..., alias="finalTotal")
    currency: str

class TaxDetail(BaseModel):
    rate: Optional[str] = None
    taxable_amount: Optional[float] = Field(None, alias="taxableAmount")
    tax_amount: Optional[float] = Field(None, alias="taxAmount")
    total_with_tax: Optional[float] = Field(None, alias="totalWithTax")
    currency: str

class Discount(BaseModel):
    description: str
    amount: float
    currency: str

class ServiceCharge(BaseModel):
    percentage: Optional[str] = None
    amount: Optional[float] = None
    currency: Optional[str] = None

class PaymentInfo(BaseModel):
    type: Optional[str] = None
    terminal_id: Optional[str] = Field(None, alias="terminalId")
    transaction_id: Optional[str] = Field(None, alias="transactionId")
    slip: Optional[str] = None
    bank_card_type: Optional[str] = Field(None, alias="bankCardType")

class ExchangeRate(BaseModel):
    currency: Optional[str] = None
    rate: Optional[float] = None
    equivalent_amount: Optional[float] = Field(None, alias="equivalentAmount")

class ReceiptData(BaseModel):
    is_valid: bool = Field(..., alias="isValid")
    merchant_info: MerchantInfo = Field(..., alias="merchantInfo")
    location: Location
    date_time: Optional[str] = Field(None, alias="dateTime")
    items: List[ReceiptItem]
    financial_summary: FinancialSummary = Field(..., alias="financialSummary")
    tax_details: Optional[List[TaxDetail]] = Field(None, alias="taxDetails")
    discounts: Optional[List[Discount]] = None
    service_charge: Optional[ServiceCharge] = Field(None, alias="serviceCharge")
    payment_info: PaymentInfo = Field(..., alias="paymentInfo")
    exchange_rate: Optional[ExchangeRate] = Field(None, alias="exchangeRate")
    notes: Optional[List[str]] = None
    handwritten_notes: Optional[List[str]] = Field(None, alias="handwrittenNotes")

    class Config:
        populate_by_name = True

# Processing task schemas
class ReceiptProcessingTask(BaseModel):
    id: UUID
    user_id: UUID
    status: ProcessingStatus
    image_url: Optional[str] = None
    receipt_id: Optional[UUID] = None
    error_message: Optional[str] = None
    created_at: datetime
    updated_at: datetime

    class Config:
        from_attributes = True

class ReceiptProcessingCreate(BaseModel):
    image_url: str

class ReceiptProcessingResponse(BaseModel):
    task_id: UUID
    status: ProcessingStatus
    message: str

class ReceiptProcessingStatusResponse(BaseModel):
    task_id: UUID
    status: ProcessingStatus
    receipt_id: Optional[UUID] = None
    error_message: Optional[str] = None
    created_at: datetime
    updated_at: datetime

    class Config:
        from_attributes = True

# Original receipt schemas
class ReceiptCreate(BaseModel):
    receipt_data: ReceiptData
    image_url: Optional[HttpUrl] = None

class ReceiptUpdate(BaseModel):
    receipt_data: Optional[ReceiptData] = None
    image_url: Optional[HttpUrl] = None

class ReceiptResponse(BaseModel):
    id: UUID
    user_id: UUID
    receipt_data: ReceiptData
    merchant: Optional[str] = None
    total: float
    date: Optional[date]
    image_url: Optional[str] = None
    created_at: datetime

    class Config:
        from_attributes = True
        json_encoders = {
            date: lambda v: v.isoformat() if v else None,
            datetime: lambda v: v.isoformat() if v else None,
        }

class ReceiptListResponse(BaseModel):
    id: UUID
    user_id: UUID
    merchant: Optional[str] = None
    total: float
    currency: Optional[str] = None
    date: Optional[date]
    image_url: Optional[str] = None
    created_at: datetime

    class Config:
        from_attributes = True
        json_encoders = {
            date: lambda v: v.isoformat() if v else None,
            datetime: lambda v: v.isoformat() if v else None,
        }

class LLMResponse(BaseModel):
    id: UUID
    task_id: UUID
    raw_response: Dict[str, Any]
    created_at: datetime

    class Config:
        from_attributes = True
        json_encoders = {
            datetime: lambda v: v.isoformat() if v else None,
        }

class TaskListResponse(BaseModel):
    id: UUID
    user_id: UUID
    status: ProcessingStatus
    receipt_id: Optional[UUID] = None
    error_message: Optional[str] = None
    created_at: datetime
    updated_at: datetime
    llm_error: Optional[Dict[str, Any]] = None

    class Config:
        from_attributes = True
        json_encoders = {
            datetime: lambda v: v.isoformat() if v else None,
        }