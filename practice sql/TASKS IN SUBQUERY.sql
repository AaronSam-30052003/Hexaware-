USE demo;
GO
--TASKS IN SUB-QUERIES

--FIRST CREATE TABLE AND INSERT VALUES

-- CREATE SALESMAN TABLE
CREATE TABLE Salesman (
    salesman_id INT,
    name VARCHAR(100),
    city VARCHAR(100),
    commission FLOAT
);

-- INSERT VALUES INTO SALESMAN TABLE
INSERT INTO Salesman (salesman_id, name, city, commission)
VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', 'San Jose', 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);
GO
-- CREATE ORDERS TABLE
CREATE TABLE Orders (
    ord_no INT,
    purch_amt FLOAT,
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);
-- INSERT VALUES INTO ORDERS TABLE
INSERT INTO Orders (ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.6, '2012-04-25', 3002, 5001);
GO
-- CREATE CUSTOMER TABLE
CREATE TABLE Customer (
    customer_id INT,
    cust_name VARCHAR(100),
    city VARCHAR(100),
    grade INT,
    salesman_id INT
);
-- INSERT VALUES INTO CUSTOMER TABLE
INSERT INTO Customer (customer_id, cust_name, city, grade, salesman_id)
VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', 100, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002),
(3003, 'Jozy Altidor', 'Moncow', 200, 5007);
GO
--CREATE COMPANY_MAST TABLE
CREATE TABLE company_mast (
    COM_ID INT,
    COM_NAME VARCHAR(50)
);
--INSERT VALUES INTO COMPANY_MAST TABLE
INSERT INTO company_mast (COM_ID, COM_NAME)
VALUES
(11, 'Samsung'),
(12, 'iBall'),
(13, 'Epsion'),
(14, 'Zebronics'),
(15, 'Asus'),
(16, 'Frontech');
GO
--CREATE ITEM_MAST TABLE
CREATE TABLE item_mast (
    PRO_ID INT,
    PRO_NAME VARCHAR(50),
    PRO_PRICE DECIMAL(10, 2),
    PRO_COM INT
);
--INSERT VALUES INTO ITEM_MAST TABLE
INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM)
VALUES
(101, 'Mother Board', 3200.00, 15),
(102, 'Key Board', 450.00, 16),
(103, 'ZIP drive', 250.00, 14),
(104, 'Speaker', 550.00, 16),
(105, 'Monitor', 5000.00, 11),
(106, 'DVD drive', 900.00, 12),
(107, 'CD drive', 800.00, 12),
(108, 'Printer', 2600.00, 13),
(109, 'Refill cartridge', 350.00, 13),
(110, 'Mouse', 250.00, 12);
GO
--CREATE EMP_DETAILS TABLE
CREATE TABLE emp_details (
    EMP_IDNO INT,
    EMP_FNAME VARCHAR(50),
    EMP_LNAME VARCHAR(50),
    EMP_DEPT INT
);
--INSERT VALUES INTO EMP_DEATILS TABLE
INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT)
VALUES
(127323, 'Michale', 'Robbin', 57),
(526689, 'Carlos', 'Snares', 63),
(843795, 'Enric', 'Dosio', 57),
(328717, 'Jhon', 'Snares', 63),
(444527, 'Joseph', 'Dosni', 47),
(659831, 'Zanifer', 'Emily', 47),
(847674, 'Kuleswar', 'Sitaraman', 57),
(748681, 'Henrey', 'Gabriel', 47),
(555935, 'Alex', 'Manuel', 57),
(539569, 'George', 'Mardy', 27),
(733843, 'Mario', 'Saule', 63),
(631548, 'Alan', 'Snappy', 27),
(839139, 'Maria', 'Foster', 57);
GO
--CREATE EMP_DEPARTMENT TABLE
CREATE TABLE emp_department (
    DPT_CODE INT,
    DPT_NAME VARCHAR(50),
    DPT_ALLOTMENT INT
);
--INSERT VALUES INTO EMP_DEPARTMENT TABLE
INSERT INTO emp_department (DPT_CODE, DPT_NAME, DPT_ALLOTMENT)
VALUES
(57, 'IT', 65000),
(63, 'Finance', 15000),
(47, 'HR', 240000),
(27, 'RD', 55000),
(89, 'QC', 75000);
GO
--1)Display Orders Issued by Salesman Paul Adam
SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM Orders
WHERE salesman_id = (SELECT salesman_id FROM Salesman WHERE name = 'Paul Adam');
GO
--2)Display Orders Generated by London-Based Salespeople
SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM Orders
WHERE salesman_id IN (SELECT salesman_id FROM Salesman WHERE city = 'London');
GO
--3)Display Orders from Salespeople Handling Customer ID 3007
SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM Orders
WHERE customer_id =3007;
GO
--4)Display Orders Exceeding Average Value on 10-Oct-2012
SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM Orders
WHERE ord_date = '2012-10-10' 
AND purch_amt > (SELECT AVG(purch_amt) FROM Orders WHERE ord_date = '2012-10-10');
GO
--5)Display Orders Generated in New York City
SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM Orders
WHERE salesman_id IN (SELECT salesman_id FROM Salesman WHERE city = 'New York');
GO
--6)Display Commission of Salespeople in Paris
SELECT Commission FROM Salesman
WHERE city='Paris';
GO
--7)Display Customers with ID Below 2001 Under Salesperson Mc Lyon
SELECT customer_id, cust_name FROM Customer
WHERE customer_id < 2001 
AND salesman_id = (SELECT salesman_id FROM Salesman WHERE name = 'Mc Lyon');--THERE IS NO NAME AS MC LYON IN GIVEN DATA OF SALESMAN TABLE
GO
--8) Count of Customers with Above-Average Grades in New York City
SELECT grade, COUNT(*) AS Totalcount FROM Customer
WHERE city = 'New York' AND grade > (SELECT AVG(grade) FROM Customer WHERE city = 'New York')
GROUP BY grade;
GO
--9)Display Orders of Salespeople with Maximum Commission
SELECT ord_no, purch_amt, ord_date, salesman_id
FROM Orders
WHERE salesman_id = (SELECT salesman_id FROM Salesman WHERE commission = (SELECT MAX(commission) FROM Salesman));
GO
--10)Display Customers Who Placed Orders on 17th August 2012
SELECT * FROM Orders O,Customer C 
WHERE O.customer_id = C.customer_id AND O.ord_date = '2012-08-17';
GO
--11)Display Salespeople with More Than One Customer

SELECT salesman_id, name
FROM Salesman
WHERE salesman_id IN (SELECT salesman_id FROM Customer
					  GROUP BY salesman_id
					  HAVING COUNT(customer_id) > 1);
GO
--12)Display Orders with Amount Above Average Order Value
SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM Orders
WHERE purch_amt > (SELECT AVG(purch_amt) FROM Orders);
GO
--13)Display Orders with Amount ? Average Order Value
SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM Orders
WHERE purch_amt >= (SELECT AVG(purch_amt) FROM Orders);
GO
--14)Show Order Sums by Date Exceeding Max Order by 1000
SELECT ord_date, SUM(purch_amt) AS total_amount FROM Orders
GROUP BY ord_date
HAVING SUM(purch_amt) > (SELECT MAX(purch_amt) + 1000 FROM Orders O WHERE ord_date = O.ord_date);
GO
--15)Show All Customers If Any Are Located in London
IF EXISTS (SELECT 1 FROM Customer WHERE city = 'London')
SELECT * FROM Customer;
GO
--16)Find Salespeople Handling Multiple Customers
SELECT S.salesman_id, S.name, S.city, S.commission
FROM Salesman S, Customer C WHERE S.salesman_id = C.salesman_id
GROUP BY S.salesman_id, S.name, S.city, S.commission
HAVING COUNT(C.customer_id) > 1;
GO
--17)Find Salespeople Handling Only One Customer
SELECT S.salesman_id, S.name, S.city, S.commission
FROM Salesman S,Customer C WHERE S.salesman_id = C.salesman_id
GROUP BY S.salesman_id, S.name, S.city, S.commission
HAVING COUNT(C.customer_id) = 1;
GO
--18)Find Salespeople Handling Customers with Multiple Orders
SELECT S.salesman_id, S.name, S.city, S.commission
FROM Salesman S,Customer C,Orders O 
WHERE S.salesman_id = C.salesman_id AND C.customer_id = O.customer_id
GROUP BY S.salesman_id, S.name, S.city, S.commission
HAVING COUNT(O.ord_no) > 1;
GO
--19)Find Salespeople in Cities with at Least One Customer
SELECT DISTINCT S.salesman_id, S.name, S.city, S.commission
FROM Salesman S
WHERE S.city IN (SELECT DISTINCT city FROM Customer);
GO
--20)Find Salespeople Living in a Customer's City
SELECT S.salesman_id, S.name, S.city, S.commission
FROM Salesman S
WHERE EXISTS (
    SELECT * FROM Customer C
    WHERE C.city = S.city AND C.salesman_id = S.salesman_id);
GO
--21)Find Salespeople with Names Alphabetically Before Customers
SELECT S.salesman_id, S.name, S.city, S.commission
FROM Salesman S,Customer C 
WHERE S.salesman_id = C.salesman_id AND S.name < C.cust_name;
GO
--22)Find Customers with Higher Grade Than Those Below New York
SELECT C.customer_id, C.cust_name, C.city, C.grade, C.salesman_id
FROM Customer C
WHERE C.grade > (SELECT MAX(grade) FROM Customer WHERE city < 'New York');
GO
--23)Find Orders Exceeding Any Order from September 10, 2012
SELECT O.ord_no, O.purch_amt, O.ord_date, O.customer_id, O.salesman_id
FROM Orders O
WHERE O.purch_amt > ANY (SELECT purch_amt FROM Orders WHERE ord_date = '2012-09-10');
GO
--24)Find Orders with Amount Less Than Any Order from London
SELECT O.ord_no, O.purch_amt, O.ord_date, O.customer_id, O.salesman_id
FROM Orders O
WHERE O.purch_amt < ANY (SELECT purch_amt FROM Orders O2,Customer C
						 WHERE O2.customer_id = C.customer_id AND C.city = 'London');
GO
--25)Find Orders with Amount Less Than the Max Order from London
SELECT O.ord_no, O.purch_amt, O.ord_date, O.customer_id, O.salesman_id
FROM Orders O
WHERE O.purch_amt < (SELECT MAX(purch_amt) FROM Orders O,Customer C 
					 WHERE  O.customer_id = C.customer_id AND C.city = 'London');
GO
--26)Find Customers with Higher Grades Than Those in New York
SELECT C.customer_id, C.cust_name, C.city, C.grade, C.salesman_id
FROM Customer C
WHERE C.grade > (SELECT MAX(grade) FROM Customer
				 WHERE city = 'New York');
GO
--27)Calculate Total Order Amount by Salespeople in Customer Cities
SELECT S.name, S.city, SUM(O.purch_amt) AS total_order_amount
FROM Salesman S,Orders O,Customer C 
WHERE S.salesman_id = O.salesman_id AND O.customer_id = C.customer_id AND S.city = C.city
GROUP BY S.name, S.city;
--OR
SELECT S.name, S.city, SUM(O.purch_amt) AS total_order_amount
FROM Salesman S
JOIN Orders O ON S.salesman_id = O.salesman_id
JOIN Customer C ON O.customer_id = C.customer_id
WHERE S.city = C.city
GROUP BY S.name, S.city;
GO
--28)Find Customers with Grades Different from Those in London
SELECT C.customer_id, C.cust_name, C.city, C.grade, C.salesman_id
FROM Customer C
WHERE C.grade NOT IN (SELECT grade FROM Customer WHERE city = 'London');
GO
--29)Find Customers with Grades Different from Those in Paris
SELECT C.customer_id, C.cust_name, C.city, C.grade, C.salesman_id
FROM Customer C
WHERE C.grade NOT IN(SELECT grade FROM Customer WHERE city = 'Paris');
GO
--30)Find Customers with Grades Different from Any in Dallas
SELECT C.customer_id, C.cust_name, C.city, C.grade, C.salesman_id
FROM Customer C
WHERE C.grade NOT IN (SELECT grade FROM Customer WHERE city = 'Dallas');
GO
--31)Calculate Average Price of Products by Manufacturer
SELECT CM.COM_NAME AS Company, AVG(IM.PRO_PRICE) AS Average_Price
FROM item_mast IM,company_mast CM 
WHERE IM.PRO_COM = CM.COM_ID
GROUP BY CM.COM_NAME;
GO
--32)Calculate Average Price of Manufacturer's Products (? 350)
SELECT CM.COM_NAME AS Company, AVG(IM.PRO_PRICE) AS Average_Price
FROM item_mast IM, company_mast CM 
WHERE IM.PRO_COM = CM.COM_ID AND IM.PRO_PRICE >= 350
GROUP BY CM.COM_NAME;
GO
--33)Find Most Expensive Product of Each Company
SELECT CM.COM_NAME AS Company, IM.PRO_NAME AS Product_Name, MAX(IM.PRO_PRICE) AS Price
FROM item_mast IM,company_mast CM 
WHERE IM.PRO_COM = CM.COM_ID
GROUP BY CM.COM_NAME, IM.PRO_NAME;
GO
--34)Find Employees with Last Name Gabriel or Dosio
SELECT EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT
FROM emp_details
WHERE EMP_LNAME IN ('Gabriel', 'Dosio');
GO
--35)Find Employees in Departments 89 or 63
SELECT EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT
FROM emp_details
WHERE EMP_DEPT IN (89, 63);
GO
--36) Find Employees in Departments with Allotment > Rs. 50000
SELECT ED.EMP_FNAME, ED.EMP_LNAME
FROM emp_details ED,emp_department EDPT 
WHERE ED.EMP_DEPT = EDPT.DPT_CODE AND EDPT.DPT_ALLOTMENT > 50000;
GO
--37)Find Departments with Sanction Amount Above Average
SELECT DPT_CODE, DPT_NAME, DPT_ALLOTMENT
FROM emp_department
WHERE DPT_ALLOTMENT > (SELECT AVG(DPT_ALLOTMENT) FROM emp_department);
GO
--38)Find Departments with More Than Two Employees
SELECT EDPT.DPT_NAME
FROM emp_details ED,emp_department EDPT  
WHERE ED.EMP_DEPT = EDPT.DPT_CODE
GROUP BY EDPT.DPT_NAME
HAVING COUNT(ED.EMP_IDNO) > 2;
GO
--39)Find Employees in Departments with Second Lowest Allotment
SELECT ED.EMP_FNAME, ED.EMP_LNAME
FROM emp_details ED,emp_department EDPT 
WHERE ED.EMP_DEPT = EDPT.DPT_CODE
AND EDPT.DPT_ALLOTMENT = (
    SELECT MIN(DPT_ALLOTMENT)
    FROM emp_department
    WHERE DPT_ALLOTMENT > (
        SELECT MIN(DPT_ALLOTMENT) FROM emp_department));
GO
































