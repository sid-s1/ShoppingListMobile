SELECT 'CREATE DATABASE marketplace' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'marketplace') \gexec

-- The above statement within brackets first tries to connect to the database - and if it fails, it runs the SQL statement to create the database

\c marketplace;

CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    buyer_name TEXT,
    business_name TEXT,
    email TEXT,
    hashed_pw TEXT,
    sec_qns TEXT,
    sec_ans TEXT
);

CREATE TABLE IF NOT EXISTS seller_items (
    id SERIAL PRIMARY KEY,
    seller_id INT REFERENCES users (id),
    item_date DATE,
    item_id INT REFERENCES items (id)
);

CREATE TABLE IF NOT EXISTS items (
    id SERIAL PRIMARY KEY,
    item_name TEXT,
    item_price INT
);

CREATE TABLE IF NOT EXISTS purchases (
    id SERIAL PRIMARY KEY,
    seller_item_id INT REFERENCES seller_items (id),
    buyer_id INT REFERENCES users (id)
);