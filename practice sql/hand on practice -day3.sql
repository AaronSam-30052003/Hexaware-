use Sample;
--create table 1 cust_details
create table cust_details(
						CUST_ID INT PRIMARY KEY,
						CUST_NAME VARCHAR(20),
						SALARY DECIMAL (10,2),
						AGE INT NOT NULL);
--create table 2 compy_details and perform foreign key constraints
CREATE TABLE compy_details(
						COMP_NAME VARCHAR(20),
						location VARCHAR(20),
						CUST_ID INT,
						CONSTRAINT COMPY_REF
						FOREIGN KEY(CUST_ID)
						REFERENCES cust_details(CUST_ID)
						ON DELETE CASCADE);
GO
INSERT INTO cust_details VALUES(1,'TOMIE',50000.00,20),(2,'CHOKI',60000.00,21),(3,'MICKEY',45000.00,19);
INSERT INTO compy_details VALUES('GOOGLE','BANGALORE',1),('HEXAWARE','CHENNAI',2);
GO
SELECT* FROM cust_details;
SELECT * FROM compy_details;
GO
DELETE  FROM cust_details WHERE CUST_NAME ='TOMIE';
GO
SELECT *FROM cust_details;
SELECT * FROM compy_details;
go
--use of unique key
CREATE TABLE college(
					ID INT IDENTITY(1,1),
					FIRST_NAME VARCHAR(20) NOT NULL,
					LAST_NAME VARCHAR(20) NOT NULL,
					PLACE VARCHAR(20),
					AGE INT NOT NULL);
GO
INSERT INTO college VALUES('CHOKI','MICKEY','MADURAI',20),('MICKEY','CHOKI','CHENNAI',21),('AARON','SAM','BANGALORE',20);
GO
SELECT * FROM college;

