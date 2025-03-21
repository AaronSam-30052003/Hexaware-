USE Sample;
--1
CREATE TABLE Salesman(
					SALES_ID INT PRIMARY KEY,
					NAME VARCHAR(20),
					CITY VARCHAR(20),
					COMMISSION DECIMAL(9,2));
INSERT INTO Salesman VALUES
						(5001,'JAMES HONG','NEW YORK',0.15),
						(5002,'NAIL KNITE','PARIS',0.13),
						(5003,'PIT ALEX','LONDON',0.11),
						(5004,'MC LYON','PARIS',0.14),
						(5005,'PAUL ADAM','ROME',0.13),
						(5006,'LAUSEN HEN','SAN JOSE',0.12);
GO
SELECT * FROM Salesman;
GO
--2
SELECT NAME, COMMISSION
FROM Salesman;
GO 
--3
CREATE TABLE orders (
    ord_no INT PRIMARY KEY,         
    purch_amt DECIMAL(10, 2),      
    ord_date DATE,                  
    customer_id INT,                
    salesman_id INT                
);
INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES
    (70001, 150.5, '2012-10-05', 3005, 5002),
    (70009, 270.65, '2012-09-10', 3001, 5005),
    (70002, 65.26, '2012-10-05', 3002, 5001),
    (70004, 110.5, '2012-08-17', 3009, 5003),
    (70007, 948.5, '2012-09-10', 3005, 5002),
    (70005, 2400.6, '2012-07-27', 3007, 5001),
    (70008, 5760, '2012-09-10', 3002, 5001),
    (70010, 1983.43, '2012-10-10',3004,5006),
	(70003,2480.4,'2012-10-10',3009,5003),
	(70012,250.45,'2012-06-27',3008,5002);
GO
SELECT ord_date, salesman_id, ord_no, purch_amt
FROM orders;
GO

--4
CREATE TABLE orderss (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);
INSERT INTO orderss (ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES
    (70001, 150.5, '2012-10-05', 3005, 5002),
    (70009, 270.65, '2012-09-10', 3001, 5005),
    (70002, 65.26, '2012-10-05', 3002, 5001),
    (70004, 110.5, '2012-08-17', 3009, 5003),
    (70007, 948.5, '2012-09-10', 3005, 5002),
    (70005, 2400.6, '2012-07-27', 3007, 5001),
    (70008, 5760, '2012-09-10', 3002, 5001),
    (70010, 1983.43, '2012-10-10', 3004, 5006);
GO
SELECT DISTINCT salesman_id
FROM orderss;
GO
--5
SELECT NAME,CITY 
FROM Salesman
WHERE CITY='PARIS';
--6
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT
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
SELECT customer_id,cust_name,city,grade,salesman_id
FROM customer
WHERE (grade=200);
GO
--7
CREATE TABLE orderrs (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(9, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);
INSERT INTO orderrs (ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES
    (70001, 150.5, '2012-10-05', 3005, 5002),
    (70009, 270.65, '2012-09-10', 3001, 5005),
    (70002, 65.26, '2012-10-05', 3002, 5001),
    (70004, 110.5, '2012-08-17', 3009, 5003),
    (70007, 948.5, '2012-09-10', 3005, 5002),
    (70005, 2400.6, '2012-07-27', 3007, 5001),
    (70008, 5760, '2012-09-10', 3002, 5001),
    (70010, 1983.43, '2012-10-10', 3004, 5006),
    (70003, 2480.4, '2012-10-10', 3009, 5003);
GO
SELECT ord_no,ord_date,purch_amt
FROM orderrs
WHERE salesman_id=5001;
GO
--8
CREATE TABLE nobel_win (
    YEAR INT,
    SUBJECT VARCHAR(50),
    WINNER VARCHAR(100),
    COUNTRY VARCHAR(50),
    CATEGORY VARCHAR(50)
);
INSERT INTO nobel_win (YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY)
VALUES
    (1970, 'Physics', 'Hannes Alfven', 'Sweden', 'Scientist'),
    (1970, 'Physics', 'Louis Neel', 'France', 'Scientist'),
    (1970, 'Chemistry', 'Luis Federico Leloir', 'France', 'Scientist'),
    (1970, 'Physiology', 'Ulf von Euler', 'Sweden', 'Scientist'),
    (1970, 'Physiology', 'Bernard Katz', 'Germany', 'Scientist'),
    (1970, 'Literature', 'Aleksandr Solzhenitsyn', 'Russia', 'Linguist'),
    (1970, 'Economics', 'Paul Samuelson', 'USA', 'Economist'),
    (1970, 'Physiology', 'Julius Axelrod', 'USA', 'Scientist'),
    (1971, 'Physics', 'Dennis Gabor', 'Hungary', 'Scientist');
GO
SELECT YEAR,SUBJECT,WINNER
FROM nobel_win
WHERE YEAR=1970;
GO
--9
SELECT YEAR,SUBJECT,WINNER,COUNTRY,CATEGORY
FROM nobel_win
WHERE SUBJECT IN ('Physics','Economics') and year=1970;












			
				