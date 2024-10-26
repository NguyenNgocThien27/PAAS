-- Create the schema named dbo
CREATE SCHEMA IF NOT EXISTS dbo;

-- Users table in the dbo schema
CREATE TABLE dbo.users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Products table in the dbo schema
CREATE TABLE dbo.products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Orders table in the dbo schema
-- Each order is linked to a user via a foreign key (user_id)
CREATE TABLE dbo.orders (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES dbo.users(id) ON DELETE CASCADE,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) DEFAULT 'pending'
);

-- Order_Items table in the dbo schema
-- Links orders to products and stores the quantity of each product in an order
CREATE TABLE dbo.order_items (
    id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES dbo.orders(id) ON DELETE CASCADE,
    product_id INTEGER REFERENCES dbo.products(id) ON DELETE RESTRICT,
    quantity INTEGER NOT NULL,
    price_at_purchase NUMERIC(10, 2) NOT NULL  -- Records price at the time of purchase
);


-- Insert some users into dbo.users
INSERT INTO dbo.users (username, email) VALUES 
('john_doe', 'john@example.com'),
('jane_smith', 'jane@example.com');

-- Insert some products into dbo.products
INSERT INTO dbo.products (name, price) VALUES 
('Laptop', 1200.00),
('Smartphone', 800.00),
('Headphones', 100.00);

-- Insert an order for user 'john_doe'
INSERT INTO dbo.orders (user_id, status) VALUES 
(1, 'completed');

-- Insert items for the order into dbo.order_items
INSERT INTO dbo.order_items (order_id, product_id, quantity, price_at_purchase) VALUES 
(1, 1, 1, 1200.00),  -- 1 Laptop
(1, 2, 2, 800.00);   -- 2 Smartphones
