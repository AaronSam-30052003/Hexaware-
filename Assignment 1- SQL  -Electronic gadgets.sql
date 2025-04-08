-- Create Database for TechShop
CREATE DATABASE TechShop;
GO
USE TechShop;
GO
-- Create Schema
CREATE SCHEMA TechShopSchema;
GO
-- Create Customers Table
CREATE TABLE TechShopSchema.Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20),
    Address VARCHAR(255)
);
GO
-- Create Products Table
CREATE TABLE TechShopSchema.Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(100),
    Description VARCHAR(255),
    Price DECIMAL(10, 2)
);
GO
-- Create Orders Table
CREATE TABLE TechShopSchema.Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES TechShopSchema.Customers(CustomerID) ON DELETE CASCADE
);
GO
-- Create OrderDetails Table
CREATE TABLE TechShopSchema.OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES TechShopSchema.Orders(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES TechShopSchema.Products(ProductID) ON DELETE CASCADE
);
GO
-- Create Inventory Table
CREATE TABLE TechShopSchema.Inventory (
    InventoryID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate DATETIME,
    FOREIGN KEY (ProductID) REFERENCES TechShopSchema.Products(ProductID) ON DELETE CASCADE
);
GO
-- Insert sample data into Customers table
INSERT INTO TechShopSchema.Customers (FirstName, LastName, Email, Phone, Address)
VALUES 
('Aaron', 'Sam', 'aaronsam3004@gmail.com', '880740200', 'Madurai'),
('Sobana', 'RS', 'sobana@gmail.com', '9988444220', 'Madurai'),
('Samie', 'AS', 'samie@gmail.com', '1234567789', 'Chennai'),
('Tomie', 'AS', 'tomie@gmail.com', '3627797988', 'Chennai'),
('Choki', 'Mickey', 'chokimickey@gmail.com', '9729867282', 'Mumbai'),
('Mickey', 'Choki', 'mickeychoki@gmail.com', '8923879722', 'Bangalore'),
('Moon', 'RS', 'moon@gmail.com', '5816528681', 'Kerala'),
('Cute', 'Tomie', 'cute@gmail.com', '8168365811', 'Madurai'),
('Love', 'Moon', 'love@gmail.com', '9173974971', 'Hyderabad'),
('Rohit', 'Hitman', 'rohit@gmail.com', '8136846133', 'Theni');
GO
-- Insert sample data into Products table
INSERT INTO TechShopSchema.Products (ProductName, Description, Price)
VALUES 
('Smartphone', 'Latest model smartphone with all the features', 699.99),
('Laptop', 'Powerful laptop with 16GB RAM', 999.99),
('Headphones', 'Noise-cancelling wireless headphones', 199.99),
('Smartwatch', 'Smartwatch with fitness tracking features', 249.99),
('Tablet', 'Portable tablet for work and play', 399.99),
('Camera', 'DSLR camera with high-resolution sensor', 899.99),
('Speaker', 'Bluetooth portable speaker', 129.99),
('Keyboard', 'Wireless mechanical keyboard', 89.99),
('Monitor', 'Curved 4K monitor', 599.99),
('Charger', 'Fast charging cable and adapter', 29.99);
GO
-- Insert values into Orders table
INSERT INTO TechShopSchema.Orders (CustomerID, OrderDate, TotalAmount)
VALUES
(1, '2025-03-20', 1299.99),
(2, '2025-03-21', 399.99),
(3, '2025-03-22', 599.99),
(4, '2025-03-23', 899.99),
(5, '2025-03-24', 699.99),
(6, '2025-03-25', 129.99),
(7, '2025-03-26', 1599.99),
(8, '2025-03-27', 699.99),
(9, '2025-03-28', 799.99),
(10, '2025-03-29', 449.99);
GO
-- Insert values into OrderDetails table
INSERT INTO TechShopSchema.OrderDetails (OrderID, ProductID, Quantity)
VALUES
(1, 1, 1),
(1, 3, 2),
(2, 2, 1),
(3, 4, 1),
(4, 6, 2),
(5, 5, 1),
(6, 7, 1),
(7, 8, 1),
(8, 9, 1),
(9, 10, 2);
GO
-- Insert values into Inventory table
INSERT INTO TechShopSchema.Inventory (ProductID, QuantityInStock, LastStockUpdate)
VALUES
(1, 50, '2025-03-20'),
(2, 30, '2025-03-21'),
(3, 60, '2025-03-22'),
(4, 40, '2025-03-23'),
(5, 20, '2025-03-24'),
(6, 10, '2025-03-25'),
(7, 100, '2025-03-26'),
(8, 80, '2025-03-27'),
(9, 25, '2025-03-28'),
(10, 150, '2025-03-29');
GO
--Tasks 2: Select, Where, Between, AND, LIKE
--1)Retrieve the names and emails of all customers
SELECT FirstName, LastName, Email
FROM TechShopSchema.Customers;
GO
--2)List all orders with their order dates and corresponding customer names
SELECT o.OrderID, o.OrderDate, c.FirstName, c.LastName
FROM TechShopSchema.Orders o ,TechShopSchema.Customers c
WHERE o.CustomerID = c.CustomerID;
GO
--3) Insert a new customer record into the Customers table
INSERT INTO TechShopSchema.Customers (FirstName, LastName, Email, Phone, Address)
VALUES ('hii', 'dog', 'hidog@gmail.com', '82346852823', 'heaven');
SELECT * FROM TechShopSchema.Customers;
GO
--4)Update the prices of all electronic gadgets in the Products table by increasing them by 10%.
INSERT INTO TechShopSchema.Products (ProductName, Description, Price)--As there no product name gadget i ahve inserted a new data
VALUES 
('Gadget', 'It is modern TV with all the AI features', 1699.99);
UPDATE TechShopSchema.Products
SET Price = Price * 1.10
WHERE ProductName LIKE '%Gadget%'; 
SELECT * FROM TechShopSchema.Products;
GO
--5)Delete a specific order and its associated order details from the Orders and OrderDetails tables.
DECLARE @OrderID INT;
SET @OrderID = 1;  
DELETE FROM TechShopSchema.OrderDetails WHERE OrderID = @OrderID;
DELETE FROM TechShopSchema.Orders WHERE OrderID = @OrderID;
GO
--6) Insert a new order into the Orders table.
INSERT INTO TechShopSchema.Orders (CustomerID, OrderDate, TotalAmount)
VALUES (1, '2025-03-24', 100.00);  
SELECT * FROM TechShopSchema.Orders;
GO
--7)Update the contact information ( email and address) of a specific customer in the Customers table.
DECLARE @CustomerID INT;
SET @CustomerID = 11;  
UPDATE TechShopSchema.Customers
SET Email = 'new@gmail.com', Address = 'tamilnadu'
WHERE CustomerID = @CustomerID;
SELECT * FROM TechShopSchema.Customers;
GO
--8)update the total cost of each order in the Orders table based on the prices and quantities in the OrderDetails table.
UPDATE o
SET o.TotalAmount = (SELECT SUM(od.Quantity * p.Price)
					 FROM TechShopSchema.OrderDetails od,TechShopSchema.Products p
                     WHERE od.ProductID = p.ProductID AND od.OrderID = o.OrderID)
FROM TechShopSchema.Orders o;
GO
--9)Delete all orders and their associated order details for a specific customer from the Orders and OrderDetails tables.
DECLARE @CustomerID INT;
SET @CustomerID = 1;  
DELETE FROM TechShopSchema.OrderDetails WHERE OrderID IN (SELECT OrderID FROM TechShopSchema.Orders WHERE CustomerID = @CustomerID);
DELETE FROM TechShopSchema.Orders WHERE CustomerID = @CustomerID;
GO
SELECT * FROM TechShopSchema.Orders
SELECT *FROM TechShopSchema.OrderDetails;
--10)Insert a new electronic gadget product into the Products table.
INSERT INTO TechShopSchema.Products (ProductName, Description, Price)
VALUES ('Super Gadget', 'Latest version of electronic gadget', 99.99); 
SELECT * FROM TechShopSchema.Products;
GO
--11)Update the status of a specific order in the Orders table.
--As there is not col name status i have add the col status to orders table then inserted value 
ALTER TABLE TechShopSchema.Orders
ADD Status varchar(50);
GO
INSERT INTO TechShopSchema.Orders (CustomerID, OrderDate, TotalAmount,Status)
VALUES
(1, '2025-03-20', 1299.99,'not shipped');
GO
DECLARE @OrderID INT;
SET @OrderID = 2; 
UPDATE TechShopSchema.Orders
SET Status = 'Shipped'  
WHERE OrderID = @OrderID;
SELECT * FROM TechShopSchema.Orders;
GO
--12)Calculate and update the number of orders placed by each customer in the Customers table.
--As there is not col name totalorders in customers table i have added it
ALTER TABLE TechShopSchema.Customers ADD TotalOrders INT DEFAULT 0;
UPDATE TechShopSchema.Customers
SET TotalOrders = (SELECT COUNT(*) FROM TechShopSchema.Orders o WHERE o.CustomerID = c.CustomerID)
FROM TechShopSchema.Customers c;
SELECT * FROM TechShopSchema.Customers;
GO
------END OF TASK2

--Task 3. Aggregate functions, Having, Order By, GroupBy and Joins

--1)Retrieve a list of all orders along with customer information  for each order.
SELECT o.OrderID, o.OrderDate, c.FirstName, c.LastName, c.Email
FROM TechShopSchema.Orders o,TechShopSchema.Customers c WHERE o.CustomerID = c.CustomerID;
GO
--2)Find the total revenue generated by each electronic gadget product,Include the product name and the total revenue.
SELECT p.ProductName, SUM(od.Quantity * p.Price) AS TotalRevenue
FROM TechShopSchema.OrderDetails od,TechShopSchema.Products p 
WHERE od.ProductID = p.ProductID AND p.ProductName LIKE '%Gadget%'
GROUP BY p.ProductName;
GO
--3)List all customers who have made at least one purchas and also include their names and contact information.
SELECT DISTINCT c.FirstName, c.LastName, c.Email, c.Phone
FROM TechShopSchema.Customers c,TechShopSchema.Orders o WHERE c.CustomerID = o.CustomerID;
GO
--4)the most popular electronic gadget, which is the one with the highest total quantity ordered
SELECT p.ProductName, SUM(od.Quantity) AS TotalQuantityOrdered
FROM TechShopSchema.OrderDetails od, TechShopSchema.Products p WHERE od.ProductID = p.ProductID AND p.ProductName LIKE '%Gadget%'
GROUP BY p.ProductName
ORDER BY TotalQuantityOrdered DESC
OFFSET 0 ROWS FETCH FIRST 1 ROW ONLY;
--5)Retrieve a list of electronic gadgets along with their description
SELECT p.ProductName,p.Description
FROM TechShopSchema.Products p
WHERE p.ProductName LIKE '%Gadget%';
GO
--6)Calculate the average order value for each customer
SELECT c.FirstName, c.LastName, AVG(o.TotalAmount) AS AverageOrderValue
FROM TechShopSchema.Customers c,TechShopSchema.Orders o WHERE c.CustomerID = o.CustomerID
GROUP BY  c.FirstName, c.LastName;
GO
--7)The order with the highest total revenue
SELECT c.FirstName, c.LastName, AVG(o.TotalAmount) AS AverageOrderValue
FROM TechShopSchema.Customers c,TechShopSchema.Orders o WHERE c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;
GO
--8) List electronic gadgets and the number of times each product has been ordered
SELECT p.ProductName, COUNT(od.OrderID) AS OrderCount
FROM TechShopSchema.OrderDetails od,TechShopSchema.Products p WHERE od.ProductID = p.ProductID AND p.ProductName LIKE '%Gadget%'
GROUP BY p.ProductName;
GO
--9)Find customers who have purchased a specific electronic gadget product
DECLARE @ProductName VARCHAR(100);
SET @ProductName = 'Laptop'; 
SELECT DISTINCT c.FirstName, c.LastName, c.Email
FROM TechShopSchema.Customers c,TechShopSchema.Orders o,TechShopSchema.OrderDetails od,TechShopSchema.Products p 
WHERE c.CustomerID = o.CustomerID AND o.OrderID = od.OrderID
AND od.ProductID = p.ProductID AND p.ProductName = @ProductName;
GO
--10)Calculate the total revenue generated by all orders placed within a specific time period.
DECLARE @StartDate DATE, @EndDate DATE;
SET @StartDate = '2025-01-01';  
SET @EndDate = '2025-12-31'; 
SELECT SUM(TotalAmount) AS TotalRevenue
FROM TechShopSchema.Orders 
WHERE OrderDate BETWEEN @StartDate AND @EndDate;
GO
--END OF TASK3

--Task 4 Subquery and its type

--1)Find out which customers have not placed any orders
SELECT c.CustomerID, c.FirstName, c.LastName
FROM TechShopSchema.Customers c
WHERE c.CustomerID NOT IN (SELECT DISTINCT o.CustomerID FROM TechShopSchema.Orders o);
GO
--2)Find the total number of products available for sale
SELECT COUNT(*) AS TotalProducts
FROM TechShopSchema.Products 
WHERE price > 0; 
GO
--3)Calculate the total revenue generated by TechShop
SELECT SUM(TotalAmount) AS TotalRevenue
FROM TechShopSchema.Orders ;
GO
--4)Calculate the average quantity ordered for products in a specific category
DECLARE @productName VARCHAR(100);
SET @productName = 'Laptop';  
SELECT AVG(od.Quantity) AS AverageQuantityOrdered
FROM TechShopSchema.OrderDetails od,TechShopSchema.Products p 
WHERE od.ProductID = p.ProductID AND p.ProductName = @productName;
GO
--5)Calculate the total revenue generated by a specific customer
DECLARE @CustomerID INT;
SET @CustomerID = 1;  
SELECT SUM(o.TotalAmount) AS TotalRevenue
FROM TechShopSchema.Orders o
WHERE o.CustomerID = @CustomerID;
GO
--6)Find the customers who have placed the most orders
SELECT c.FirstName, c.LastName, COUNT(o.OrderID) AS OrderCount
FROM TechShopSchema.Customers c
JOIN TechShopSchema.Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID,c.FirstName,c.LastName
HAVING COUNT(o.OrderID) = (SELECT MAX(OrderCount) 
                            FROM (SELECT COUNT(o.OrderID) AS OrderCount
                                  FROM TechShopSchema.Orders o
                                  GROUP BY o.CustomerID) AS OrderCounts);
GO
--7)Find the most popular product category, which is the one with the highest total quantity ordered
SELECT TOP 1 p.ProductName, SUM(od.Quantity) AS TotalQuantityOrdered
FROM TechShopSchema.OrderDetails od, TechShopSchema.Products p WHERE od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalQuantityOrdered DESC;
GO
--8) Find the customer who has spent the most money on electronic gadgets
SELECT TOP 1 c.FirstName, c.LastName, SUM(od.Quantity * p.Price) AS TotalSpending
FROM TechShopSchema.Customers c,TechShopSchema.Orders o,TechShopSchema.OrderDetails od,TechShopSchema.Products p 
WHERE c.CustomerID = o.CustomerID AND o.OrderID = od.OrderID AND od.ProductID = p.ProductID AND p.ProductName LIKE '%Laptop%'
GROUP BY c.CustomerID,c.FirstName,c.LastName
ORDER BY TotalSpending DESC
GO
--9)Calculate the average order value (total revenue divided by the number of orders) for all customers.
--1st method
SELECT c.FirstName, c.LastName,(SUM(o.TotalAmount) / COUNT(o.OrderID)) AS AverageOrderValue
FROM TechShopSchema.Customers c,TechShopSchema.Orders o WHERE c.CustomerID = o.CustomerID
GROUP BY c.CustomerID,c.FirstName,c.LastName;
--2nd method
SELECT c.FirstName, c.LastName,AVG(o.TotalAmount) AS AverageOrderValue
FROM TechShopSchema.Customers c,TechShopSchema.Orders o WHERE c.CustomerID = o.CustomerID
GROUP BY c.CustomerID,c.FirstName,c.LastName;
GO
--10)Find the total number of orders placed by each customer and list their names along with the order count.
SELECT c.FirstName, c.LastName, COUNT(o.OrderID) AS OrderCount
FROM TechShopSchema.Customers c, TechShopSchema.Orders o WHERE c.CustomerID = o.CustomerID
GROUP BY c.CustomerID,c.FirstName,c.LastName;
GO

--END OF TASK4















































