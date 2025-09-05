-- Journal API Database Setup
-- Run this SQL in your PostgreSQL database to set up the required table

-- Create the database (run this as a PostgreSQL superuser)
-- CREATE DATABASE career_journal;

-- Connect to the career_journal database and run the following:

-- Create the entries table
CREATE TABLE IF NOT EXISTS entries (
    id VARCHAR PRIMARY KEY,
    data JSONB NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL
);

-- Create an index on created_at for faster queries
CREATE INDEX IF NOT EXISTS idx_entries_created_at ON entries(created_at);

-- Optional: Create an index on the JSON data for faster searches
CREATE INDEX IF NOT EXISTS idx_entries_data_gin ON entries USING GIN (data);

-- Verify the table was created
\d entries;

-- Test with a sample entry (optional)
-- INSERT INTO entries (id, data, created_at, updated_at) 
-- VALUES (
--     'test-123',
--     '{"work": "Learning SQL", "struggle": "Understanding JSON types", "intention": "Practice more queries"}',
--     NOW(),
--     NOW()
-- );

-- Query the test entry
-- SELECT * FROM entries WHERE id = 'test-123';