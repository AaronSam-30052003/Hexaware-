--JOIN TASKS
CREATE DATABASE JOINTASKS;
USE JOINTASKS;
--CREATE TABLE SALESMAN
CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name NVARCHAR(50),
    city NVARCHAR(50),
    commission DECIMAL(5, 2)
);
--INSERT VALUES INTO SALESMAN TABLE
INSERT INTO salesman (salesman_id, name, city, commission) 
VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);
GO
--CREATE TABLE CUSTOMER AND INSERT VALUES INTO IT
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    cust_name NVARCHAR(50),
    city NVARCHAR(50),
    grade INT,
    salesman_id INT,
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);

INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id) 
VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', NULL, 5005);
GO
--CREATE TABLE ORDERS AND INSERT VALUES
CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);
INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) 
VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760.0, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003);
GO
-- CREATE TABLE company_mast 
CREATE TABLE company_mast (
    COM_ID INT PRIMARY KEY,
    COM_NAME VARCHAR(50)
);

-- INSERT VALUES INTO company_mast TABLE
INSERT INTO company_mast (COM_ID, COM_NAME)
VALUES 
    (11, 'Samsung'),
    (12, 'iBall'),
    (13, 'Epsion'),
    (14, 'Zebronics'),
    (15, 'Asus'),
    (16, 'Frontech');
GO
-- CRAETE item_mast TABLE
CREATE TABLE item_mast (
    PRO_ID INT PRIMARY KEY,
    PRO_NAME VARCHAR(50),
    PRO_PRICE DECIMAL(10, 2),
    PRO_COM INT
);

-- INSERT VALUES into item_mast TABLE
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
-- CREATE emp_department TABLE
CREATE TABLE emp_department (
    DPT_CODE INT PRIMARY KEY,
    DPT_NAME VARCHAR(50),
    DPT_ALLOTMENT DECIMAL(10, 2)
);

-- INSERT VALUES into emp_department TABLE
INSERT INTO emp_department (DPT_CODE, DPT_NAME, DPT_ALLOTMENT)
VALUES 
    (57, 'IT', 65000),
    (63, 'Finance', 15000),
    (47, 'HR', 240000),
    (27, 'RD', 55000),
    (89, 'QC', 75000);
GO
--CREATE emp_details TABLE
CREATE TABLE emp_details (
    EMP_IDNO INT PRIMARY KEY,
    EMP_FNAME VARCHAR(50),
    EMP_LNAME VARCHAR(50),
    EMP_DEPT INT,
    FOREIGN KEY (EMP_DEPT) REFERENCES emp_department(DPT_CODE)
);
-- INSERT VALUES INTO emp_details TABLE
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
    (555935, 'Alex', 'Manuel', 57);
GO
--1
SELECT s.name AS saleman , c.cust_name, c.city
FROM salesman s,customer c
WHERE s.city = c.city;
GO
--2
SELECT o.ord_no, o.purch_amt, c.cust_name, c.city
FROM orders o,customer c 
WHERE o.customer_id = c.customer_id AND  o.purch_amt BETWEEN 500 AND 2000;
GO
--3
SELECT c.cust_name, c.city, s.name AS Salesman, s.commission
FROM customer c,salesman s
WHERE c.salesman_id = s.salesman_id;
GO
--4
SELECT c.cust_name, c.city, s.name AS Salesman, s.commission
FROM customer c,salesman s
WHERE c.salesman_id=s.salesman_id AND commission >0.12;
GO
--5
SELECT c.cust_name, c.city AS customer_city, s.name AS Salesman, s.city AS salesman_city, s.commission
FROM customer c,salesman s
WHERE c.salesman_id = s.salesman_id AND c.city <> s.city AND s.commission > 0.12; 
--6
SELECT o.ord_no, o.ord_date, o.purch_amt, c.cust_name, c.grade, s.name AS Salesman, s.commission
FROM orders o,customer c,salesman s
WHERE o.customer_id = c.customer_id AND o.salesman_id = s.salesman_id;
GO
--7
SELECT o.ord_no, o.purch_amt, o.ord_date, c.cust_name, c.city AS customer_city, c.grade, s.name AS salesman_name, s.city AS salesman_city, s.commission
FROM orders o,customer c,salesman s
WHERE o.customer_id = c.customer_id AND  o.salesman_id = s.salesman_id;
GO
--8
SELECT c.cust_name, c.city AS customer_city, c.grade, s.name AS salesman, s.city AS salesman_city
FROM customer c, salesman s
WHERE c.salesman_id = s.salesman_id
ORDER BY c.customer_id ASC;
GO
--9
SELECT c.cust_name, c.city AS customer_city, c.grade, s.name AS Salesman, s.city AS salesman_city
FROM customer c,salesman s
WHERE c.salesman_id = s.salesman_id AND  c.grade < 300
ORDER BY c.customer_id ASC;
GO
--10
SELECT c.cust_name, c.city AS customer_city, o.ord_no, o.ord_date, o.purch_amt
FROM customer c
LEFT JOIN orders o ON c.customer_id = o.customer_id
ORDER BY o.ord_date ASC;
GO
--11
SELECT c.cust_name, c.city AS customer_city, o.ord_no, o.ord_date, o.purch_amt, s.name AS salesman_name, s.commission
FROM customer c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN salesman s ON c.salesman_id = s.salesman_id
ORDER BY o.ord_date ASC;
GO
--12
SELECT DISTINCT s.name AS salesperson_name, s.city AS salesperson_city,s.salesman_id 
FROM salesman s
LEFT JOIN customer c ON s.salesman_id = c.salesman_id
ORDER BY s.salesman_id ASC;
GO
--13
SELECT s.name AS salesperson_name,c.cust_name,c.city AS customer_city,c.grade,o.ord_no,o.ord_date,o.purch_amt
FROM salesman s
LEFT JOIN customer c ON s.salesman_id = c.salesman_id
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE s.salesman_id IS NOT NULL AND (o.ord_no IS NOT NULL OR c.customer_id IS NULL)
ORDER BY o.ord_date ASC;
GO
--14
SELECT DISTINCT s.name AS salesperson_name, s.city AS salesperson_city,s.salesman_id
FROM salesman s
LEFT JOIN customer c ON s.salesman_id = c.salesman_id
LEFT JOIN orders o ON c.customer_id = o.customer_id AND o.purch_amt >= 2000
WHERE c.customer_id IS NULL OR o.ord_no IS NOT NULL
ORDER BY s.salesman_id ;
GO
--15
SELECT c.cust_name,c.city AS customer_city,o.ord_no,o.ord_date,o.purch_amt
FROM customer c,orders o
WHERE c.customer_id = o.customer_id AND c.customer_id IS NOT NULL
ORDER BY  o.ord_date ASC;
GO
--16
SELECT c.cust_name,c.city AS customer_city,o.ord_no,o.ord_date,o.purch_amt
FROM customer c,orders o 
WHERE c.customer_id = o.customer_id AND (c.grade IS NOT NULL AND o.ord_no IS NOT NULL)									
OR (c.customer_id IS NULL AND o.ord_no IS NOT NULL)
ORDER BY o.ord_date ASC;
GO
--17
SELECT s.salesman_id, 
	s.name AS salesman_name, 
    s.city AS salesman_city, 
    s.commission, 
    c.customer_id, 
    c.cust_name, 
    c.city AS customer_city, 
    c.grade, 
    c.salesman_id AS customer_salesman_id
FROM salesman s
CROSS JOIN customer c;
GO
--18
SELECT s.salesman_id, s.name AS salesman_name, s.city AS salesman_city, c.customer_id, c.cust_name, c.city AS customer_city
FROM salesman s,customer c
WHERE s.city = c.city;
GO
--19
SELECT s.salesman_id, s.name AS salesman_name, s.city AS salesman_city, c.customer_id, c.cust_name, c.city AS customer_city, c.grade
FROM salesman s,customer c
WHERE s.city = c.city AND c.grade IS NOT NULL;
GO
--20
SELECT s.salesman_id, s.name AS salesman_name, s.city AS salesman_city, c.customer_id, c.cust_name, c.city AS customer_city, c.grade
FROM salesman s,customer c
WHERE s.city != c.city AND c.grade IS NOT NULL;
GO
--21
SELECT cm.COM_ID, cm.COM_NAME, im.PRO_ID, im.PRO_NAME, im.PRO_PRICE, im.PRO_COM
FROM company_mast cm,item_mast im
WHERE cm.COM_ID = im.PRO_COM;
GO
--22
SELECT im.PRO_NAME, im.PRO_PRICE, cm.COM_NAME
FROM item_mast im,company_mast cm
WHERE im.PRO_COM = cm.COM_ID;
GO
--23
SELECT cm.COM_NAME, AVG(im.PRO_PRICE) AS Average_Price
FROM company_mast cm,item_mast im
WHERE cm.COM_ID = im.PRO_COM
GROUP BY cm.COM_NAME;
GO
--24
SELECT cm.COM_NAME, AVG(im.PRO_PRICE) AS Average_Price
FROM company_mast cm,item_mast im
WHERE cm.COM_ID = im.PRO_COM AND im.PRO_PRICE >= 350
GROUP BY cm.COM_NAME;
GO
--25
SELECT im.PRO_NAME, im.PRO_PRICE, cm.COM_NAME
FROM company_mast cm, item_mast im
WHERE cm.COM_ID = im.PRO_COM
AND im.PRO_PRICE = (SELECT MAX(PRO_PRICE) 
                    FROM item_mast 
                    WHERE PRO_COM = im.PRO_COM);
GO
--26
SELECT ed.EMP_IDNO, ed.EMP_FNAME, ed.EMP_LNAME, ed.EMP_DEPT, ed.EMP_FNAME + ' ' + ed.EMP_LNAME AS Full_Name,dp.DPT_NAME, 
dp.DPT_ALLOTMENT
FROM emp_details ed, emp_department dp
WHERE ed.EMP_DEPT = dp.DPT_CODE;
GO
--27
SELECT ed.EMP_FNAME, ed.EMP_LNAME, dp.DPT_NAME, dp.DPT_ALLOTMENT
FROM emp_details ed, emp_department dp
WHERE ed.EMP_DEPT = dp.DPT_CODE;
GO
--28
SELECT ed.EMP_FNAME, ed.EMP_LNAME, dp.DPT_NAME
FROM emp_details ed,emp_department dp
WHERE ed.EMP_DEPT = dp.DPT_CODE AND dp.DPT_ALLOTMENT > 50000;
GO
--29
SELECT dp.DPT_NAME
FROM emp_details ed,emp_department dp 
WHERE ed.EMP_DEPT = dp.DPT_CODE
GROUP BY dp.DPT_NAME
HAVING COUNT(ed.EMP_IDNO) > 2;
GO














