--CASESTUDY-PAYEXPERT
USE CASESTUDY;
GO
-- CREATE EMPLOYEE TABLE
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(100),
    LastName  VARCHAR(100),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    Email NVARCHAR(255),
    PhoneNumber NVARCHAR(50),
    Address NVARCHAR(100),
    Position NVARCHAR(100),
    JoiningDate DATE,
    TerminationDate DATE NULL
);
GO
-- CRAETE PYROLL TABLE
CREATE TABLE Payroll (
    PayrollID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT,
    PayPeriodStartDate DATE,
    PayPeriodEndDate DATE,
    BasicSalary DECIMAL(18, 2),
    OvertimePay DECIMAL(18, 2),
    Deductions DECIMAL(18, 2),
    NetSalary DECIMAL(18, 2),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
GO
-- CREATE TAX TABLE
CREATE TABLE Tax (
    TaxID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT,
    TaxYear INT,
    TaxableIncome DECIMAL(18, 2),
    TaxAmount DECIMAL(18, 2),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
GO
-- CRAETE FINANCIALRECORD TABLE
CREATE TABLE FinancialRecord (
    RecordID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT,
    RecordDate DATE,
    Description NVARCHAR(255),
    Amount DECIMAL(18, 2),
    RecordType NVARCHAR(50),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);



