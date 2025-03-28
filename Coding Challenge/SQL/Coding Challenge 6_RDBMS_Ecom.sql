USE CODINGCHALLENGE;
GO
--Crate schema
CREATE SCHEMA EcomSchema;
-- Create Customers Table
CREATE TABLE EcomSchema.customers (
    customer_id INT PRIMARY KEY,
    firstName NVARCHAR(50),
    lastName NVARCHAR(50),
    email NVARCHAR(100),
    address NVARCHAR(255)
);
-- Insert values into Customers Table
INSERT INTO EcomSchema.customers (customer_id, firstName, lastName, email, address)
VALUES 
(1, 'John', 'Doe', 'johndoe@example.com', '123 Main St, City'),
(2, 'Jane', 'Smith', 'janesmith@example.com', '456 Elm St, Town'),
(3, 'Robert', 'Johnson', 'robert@example.com', '789 Oak St, Village'),
(4, 'Sarah', 'Brown', 'sarah@example.com', '101 Pine St, Suburb'),
(5, 'David', 'Lee', 'david@example.com', '234 Cedar St, District'),
(6, 'Laura', 'Hall', 'laura@example.com', '567 Birch St, County'),
(7, 'Michael', 'Davis', 'michael@example.com', '890 Maple St, State'),
(8, 'Emma', 'Wilson', 'emma@example.com', '321 Redwood St, Country'),
(9, 'William', 'Taylor', 'william@example.com', '432 Spruce St, Province'),
(10, 'Olivia', 'Adams', 'olivia@example.com', '765 Fir St, Territory');
GO
-- Create Products Table
CREATE TABLE EcomSchema.products (
    product_id INT PRIMARY KEY,
    name NVARCHAR(50),
    description NVARCHAR(255),
    price DECIMAL(10, 2),
    stockQuantity INT
);
-- Insert values into Products Table
INSERT INTO EcomSchema.products (product_id, name, description, price, stockQuantity)
VALUES 
(1, 'Laptop', 'High-performance laptop', 800.00, 10),
(2, 'Smartphone', 'Latest smartphone', 600.00, 15),
(3, 'Tablet', 'Portable tablet', 300.00, 20),
(4, 'Headphones', 'Noise-canceling', 150.00, 30),
(5, 'TV', '4K Smart TV', 900.00, 5),
(6, 'Coffee Maker', 'Automatic coffee maker', 50.00, 25),
(7, 'Refrigerator', 'Energy-efficient', 700.00, 10),
(8, 'Microwave Oven', 'Countertop microwave', 80.00, 15),
(9, 'Blender', 'High-speed blender', 70.00, 20),
(10, 'Vacuum Cleaner', 'Bagless vacuum cleaner', 120.00, 10);
GO
-- Create Cart Table
CREATE TABLE EcomSchema.cart (
    cart_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    CONSTRAINT FK_Cart_Customer FOREIGN KEY (customer_id) REFERENCES EcomSchema.customers(customer_id)ON DELETE CASCADE,
    CONSTRAINT FK_Cart_Product FOREIGN KEY (product_id) REFERENCES EcomSchema.products(product_id) ON DELETE CASCADE
);
-- Insert values into Cart Table
INSERT INTO EcomSchema.cart (cart_id, customer_id, product_id, quantity)
VALUES
(1, 1, 1, 2),
(2, 1, 3, 1),
(3, 2, 2, 3),
(4, 3, 4, 4),
(5, 3, 5, 2),
(6, 4, 6, 1),
(7, 5, 1, 1),
(8, 6, 10, 2),
(9, 6, 9, 3),
(10, 7, 7, 2);
GO
-- Create Orders Table
CREATE TABLE EcomSchema.orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_price DECIMAL(10, 2),
    shipping_address NVARCHAR(255),
    CONSTRAINT FK_Orders_Customer FOREIGN KEY (customer_id) REFERENCES EcomSchema.customers(customer_id)ON DELETE CASCADE
);
-- Insert values into Orders Table
INSERT INTO EcomSchema.orders (order_id, customer_id, order_date, total_price, shipping_address)
VALUES 
(1, 1, '2023-01-05', 1200.00, '123 Main St, City'),
(2, 2, '2023-02-10', 900.00, '456 Elm St, Town'),
(3, 3, '2023-03-15', 300.00, '789 Oak St, Village'),
(4, 4, '2023-04-20', 150.00, '101 Pine St, Suburb'),
(5, 5, '2023-05-25', 1800.00, '234 Cedar St, District'),
(6, 6, '2023-06-30', 400.00, '567 Birch St, County'),
(7, 7, '2023-07-05', 700.00, '890 Maple St, State'),
(8, 8, '2023-08-10', 160.00, '321 Redwood St, Country'),
(9, 9, '2023-09-15', 140.00, '432 Spruce St, Province'),
(10, 10, '2023-10-20', 1400.00, '765 Fir St, Territory');
GO
-- Create Order Items Table
CREATE TABLE EcomSchema.order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    item_amount DECIMAL(10, 2),
    CONSTRAINT FK_OrderItems_Order FOREIGN KEY (order_id) REFERENCES EcomSchema.orders(order_id) ON DELETE CASCADE,
    CONSTRAINT FK_OrderItems_Product FOREIGN KEY (product_id) REFERENCES EcomSchema.products(product_id) ON DELETE CASCADE
);
-- Insert values into Order Items Table
INSERT INTO EcomSchema.order_items (order_item_id, order_id, product_id, quantity, item_amount)
VALUES 
(1, 1, 1, 2, 1600.00),
(2, 1, 3, 1, 300.00),
(3, 2, 2, 3, 1800.00),
(4, 3, 5, 2, 1800.00),
(5, 4, 4, 4, 600.00),
(6, 4, 6, 1, 50.00),
(7, 5, 1, 1, 800.00),
(8, 5, 2, 2, 1200.00),
(9, 6, 10, 2, 240.00),
(10, 6, 9, 3, 210.00);
GO
--Update refrigerator product price to 800
UPDATE EcomSchema.products
SET price=800
WHERE name='refrigerator'
GO
--Remove all cart items for a specific customer (Customer 1):
DELETE FROM EcomSchema.cart
WHERE customer_id=1;
GO
--Retrieve Products Priced Below 100
SELECT * FROM EcomSchema.products
WHERE price < 100;
GO
--Find Products with Stock Quantity Greater Than 5
SELECT * FROM EcomSchema.products
WHERE stockQuantity >5;
GO
--Retrieve Orders with Total Amount Between 500 and 1000
SELECT * FROM EcomSchema.orders
WHERE total_price BETWEEN 500 AND 1000;
GO
--Find Products whose name ends with the letter 'r':
SELECT * FROM EcomSchema.products
WHERE name like '%r';
GO
--Retrieve Cart Items for Customer 5:
SELECT * FROM EcomSchema.cart
WHERE customer_id=5;
GO
--Find Customers Who Placed Orders in 2023
SELECT DISTINCT c.customer_id, c.firstName, c.lastName
FROM EcomSchema.customers c
JOIN EcomSchema.orders o ON c.customer_id = o.customer_id
WHERE YEAR(o.order_date) = 2023;
--OR
SELECT DISTINCT c.customer_id, c.firstName, c.lastName
FROM EcomSchema.customers c,EcomSchema.orders o 
WHERE c.customer_id = o.customer_id AND YEAR(o.order_date) = 2023;
GO
--Determine the Minimum Stock Quantity for Each Product Category (Product)
SELECT name, MIN(stockQuantity) AS MinStockQuantity
FROM EcomSchema.products
GROUP BY name;
GO
--Calculate the Total Amount Spent by Each Customer
SELECT c.firstName, c.lastName, SUM(o.total_price) AS TotalSpent
FROM EcomSchema.customers c
JOIN EcomSchema.orders o ON c.customer_id = o.customer_id
GROUP BY c.firstName, c.lastName;
--OR
SELECT c.firstName, c.lastName, SUM(o.total_price) AS TotalSpent
FROM EcomSchema.customers c,EcomSchema.orders o 
WHERE c.customer_id = o.customer_id
GROUP BY c.firstName, c.lastName;
GO
--Find the Average Order Amount for Each Customer
SELECT c.firstName, c.lastName, AVG(o.total_price) AS AverageOrderAmount
FROM EcomSchema.customers c
JOIN EcomSchema.orders o ON c.customer_id = o.customer_id
GROUP BY c.firstName, c.lastName;
--OR
SELECT c.firstName, c.lastName, AVG(o.total_price) AS AverageOrderAmount
FROM EcomSchema.customers c,EcomSchema.orders o 
WHERE c.customer_id = o.customer_id
GROUP BY c.firstName, c.lastName;
GO
--Count the Number of Orders Placed by Each Customer
SELECT c.firstName, c.lastName, COUNT(o.order_id) AS OrdersCount
FROM EcomSchema.customers c
JOIN EcomSchema.orders o ON c.customer_id = o.customer_id
GROUP BY c.firstName, c.lastName;
--OR
SELECT c.firstName, c.lastName, COUNT(o.order_id) AS OrdersCount
FROM EcomSchema.customers c,EcomSchema.orders o 
WHERE c.customer_id = o.customer_id
GROUP BY c.firstName, c.lastName;
GO
--Find the Maximum Order Amount for Each Customer
SELECT c.firstName, c.lastName, MAX(o.total_price) AS MaxOrderAmount
FROM EcomSchema.customers c
JOIN EcomSchema.orders o ON c.customer_id = o.customer_id
GROUP BY c.firstName, c.lastName;
--OR
SELECT c.firstName, c.lastName, MAX(o.total_price) AS MaxOrderAmount
FROM EcomSchema.customers c,EcomSchema.orders o 
WHERE c.customer_id = o.customer_id
GROUP BY c.firstName, c.lastName;
GO
--Get Customers Who Placed Orders Totaling Over $1000
SELECT c.firstName, c.lastName
FROM EcomSchema.customers c
JOIN EcomSchema.orders o ON c.customer_id = o.customer_id
GROUP BY c.firstName, c.lastName
HAVING SUM(o.total_price) > 1000;
--OR
SELECT c.firstName, c.lastName
FROM EcomSchema.customers c,EcomSchema.orders o 
WHERE c.customer_id = o.customer_id
GROUP BY c.firstName, c.lastName
HAVING SUM(o.total_price) > 1000;
GO
--Subquery to Find Products Not in the Cart
SELECT * FROM EcomSchema.products
WHERE product_id NOT IN (SELECT product_id FROM cart);
GO
--Subquery to Find Customers Who Haven't Placed Orders
SELECT * FROM EcomSchema.customers
WHERE customer_id NOT IN (SELECT customer_id FROM orders);
GO
--Subquery to Calculate the Percentage of Total Revenue for a Product
SELECT name, price, 
    (price / (SELECT SUM(price) FROM EcomSchema.products) * 100) AS RevenuePercentage
FROM EcomSchema.products;
GO
--Subquery to Find Products with Low Stock (Less than 5)
SELECT * FROM EcomSchema.products
WHERE stockQuantity < (SELECT 5);
GO
--Subquery to Find Customers Who Placed High-Value Orders (Above 1000)
SELECT * FROM EcomSchema.customers
WHERE customer_id IN (SELECT customer_id FROM EcomSchema.orders WHERE total_price > 1000);
GO








