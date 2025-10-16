-- Create schema
CREATE SCHEMA IF NOT EXISTS student3;

-- Source table
CREATE TABLE IF NOT EXISTS student3.superstore (
    id SERIAL NOT NULL,
    ship_mode VARCHAR(50) NOT NULL,
    segment VARCHAR(50) NOT NULL,
    country VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    region VARCHAR(20) NOT NULL,
    category VARCHAR(50) NOT NULL,
    sub_category VARCHAR(50) NOT NULL,
    sales NUMERIC(12,4) NOT NULL,
    quantity INTEGER NOT NULL,
    discount NUMERIC(4,2) NOT NULL,
    profit NUMERIC(12,4) NOT NULL
)
DISTRIBUTED BY (id);
;