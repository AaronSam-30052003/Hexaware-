--use demo database
USE DEMO;
--create table MY_EMPLOYEE
CREATE TABLE MY_EMPLOYEE
						(ID INT PRIMARY KEY,LAST_NAME VARCHAR(25),FIRST_NAME VARCHAR(25),USERID VARCHAR(7),SALARY DECIMAL(9,2));
--insert data into table MY_EMPLOYEE
INSERT INTO MY_EMPLOYEE VALUES(1,'Patel','Ralph','rpatel',895.00);
--describe the strcture of table MY_EMPLOYEE
EXEC SP_HELP 'MY_EMPLOYEE';
INSERT INTO MY_EMPLOYEE VALUES(2,'Dancs','Betty','bdancs',860.00);
--retrives the data from the table MY_EMPLOYEE
select *from MY_EMPLOYEE;
go
--Insert data using a placeholder to insert values with concatenated USERID
DECLARE @first_name CHAR(1),@last_name CHAR(7),@user_id VARCHAR(8);
set @first_name='b';
set @last_name='dancs';
set @user_id=@first_name+LEFT(@last_name,7);
INSERT INTO MY_EMPLOYEE VALUES(3,'Dnace','Betty',@user_id,850.00);
go
--Change the last name of employee 3 to Drexler
UPDATE MY_EMPLOYEE
SET LAST_NAME='Drexler' WHERE ID=3;
go
--Change the salary to 1000 for all employees with a salary less than 900
UPDATE MY_EMPLOYEE
SET SALARY=1000 WHERE SALARY <900;
go
--Delete Betty Dancs from the MY_EMPLOYEE table
DELETE FROM MY_EMPLOYEE
WHERE FIRST_NAME='Betty' and LAST_NAME='Dancs';
go
--Delete the entire data from table MY_EMPLOYEE
TRUNCATE TABLE MY_EMPLOYEE;
go
SELECT* FROM MY_EMPLOYEE;



