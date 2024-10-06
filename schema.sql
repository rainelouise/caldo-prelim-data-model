-- Create Customers Table
CREATE TABLE customers (
 customer_id INT AUTO_INCREMENT PRIMARY KEY,
 first_name VARCHAR(50),
 last_name VARCHAR(50),
 email VARCHAR(255),
 phone_number VARCHAR(20),
 shipping_address VARCHAR(255)
);
-- Create Products Table
CREATE TABLE products (
 product_id INT AUTO_INCREMENT PRIMARY KEY,
 product_name VARCHAR(255),
 description TEXT,
 price DECIMAL(10, 2),
 stock_quantity INT,
 category VARCHAR(100)
);
-- Create Orders Table
CREATE TABLE orders (
 order_id INT AUTO_INCREMENT PRIMARY KEY,
 customer_id INT,
 order_date TIMESTAMP,
 order_status VARCHAR(50),
 total_amount DECIMAL(10, 2),
 FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
-- Create Order Items Table
CREATE TABLE order_items (
 order_item_id INT AUTO_INCREMENT PRIMARY KEY,
 order_id INT,
 product_id INT,
 quantity INT,
 subtotal DECIMAL(10, 2),
 FOREIGN KEY (order_id) REFERENCES orders(order_id),
 FOREIGN KEY (product_id) REFERENCES products(product_id)
);
-- Create Payments Table
CREATE TABLE payments (
 payment_id INT AUTO_INCREMENT PRIMARY KEY,
 order_id INT,
 payment_date TIMESTAMP,
 payment_method VARCHAR(50),
 amount_paid DECIMAL(10, 2),
 payment_status VARCHAR(50),
 FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
