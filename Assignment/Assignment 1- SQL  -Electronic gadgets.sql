-- Create Database for TechShop
CREATE DATABASE TechShop;
GO
USE TechShop;
GO
-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20),
    Address VARCHAR(255)
);
GO

-- Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(100),
    Description VARCHAR(255),
    Price DECIMAL(10, 2)
);
GO

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
GO

-- Create OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
GO
-- Create Inventory Table
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate DATETIME,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
GO
--insert sample data into customers table
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)
VALUES 
('Aaron', 'sam', 'aaronsam3004@gamil.com', '880740200', 'Madurai'),
('sobana', 'RS', 'soaban@gmail.com', '9988444220', 'Madurai'),
('Samie', 'AS', 'samie@gamil.com', '1234567789', 'chennai'),
('Tomie', 'AS', 'tomie@gmail.com', '3627797988', 'Chennai'),
('Choki', 'Mickey', 'chokimickey@gmail.com', '9729867282', 'Mumbai'),
('Mickey', 'Choki', 'mickeychoki@gmail.com', '8923879722', 'Bangalore'),
('Moon', 'RS', 'moon@gmail.com', '5816528681', 'Kerala'),
('cute', 'tomie', 'cute@gmail.com', '8168365811', 'Madurai'),
('love', 'Moon', 'love@gmail.com', '9173974971', 'hyderabad'),
('Rohit', 'Hitman', 'rohit@gmail.com', '8136846133', 'theni');
GO
--insert sample data into products table
INSERT INTO Products (ProductName, Description, Price)
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
--insert values into orders table
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
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
--insert values into orderdetails table
INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
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
--insert values into inventory table
INSERT INTO Inventory (ProductID, QuantityInStock, LastStockUpdate)
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
FROM Customers;
GO
--2)List all orders with their order dates and corresponding customer names
SELECT o.OrderID, o.OrderDate, c.FirstName, c.LastName
FROM Orders o ,Customers c
WHERE o.CustomerID = c.CustomerID;
GO
--3) Insert a new customer record into the Customers table
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)
VALUES ('hii', 'dog', 'hidog@gmail.com', '82346852823', 'heaven');
SELECT * FROM Customers;
GO
--4)Update the prices of all electronic gadgets in the Products table by increasing them by 10%.
INSERT INTO Products (ProductName, Description, Price)--As there no product name gadget i ahve inserted a new data
VALUES 
('Gadget', 'It is modern TV with all the AI features', 1699.99);
UPDATE Products
SET Price = Price * 1.10
WHERE ProductName LIKE '%Gadget%'; 
SELECT * FROM Products;
GO
--5)Delete a specific order and its associated order details from the Orders and OrderDetails tables.
DECLARE @OrderID INT;
SET @OrderID = 1;  
DELETE FROM OrderDetails WHERE OrderID = @OrderID;
DELETE FROM Orders WHERE OrderID = @OrderID;
GO
--6) Insert a new order into the Orders table.
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES (1, '2025-03-24', 100.00);  
SELECT * FROM Orders;
GO
--7)Update the contact information ( email and address) of a specific customer in the Customers table.
DECLARE @CustomerID INT;
SET @CustomerID = 11;  
UPDATE Customers
SET Email = 'new@gmail.com', Address = 'tamilnadu'
WHERE CustomerID = @CustomerID;
SELECT * FROM Customers;
GO
--8)update the total cost of each order in the Orders table based on the prices and quantities in the OrderDetails table.
UPDATE o
SET o.TotalAmount = (SELECT SUM(od.Quantity * p.Price)
					 FROM OrderDetails od,Products p
                     WHERE od.ProductID = p.ProductID AND od.OrderID = o.OrderID)
FROM Orders o;
GO
--9)Delete all orders and their associated order details for a specific customer from the Orders and OrderDetails tables.
DECLARE @CustomerID INT;
SET @CustomerID = 1;  
DELETE FROM OrderDetails WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = @CustomerID);
DELETE FROM Orders WHERE CustomerID = @CustomerID;
GO
SELECT * FROM Orders, OrderDetails;
--10)Insert a new electronic gadget product into the Products table.
INSERT INTO Products (ProductName, Description, Price)
VALUES ('Super Gadget', 'Latest version of electronic gadget', 99.99); 
SELECT * FROM Products;
GO
--11)Update the status of a specific order in the Orders table.
--As there is not col name status i have add the col status to orders table then inserted value 
ALTER TABLE Orders
ADD Status varchar(50);
GO
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount,Status)
VALUES
(1, '2025-03-20', 1299.99,'not shipped');
GO
DECLARE @OrderID INT;
SET @OrderID = 2; 
UPDATE Orders
SET Status = 'Shipped'  
WHERE OrderID = @OrderID;
SELECT * FROM Orders;
GO
--12)Calculate and update the number of orders placed by each customer in the Customers table.
--As there is not col name totalorders in customers table i have added it
ALTER TABLE Customers ADD TotalOrders INT DEFAULT 0;
UPDATE c
SET TotalOrders = (SELECT COUNT(*) FROM Orders o WHERE o.CustomerID = c.CustomerID)
FROM Customers c;
SELECT * FROM Customers;
GO
------END OF TASK2

--Task 3. Aggregate functions, Having, Order By, GroupBy and Joins

--1)Retrieve a list of all orders along with customer information  for each order.
SELECT o.OrderID, o.OrderDate, c.FirstName, c.LastName, c.Email
FROM Orders o,Customers c WHERE o.CustomerID = c.CustomerID;
GO
--2)Find the total revenue generated by each electronic gadget product,Include the product name and the total revenue.
SELECT p.ProductName, SUM(od.Quantity * p.Price) AS TotalRevenue
FROM OrderDetails od,Products p 
WHERE od.ProductID = p.ProductID AND p.ProductName LIKE '%Gadget%'
GROUP BY p.ProductName;
GO
--3)List all customers who have made at least one purchas and also include their names and contact information.
SELECT DISTINCT c.FirstName, c.LastName, c.Email, c.Phone
FROM Customers c,Orders o WHERE c.CustomerID = o.CustomerID;
GO
--4)the most popular electronic gadget, which is the one with the highest total quantity ordered
SELECT p.ProductName, SUM(od.Quantity) AS TotalQuantityOrdered
FROM OrderDetails od, Products p WHERE od.ProductID = p.ProductID AND p.ProductName LIKE '%Gadget%'
GROUP BY p.ProductName
ORDER BY TotalQuantityOrdered DESC
OFFSET 0 ROWS FETCH FIRST 1 ROW ONLY;
--5)Retrieve a list of electronic gadgets along with their description
SELECT p.ProductName,p.Description
FROM Products p
WHERE p.ProductName LIKE '%Gadget%';
GO
--6)Calculate the average order value for each customer
SELECT c.FirstName, c.LastName, AVG(o.TotalAmount) AS AverageOrderValue
FROM Customers c,Orders o WHERE c.CustomerID = o.CustomerID
GROUP BY  c.FirstName, c.LastName;
GO
--7)The order with the highest total revenue
SELECT c.FirstName, c.LastName, AVG(o.TotalAmount) AS AverageOrderValue
FROM Customers c,Orders o WHERE c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;
GO
--8) List electronic gadgets and the number of times each product has been ordered
SELECT p.ProductName, COUNT(od.OrderID) AS OrderCount
FROM OrderDetails od,Products p WHERE od.ProductID = p.ProductID AND p.ProductName LIKE '%Gadget%'
GROUP BY p.ProductName;
GO
--9)Find customers who have purchased a specific electronic gadget product
DECLARE @ProductName VARCHAR(100);
SET @ProductName = 'Laptop'; 
SELECT DISTINCT c.FirstName, c.LastName, c.Email
FROM Customers c,Orders o,OrderDetails od,Products p WHERE c.CustomerID = o.CustomerID AND o.OrderID = od.OrderID
AND od.ProductID = p.ProductID AND p.ProductName = @ProductName;
GO
--10)Calculate the total revenue generated by all orders placed within a specific time period.
DECLARE @StartDate DATE, @EndDate DATE;
SET @StartDate = '2025-01-01';  
SET @EndDate = '2025-12-31'; 
SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders 
WHERE OrderDate BETWEEN @StartDate AND @EndDate;
GO
--END OF TASK3

--Task 4 Subquery and its type

--1)Find out which customers have not placed any orders
SELECT c.CustomerID, c.FirstName, c.LastName
FROM Customers c
WHERE c.CustomerID NOT IN (SELECT DISTINCT o.CustomerID FROM Orders o);
GO
--2)Find the total number of products available for sale
SELECT COUNT(*) AS TotalProducts
FROM Products 
WHERE price > 0; 
GO
--3)Calculate the total revenue generated by TechShop
SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders ;
GO
--4)Calculate the average quantity ordered for products in a specific category
DECLARE @productName VARCHAR(100);
SET @productName = 'Laptop';  
SELECT AVG(od.Quantity) AS AverageQuantityOrdered
FROM OrderDetails od,Products p 
WHERE od.ProductID = p.ProductID AND p.ProductName = @productName;
GO
--5)Calculate the total revenue generated by a specific customer
DECLARE @CustomerID INT;
SET @CustomerID = 1;  
SELECT SUM(o.TotalAmount) AS TotalRevenue
FROM Orders o
WHERE o.CustomerID = @CustomerID;
GO
--6)Find the customers who have placed the most orders
SELECT c.FirstName, c.LastName, COUNT(o.OrderID) AS OrderCount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID,c.FirstName,c.LastName
HAVING COUNT(o.OrderID) = (SELECT MAX(OrderCount) 
                            FROM (SELECT COUNT(o.OrderID) AS OrderCount
                                  FROM Orders o
                                  GROUP BY o.CustomerID) AS OrderCounts);
GO
--7)Find the most popular product category, which is the one with the highest total quantity ordered
SELECT TOP 1 p.ProductName, SUM(od.Quantity) AS TotalQuantityOrdered
FROM OrderDetails od, Products p WHERE od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalQuantityOrdered DESC;
GO
--8) Find the customer who has spent the most money on electronic gadgets
SELECT TOP 1 c.FirstName, c.LastName, SUM(od.Quantity * p.Price) AS TotalSpending
FROM Customers c,Orders o,OrderDetails od,Products p 
WHERE c.CustomerID = o.CustomerID AND o.OrderID = od.OrderID AND od.ProductID = p.ProductID AND p.ProductName LIKE '%Laptop%'
GROUP BY c.CustomerID,c.FirstName,c.LastName
ORDER BY TotalSpending DESC
GO
--9)Calculate the average order value (total revenue divided by the number of orders) for all customers.
--1st method
SELECT c.FirstName, c.LastName,(SUM(o.TotalAmount) / COUNT(o.OrderID)) AS AverageOrderValue
FROM Customers c,Orders o WHERE c.CustomerID = o.CustomerID
GROUP BY c.CustomerID,c.FirstName,c.LastName;
--2nd method
SELECT c.FirstName, c.LastName,AVG(o.TotalAmount) AS AverageOrderValue
FROM Customers c,Orders o WHERE c.CustomerID = o.CustomerID
GROUP BY c.CustomerID,c.FirstName,c.LastName;
GO
--10)Find the total number of orders placed by each customer and list their names along with the order count.
SELECT c.FirstName, c.LastName, COUNT(o.OrderID) AS OrderCount
FROM Customers c, Orders o WHERE c.CustomerID = o.CustomerID
GROUP BY c.CustomerID,c.FirstName,c.LastName;
GO

--END OF TASK4















































