-- Receipt Manager Database Schema
-- Run this in your Supabase SQL editor

-- Create receipts table with JSONB support
CREATE TABLE IF NOT EXISTS receipts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
    receipt_data JSONB NOT NULL,
    merchant TEXT,
    total DECIMAL,
    date DATE,
    image_url TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create receipt processing tasks table
CREATE TABLE IF NOT EXISTS receipt_processing_tasks (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
    status TEXT NOT NULL CHECK (status IN ('pending', 'processing', 'completed', 'failed')),
    image_url TEXT,
    receipt_id UUID REFERENCES receipts(id) ON DELETE SET NULL,
    error_message TEXT,
    exception_details TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create table for storing LLM responses
CREATE TABLE llm_responses (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    task_id UUID NOT NULL REFERENCES receipt_processing_tasks(id) ON DELETE CASCADE,
    raw_response JSONB NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT fk_task FOREIGN KEY (task_id) REFERENCES receipt_processing_tasks(id)
);

-- Create indexes for performance
CREATE INDEX IF NOT EXISTS idx_receipts_user_id ON receipts(user_id);
CREATE INDEX IF NOT EXISTS idx_receipts_merchant ON receipts(merchant);
CREATE INDEX IF NOT EXISTS idx_receipts_total ON receipts(total);
CREATE INDEX IF NOT EXISTS idx_receipts_date ON receipts(date);
CREATE INDEX IF NOT EXISTS idx_receipts_created_at ON receipts(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_receipts_jsonb ON receipts USING GIN(receipt_data);

-- Indexes for processing tasks
CREATE INDEX IF NOT EXISTS idx_processing_tasks_user_id ON receipt_processing_tasks(user_id);
CREATE INDEX IF NOT EXISTS idx_processing_tasks_status ON receipt_processing_tasks(status);
CREATE INDEX IF NOT EXISTS idx_processing_tasks_created_at ON receipt_processing_tasks(created_at DESC);

-- Enable Row Level Security (RLS)
ALTER TABLE receipts ENABLE ROW LEVEL SECURITY;
ALTER TABLE receipt_processing_tasks ENABLE ROW LEVEL SECURITY;

-- Create RLS policies for receipts
CREATE POLICY "Users can view their own receipts" ON receipts
    FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert their own receipts" ON receipts
    FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own receipts" ON receipts
    FOR UPDATE USING (auth.uid() = user_id);

CREATE POLICY "Users can delete their own receipts" ON receipts
    FOR DELETE USING (auth.uid() = user_id);

-- Create RLS policies for processing tasks
CREATE POLICY "Users can view their own processing tasks" ON receipt_processing_tasks
    FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert their own processing tasks" ON receipt_processing_tasks
    FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own processing tasks" ON receipt_processing_tasks
    FOR UPDATE USING (auth.uid() = user_id);

CREATE POLICY "Users can delete their own processing tasks" ON receipt_processing_tasks
    FOR DELETE USING (auth.uid() = user_id);

-- Create function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Create trigger to automatically update updated_at for receipts
CREATE TRIGGER update_receipts_updated_at
    BEFORE UPDATE ON receipts
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- Create trigger to automatically update updated_at for processing tasks
CREATE TRIGGER update_processing_tasks_updated_at
    BEFORE UPDATE ON receipt_processing_tasks
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- Create index for faster lookups by task_id
CREATE INDEX idx_llm_responses_task_id ON llm_responses(task_id);

-- Example receipt data structure from Gemini LLM:
-- {
--   "isValid": true,
--   "merchantInfo": {
--     "name": "Walmart",
--     "taxId": "123456789",
--     "additionalInfo": "Store #1234"
--   },
--   "location": {
--     "address": "123 Main St",
--     "city": "Springfield",
--     "state": "IL",
--     "zipCode": "62701",
--     "country": "USA"
--   },
--   "dateTime": "2024-01-15T10:30:00",
--   "items": [
--     {
--       "description": "Milk",
--       "itemCode": "SKU123",
--       "category": "dairy",
--       "unitPrice": 3.99,
--       "quantity": 2,
--       "lineTotal": 7.98,
--       "currency": "USD"
--     }
--   ],
--   "financialSummary": {
--     "subtotal": 43.33,
--     "taxAmount": 2.34,
--     "finalTotal": 45.67,
--     "currency": "USD"
--   },
--   "taxDetails": [
--     {
--       "rate": "5%",
--       "taxableAmount": 43.33,
--       "taxAmount": 2.34,
--       "totalWithTax": 45.67,
--       "currency": "USD"
--     }
--   ],
--   "discounts": [
--     {
--       "description": "Loyalty discount",
--       "amount": 2.00,
--       "currency": "USD"
--     }
--   ],
--   "serviceCharge": {
--     "percentage": "12%",
--     "amount": 5.48,
--     "currency": "USD"
--   },
--   "paymentInfo": {
--     "type": "Credit Card",
--     "terminalId": "TERM123",
--     "transactionId": "TXN456",
--     "slip": "SLIP789",
--     "bankCardType": "Visa"
--   },
--   "exchangeRate": {
--     "currency": "EUR",
--     "rate": 0.85,
--     "equivalentAmount": 38.82
--   },
--   "notes": [
--     "Thank you for shopping with us!",
--     "Please keep your receipt for returns"
--   ],
--   "handwrittenNotes": [
--     "Buy more milk next time"
--   ]
-- }