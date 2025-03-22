--CASE STUDY- CAR RENTALSYSTEM
USE CASESTUDY;
GO
--CREATE TABLE VEHICLES
CREATE TABLE VEHICLES (
    VEHICLE_ID INT PRIMARY KEY IDENTITY(1,1),
    MAKE NVARCHAR(100),
    MODEL NVARCHAR(100),
    YEAR INT,
    DAILYRATE DECIMAL(10, 2),
    STATUS NVARCHAR(20),
    PASSENGERCAPACITY INT,
    ENGINECAPACITY DECIMAL(10, 2)
);
GO
--CREATE TABLE CUSTOMERS
CREATE TABLE CUSTOMERS (
    CUSTOMER_ID INT PRIMARY KEY IDENTITY(1,1),
    FIRSTNAME NVARCHAR(100),
    LASTNAME NVARCHAR(100),
    EMAIL NVARCHAR(255),
    PHONENUMBER NVARCHAR(15)
);
GO
--CREATE TABLE LEASE
CREATE TABLE LEASE (
    LEASE_ID INT PRIMARY KEY IDENTITY(1,1),
    VEHICLE_ID INT,
    CUSTOMER_ID INT,
    STARTDATE DATETIME,
    ENDDATE DATETIME,
    TYPE NVARCHAR(50),
    CONSTRAINT FK_LEASE_VEHICLE FOREIGN KEY (VEHICLE_ID) REFERENCES VEHICLES(VEHICLE_ID),
    CONSTRAINT FK_LEASE_CUSTOMER FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID)
);
GO
--CREATE TABLE PAYMENT
CREATE TABLE PAYMENT (
    PAYMENT_ID INT PRIMARY KEY IDENTITY(1,1),
    LEASE_ID INT,
    PAYMENTDATE DATETIME,
    AMOUNT DECIMAL(10, 2),
    CONSTRAINT FK_PAYMENT_LEASE FOREIGN KEY (LEASE_ID) REFERENCES LEASE(LEASE_ID)
);


