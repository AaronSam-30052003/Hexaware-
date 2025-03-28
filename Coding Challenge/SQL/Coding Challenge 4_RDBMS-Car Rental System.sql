USE CODINGCHALLENGE;
GO
--create schema
CREATE SCHEMA CarSchema;
-- Create Vehicle Table
CREATE TABLE CarSchema.Vehicle (
    vehicleID INT PRIMARY KEY,
    make NVARCHAR(50),
    model NVARCHAR(50),
    year INT,
    dailyRate DECIMAL(10, 2),
    status NVARCHAR(20),
    passengerCapacity INT,
    engineCapacity INT
);
-- Insert values into Vehicle Table
INSERT INTO CarSchema.Vehicle (vehicleID, make, model, year, dailyRate, status, passengerCapacity, engineCapacity)
VALUES 
(1, 'Toyota', 'Camry', 2022, 50.00, 'available', 4, 1450),
(2, 'Honda', 'Civic', 2023, 45.00, 'available', 7, 1500),
(3, 'Ford', 'Focus', 2022, 48.00, 'notAvailable', 4, 1400),
(4, 'Nissan', 'Altima', 2023, 52.00, 'available', 7, 1200),
(5, 'Chevrolet', 'Malibu', 2022, 47.00, 'available', 4, 1800),
(6, 'Hyundai', 'Sonata', 2023, 49.00, 'notAvailable', 7, 1400),
(7, 'BMW', '3 Series', 2023, 60.00, 'available', 7, 2499),
(8, 'Mercedes', 'C-Class', 2022, 58.00, 'available', 8, 2599),
(9, 'Audi', 'A4', 2022, 55.00, 'notAvailable', 4, 2500),
(10, 'Lexus', 'ES', 2023, 54.00, 'available', 4, 2500);
GO
-- Create Customer Table
CREATE TABLE CarSchema.Customer (
    customerID INT PRIMARY KEY,
    firstName NVARCHAR(50),
    lastName NVARCHAR(50),
    email NVARCHAR(100),
    phoneNumber NVARCHAR(15)
);
-- Insert values into Customer Table
INSERT INTO CarSchema.Customer (customerID, firstName, lastName, email, phoneNumber)
VALUES 
(1, 'John', 'Doe', 'johndoe@example.com', '555-555-5555'),
(2, 'Jane', 'Smith', 'janesmith@example.com', '555-123-4567'),
(3, 'Robert', 'Johnson', 'robert@example.com', '555-789-1234'),
(4, 'Sarah', 'Brown', 'sarah@example.com', '555-456-7890'),
(5, 'David', 'Lee', 'david@example.com', '555-987-6543'),
(6, 'Laura', 'Hall', 'laura@example.com', '555-234-5678'),
(7, 'Michael', 'Davis', 'michael@example.com', '555-876-5432'),
(8, 'Emma', 'Wilson', 'emma@example.com', '555-432-1098'),
(9, 'William', 'Taylor', 'william@example.com', '555-321-6547'),
(10, 'Olivia', 'Adams', 'olivia@example.com', '555-765-4321');
GO
-- Create Lease Table
CREATE TABLE CarSchema.Lease (
    leaseID INT PRIMARY KEY,
    vehicleID INT,
    customerID INT,
    startDate DATE,
    endDate DATE,
    leaseType NVARCHAR(20),
    CONSTRAINT FK_Lease_Vehicle FOREIGN KEY (vehicleID) REFERENCES CarSchema.Vehicle(vehicleID)ON DELETE CASCADE,
    CONSTRAINT FK_Lease_Customer FOREIGN KEY (customerID) REFERENCES CarSchema.Customer(customerID)ON DELETE CASCADE
);
-- Insert values into Lease Table
INSERT INTO CarSchema.Lease (leaseID, vehicleID, customerID, startDate, endDate, leaseType)
VALUES
(1, 1, 1, '2023-01-01', '2023-01-05', 'Daily'),
(2, 2, 2, '2023-02-15', '2023-02-28', 'Monthly'),
(3, 3, 3, '2023-03-10', '2023-03-15', 'Daily'),
(4, 4, 4, '2023-04-20', '2023-04-30', 'Monthly'),
(5, 5, 5, '2023-05-05', '2023-05-10', 'Daily'),
(6, 4, 3, '2023-06-15', '2023-06-30', 'Monthly'),
(7, 7, 7, '2023-07-01', '2023-07-10', 'Daily'),
(8, 8, 8, '2023-08-12', '2023-08-15', 'Monthly'),
(9, 3, 3, '2023-09-07', '2023-09-10', 'Daily'),
(10, 10, 10, '2023-10-10', '2023-10-31', 'Monthly');
GO
-- Create Payment Table
CREATE TABLE CarSchema.Payment (
    paymentID INT PRIMARY KEY,
    leaseID INT,
    paymentDate DATE,
    amount DECIMAL(10, 2),
    CONSTRAINT FK_Payment_Lease FOREIGN KEY (leaseID) REFERENCES CarSchema.Lease(leaseID)ON DELETE CASCADE
);
-- Insert values into Payment Table
INSERT INTO CarSchema.Payment (paymentID, leaseID, paymentDate, amount)
VALUES
(1, 1, '2023-01-03', 200.00),
(2, 2, '2023-02-20', 1000.00),
(3, 3, '2023-03-12', 75.00),
(4, 4, '2023-04-25', 900.00),
(5, 5, '2023-05-07', 60.00),
(6, 6, '2023-06-18', 1200.00),
(7, 7, '2023-07-03', 40.00),
(8, 8, '2023-08-14', 1100.00),
(9, 9, '2023-09-09', 80.00),
(10, 10, '2023-10-25', 1500.00);
GO
--Update the daily rate for a Mercedes car to 68
UPDATE CarSchema.Vehicle 
SET dailyRate = 68.00
WHERE make = 'Mercedes' AND model = 'C-Class';
GO
--Delete a specific customer and all associated leases and payments:
DELETE FROM CarSchema.Payment WHERE leaseID IN (SELECT leaseID FROM Lease WHERE customerID = 3);
DELETE FROM CarSchema.Lease WHERE customerID = 3;
DELETE FROM CarSchema.Customer WHERE customerID = 3;
GO
--Rename the paymentDate column in the Payment table to transactionDate:
EXEC sp_rename 'CarSchema.Payment.paymentDate', 'transactionDate', 'COLUMN';
GO
--Find a specific customer by email
SELECT * FROM CarSchema.Customer WHERE email = 'janesmith@example.com';
GO
--Get active leases for a specific customer
SELECT * FROM CarSchema.Lease
WHERE customerID = 1 AND endDate > GETDATE();
GO
--Find all payments made by a customer with a specific phone number
SELECT * FROM CarSchema.Payment
WHERE leaseID IN (SELECT leaseID FROM CarSchema.Lease
                  WHERE customerID = (SELECT customerID FROM CarSchema.Customer WHERE phoneNumber = '555-555-5555'));
GO
--Calculate the average daily rate of all available cars
SELECT AVG(dailyRate) AS AverageDailyRate
FROM CarSchema.Vehicle
WHERE status = 'available';
GO
--Find the car with the highest daily rate
SELECT TOP 1 * FROM CarSchema.Vehicle
ORDER BY dailyRate DESC;
GO
--Retrieve all cars leased by a specific customer
SELECT v.make, v.model, v.year, l.startDate, l.endDate
FROM CarSchema.Vehicle v
JOIN CarSchema.Lease l ON v.vehicleID = l.vehicleID
WHERE l.customerID = 1;
--OR
SELECT v.make, v.model, v.year, l.startDate, l.endDate
FROM CarSchema.Vehicle v, CarSchema.Lease l 
WHERE v.vehicleID = l.vehicleID AND l.customerID = 1;
GO
--Find the details of the most recent lease
SELECT TOP 1 * FROM CarSchema.Lease
ORDER BY startDate DESC;
GO
--List all payments made in the year 2023
SELECT * FROM CarSchema.Payment
WHERE YEAR(transactionDate) = 2023;
--Retrieve customers who have not made any payments
GO
SELECT * FROM CarSchema.Customer
WHERE customerID NOT IN (SELECT DISTINCT customerID FROM CarSchema.Lease l
                          JOIN CarSchema.Payment p ON l.leaseID = p.leaseID);
GO
--Retrieve Car Details and Their Total Payments
SELECT v.make, v.model, SUM(p.amount) AS TotalPayments
FROM CarSchema.Vehicle v
JOIN CarSchema.Lease l ON v.vehicleID = l.vehicleID
JOIN CarSchema.Payment p ON l.leaseID = p.leaseID
GROUP BY v.make, v.model;
--OR
SELECT v.make, v.model, SUM(p.amount) AS TotalPayments
FROM CarSchema.Vehicle v,CarSchema.Lease l,CarSchema.Payment p 
WHERE v.vehicleID = l.vehicleID AND l.leaseID = p.leaseID
GROUP BY v.make, v.model;
GO
--Calculate Total Payments for Each Customer
SELECT c.firstName, c.lastName, SUM(p.amount) AS TotalPayments
FROM CarSchema.Customer c
JOIN CarSchema.Lease l ON c.customerID = l.customerID
JOIN CarSchema.Payment p ON l.leaseID = p.leaseID
GROUP BY c.firstName, c.lastName;
--OR
SELECT c.firstName, c.lastName, SUM(p.amount) AS TotalPayments
FROM CarSchema.Customer c,CarSchema.Lease l,CarSchema.Payment p 
WHERE c.customerID = l.customerID AND  l.leaseID = p.leaseID
GROUP BY c.firstName, c.lastName;
GO
--List Car Details for Each Lease
SELECT v.make, v.model, v.year, l.startDate, l.endDate
FROM CarSchema.Vehicle v
JOIN CarSchema.Lease l ON v.vehicleID = l.vehicleID;
--OR
SELECT v.make, v.model, v.year, l.startDate, l.endDate
FROM CarSchema.Vehicle v,CarSchema.Lease l 
WHERE v.vehicleID = l.vehicleID;
GO
--Retrieve Details of Active Leases with Customer and Car Information
SELECT c.firstName, c.lastName, v.make, v.model, l.startDate, l.endDate
FROM CarSchema.Lease l
JOIN CarSchema.Customer c ON l.customerID = c.customerID
JOIN CarSchema.Vehicle v ON l.vehicleID = v.vehicleID
WHERE l.endDate > GETDATE();
--OR
SELECT c.firstName, c.lastName, v.make, v.model, l.startDate, l.endDate
FROM CarSchema.Lease l,CarSchema.Customer c,CarSchema.Vehicle v 
WHERE l.customerID = c.customerID AND l.vehicleID = v.vehicleID AND l.endDate > GETDATE();
GO
--Find the Customer Who Has Spent the Most on Leases
SELECT TOP 1 c.firstName, c.lastName, SUM(p.amount) AS TotalSpent
FROM CarSchema.Customer c
JOIN CarSchema.Lease l ON c.customerID = l.customerID
JOIN CarSchema.Payment p ON l.leaseID = p.leaseID
GROUP BY c.firstName, c.lastName
ORDER BY TotalSpent DESC;
--OR
SELECT TOP 1 c.firstName, c.lastName, SUM(p.amount) AS TotalSpent
FROM CarSchema.Customer c, CarSchema.Lease l,CarSchema.Payment p 
WHERE c.customerID = l.customerID AND l.leaseID = p.leaseID
GROUP BY c.firstName, c.lastName
ORDER BY TotalSpent DESC;
GO
--List All Cars with Their Current Lease Information
SELECT v.make, v.model, l.startDate, l.endDate, c.firstName, c.lastName
FROM CarSchema.Vehicle v
JOIN CarSchema.Lease l ON v.vehicleID = l.vehicleID
JOIN CarSchema.Customer c ON l.customerID = c.customerID
WHERE l.endDate > GETDATE();
--OR
SELECT v.make, v.model, l.startDate, l.endDate, c.firstName, c.lastName
FROM CarSchema.Vehicle v,CarSchema.Lease l,CarSchema.Customer c 
WHERE v.vehicleID = l.vehicleID AND l.customerID = c.customerID AND l.endDate > GETDATE();
GO















