--CASESTUDY -ECOMMERCE APPLICATION
USE CASESTUDY;
GO
-- CREAT CUSTOMER TABLE
CREATE TABLE Cust (
    customer_id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100),
    email NVARCHAR(255) UNIQUE,
    password NVARCHAR(255)
);

-- CREATE PRODUCTS TABLE
CREATE TABLE Products (
    product_id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100),
    price DECIMAL(18, 2),
    description NVARCHAR(500),
    stockQuantity INT
);

-- CREATE CART TABLE
CREATE TABLE Cart (
    cart_id INT PRIMARY KEY IDENTITY(1,1),
    customer_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES Cust(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

--CREATE ORDERS TABLE
CREATE TABLE Orders (
    order_id INT PRIMARY KEY IDENTITY(1,1),
    customer_id INT,
    order_date DATETIME,
    total_price DECIMAL(18, 2),
    shipping_address NVARCHAR(500),
    FOREIGN KEY (customer_id) REFERENCES Cust(customer_id)
);

-- Order_Items Table
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY IDENTITY(1,1),
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
