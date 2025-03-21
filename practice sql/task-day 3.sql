--scenario based tasks
--task-1 Extract data with condition
USE Sample;
CREATE TABLE Employees(
					EMPLOYEE_ID INT IDENTITY,
					NAME VARCHAR(20),
					DEPARTMENT VARCHAR(20),
					SALARY DECIMAL(9,2));
INSERT INTO Employees VALUES('AARON','AI ENGINEER',50000.00),
							('TOMIE','HR',60000.00),
							('CHOKI','HR',50000.000),
							('MICKEY','HR',40000.00);
SELECT * FROM Employees;
SELECT NAME
FROM Employees
WHERE DEPARTMENT = 'HR' AND SALARY > 50000;
GO
--task2 finding duplicate record
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    OrderAmount DECIMAL(10, 2));
INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderAmount)
VALUES
    (1, 101, '2025-03-21', 250.00),
    (2, 102, '2025-03-22', 150.00),
    (3, 101, '2025-03-23', 300.00),
    (4, 103, '2025-03-24', 450.00),
    (5, 104, '2025-03-25', 200.00),
    (6, 101, '2025-03-26', 500.00),
    (7, 102, '2025-03-27', 600.00);
GO
SELECT CustomerID, COUNT(*) AS DuplicateCount
FROM Orders
GROUP BY CustomerID
HAVING COUNT(*) > 1;
GO
--task 3-Aggregating Data
CREATE TABLE Sales(
				SALES_ID INT IDENTITY ,
				PRODUCT_ID INT NOT NULL,
				QUANTITY INT,
				SALESDATE DATE);
INSERT INTO Sales VALUES(100,3,'2025-03-01'),(101,5,'2025-03-02'),(102,6,'2025-03-03');
GO
SELECT PRODUCT_ID, SUM(QUANTITY) AS TotalQuantitySold
FROM Sales
GROUP BY PRODUCT_ID;
GO
--task -4 Date Range Queries
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionDate DATE,
    Amount DECIMAL(10, 2)
);
INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount)
VALUES
    (1, 101, '2025-02-15', 200.00),
    (2, 102, '2025-03-10', 500.00),
    (3, 103, '2025-03-18', 150.00),
    (4, 101, '2025-03-20', 300.00),
    (5, 102, '2025-03-25', 400.00);
GO
SELECT *
FROM Transactions
WHERE TransactionDate >= DATEADD(DAY, -30, GETDATE());
GO
--task-5 Updating Records
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2),
    StockQuantity INT
);
INSERT INTO Products (ProductID, ProductName, Price, StockQuantity)
VALUES
    (1, 'Laptop', 1000.00, 50),
    (2, 'Smartphone', 500.00, 150),
    (3, 'Tablet', 300.00, 80),
    (4, 'Headphones', 100.00, 30),
    (5, 'Monitor', 250.00, 200);
GO
UPDATE Products
SET Price=Price*10
WHERE StockQuantity <100;
GO
SELECT * FROM Products;

--Task -6 Deleting Specific Records
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(100),
    Email VARCHAR(100),
    Status VARCHAR(20),
    LastLoginDate DATE
);
INSERT INTO Users (UserID, Username, Email, Status, LastLoginDate)
VALUES
    (1, 'Aaron', 'aaron3004@example.com', 'inactive', '2024-03-20'),
    (2, 'Tomie', 'tomie@example.com', 'active', '2025-03-15'),
    (3, 'Mickey', 'mickey3005@example.com', 'inactive', '2023-02-10'),
    (4, 'Choki', 'choki@example.com', 'active', '2023-03-25'),
    (5, 'Chokimickey', 'mickey@example.com', 'inactive', '2021-03-22');
GO
DELETE FROM Users
WHERE Status = 'inactive'
  AND LastLoginDate <= DATEADD(YEAR, -1, GETDATE());
SELECT * FROM Users;
GO
--Task -9 
ALTER TABLE Products
ADD Discount varchar(20);
GO
SELECT 
    ProductName,
    ISNULL(Discount, 'No Discount') AS Discount
FROM Products;
GO
--Task -10 







