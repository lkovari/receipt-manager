-- Receipts table
CREATE TABLE receipts (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid NOT NULL,
    receipt_data jsonb NOT NULL,
    merchant text,
    total numeric,
    currency varchar(10),
    date date,
    image_url text,
    created_at timestamptz DEFAULT now(),
    updated_at timestamptz DEFAULT now()
);

CREATE INDEX idx_receipts_user_id ON receipts(user_id);

-- Receipt processing tasks table
CREATE TABLE receipt_processing_tasks (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid NOT NULL,
    status text NOT NULL,
    image_url text,
    receipt_id uuid,
    error_message text,
    exception_details jsonb,
    created_at timestamptz DEFAULT now(),
    updated_at timestamptz DEFAULT now()
);

CREATE INDEX idx_tasks_user_id ON receipt_processing_tasks(user_id);

-- LLM responses table
CREATE TABLE llm_responses (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    task_id uuid NOT NULL,
    raw_response jsonb NOT NULL,
    created_at timestamptz DEFAULT now()
);

CREATE INDEX idx_llm_task_id ON llm_responses(task_id);

-- Enable Row Level Security (RLS) and add a basic policy for receipts
ALTER TABLE receipts ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can view their own receipts"
    ON receipts
    FOR SELECT
    USING (user_id = auth.uid());

-- Enable RLS and add a basic policy for receipt_processing_tasks
ALTER TABLE receipt_processing_tasks ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can view their own tasks"
    ON receipt_processing_tasks
    FOR SELECT
    USING (user_id = auth.uid());

-- Enable RLS and add a basic policy for llm_responses
ALTER TABLE llm_responses ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can view their own llm responses"
    ON llm_responses
    FOR SELECT
    USING (
        task_id IN (
            SELECT id FROM receipt_processing_tasks WHERE user_id = auth.uid()
        )
    );