USE Practice;
GO
--CREATE DEPARTMENTS TABLE
CREATE TABLE DEPARTMENTS (
    DEPARTMENT_ID INT PRIMARY KEY,
    DEPARTMENT_NAME VARCHAR(30),
    MANAGER_ID INT,
    LOCATION_ID INT
);
--INSERT VALUES INTO DEPARTMENTS TABLE
INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID) VALUES
(50, 'Shipping', 100, 1500),
(60, 'IT', 101, 1400),
(90, 'Executive', 102, 1700),
(20, 'Marketing', 103, 1800),
(80, 'Sales', 104, 1900),
(110, 'Accounting', 105, 2000);
GO
--CREATE EMPLOYEES TABLE
CREATE TABLE EMPLOYEES (
    EMPLOYEE_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(20),
    LAST_NAME VARCHAR(20),
    JOB_ID VARCHAR(10),
    SALARY DECIMAL(8, 2),
    MANAGER_ID INT,
    DEPARTMENT_ID INT,
    HIRE_DATE DATE,
    FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENTS(DEPARTMENT_ID)
);
--INSERT VALUES INTO EMPLOYEES TABLE
INSERT INTO EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, MANAGER_ID, DEPARTMENT_ID, HIRE_DATE) VALUES
(100, 'John', 'King', 'AD_PRES', 24000, NULL, 90, '1990-06-09'),
(101, 'Neena', 'Kochhar', 'AD_VP', 17000, 100, 90, '1992-06-10'),
(102, 'Lex', 'De Haan', 'AD_VP', 17000, 100, 90, '1993-01-13'),
(103, 'Bruce', 'Higgins', 'AC_MGR', 12000, 105, 110, '1994-03-22'),
(104, 'Douglas', 'Grant', 'SA_REP', 11000, 149, 80, '1996-02-23'),
(105, 'Clara', 'Vargas', 'ST_CLERK', 2500, 124, 50, '1998-06-09');
GO
--CREATE LOCATIONS TABLE
CREATE TABLE LOCATIONS (
    LOCATION_ID INT PRIMARY KEY,
    CITY VARCHAR(50)
);
--INSERT VALUES INTO LOCATIONS TABLE
INSERT INTO LOCATIONS (LOCATION_ID, CITY) VALUES
(1500, 'Seattle'),
(1400, 'South Lake'),
(1700, 'Seattle'),
(1800, 'Toronto'),
(1900, 'Chicago');
GO
--CREATE COUNTRIES TABLE
CREATE TABLE COUNTRIES (
    COUNTRY_ID VARCHAR(2) PRIMARY KEY,
    COUNTRY_NAME VARCHAR(40),
    REGION_ID INT
);
--INSERT VALUES INTO COUNTRIES TABLE
INSERT INTO COUNTRIES (COUNTRY_ID, COUNTRY_NAME, REGION_ID) VALUES
('US', 'United States', 1),
('CA', 'Canada', 1);
GO
--CRAETE JOB_HISTORY TABLE
CREATE TABLE JOB_HISTORY (
    EMPLOYEE_ID INT,
    START_DATE DATE,
    END_DATE DATE,
    JOB_ID VARCHAR(10),
    DEPARTMENT_ID INT,
    FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEES(EMPLOYEE_ID),
    FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENTS(DEPARTMENT_ID)
);
--INSERT VAUES INTO JOB_HISTORY TABLE
INSERT INTO JOB_HISTORY (EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID, DEPARTMENT_ID) VALUES
(100, '1990-06-09', '1995-06-09', 'AD_PRES', 90),
(101, '1992-06-10', '1998-06-10', 'AD_VP', 90);
GO
--Task 1: Display the last name, department number, and department name for all employees.
SELECT E.LAST_NAME,E.DEPARTMENT_ID,D.DEPARTMENT_NAME
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;
--OR
SELECT E.LAST_NAME,E.DEPARTMENT_ID,D.DEPARTMENT_NAME
FROM EMPLOYEES E,DEPARTMENTS D 
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;
GO
--Task 2: Create a unique listing of all jobs that are in department 50. Include the location of the department in the output.
SELECT DISTINCT E.JOB_ID,D.LOCATION_ID
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.DEPARTMENT_ID = 50;
--OR
SELECT DISTINCT E.JOB_ID,D.LOCATION_ID
FROM EMPLOYEES E,DEPARTMENTS D 
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND E.DEPARTMENT_ID = 50;
GO
--Task 3: Display the employee last name, department name, location ID, and city of all employees.
SELECT E.LAST_NAME,D.DEPARTMENT_NAME,D.LOCATION_ID,L.CITY
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID;
--OR 
SELECT E.LAST_NAME,D.DEPARTMENT_NAME,D.LOCATION_ID,L.CITY
FROM EMPLOYEES E,DEPARTMENTS D, LOCATIONS L 
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND D.LOCATION_ID = L.LOCATION_ID;
GO
--Task 4: Display the employee last name and department name for all employees who have an �a� (lowercase) in their last names.
SELECT E.LAST_NAME,D.DEPARTMENT_NAME
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.LAST_NAME LIKE '%a%';
--OR
SELECT E.LAST_NAME,D.DEPARTMENT_NAME
FROM EMPLOYEES E,DEPARTMENTS D 
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND E.LAST_NAME LIKE '%a%';
GO
--Task 5: Display the last name, job, department number, and department name for all employees who work in Toronto.
SELECT E.LAST_NAME,E.JOB_ID,E.DEPARTMENT_ID,D.DEPARTMENT_NAME
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
WHERE L.CITY = 'Toronto';
--OR
SELECT E.LAST_NAME,E.JOB_ID,E.DEPARTMENT_ID,D.DEPARTMENT_NAME
FROM EMPLOYEES E,DEPARTMENTS D,LOCATIONS L 
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND D.LOCATION_ID = L.LOCATION_ID AND L.CITY = 'Toronto';
GO
--Task 6: Display the employee last name and employee number along with their manager�s last name and manager number.
SELECT E.LAST_NAME AS Employee,E.EMPLOYEE_ID AS EMP_NUM,M.LAST_NAME AS Manager,M.EMPLOYEE_ID AS Mgr_NUM
FROM EMPLOYEES E
LEFT JOIN EMPLOYEES M ON E.MANAGER_ID = M.EMPLOYEE_ID;
GO
--Task 7: Modify the query to display all employees including King, who has no manager. Order the results by the employee number.
SELECT E.LAST_NAME AS Employee,E.EMPLOYEE_ID AS EMPno,M.LAST_NAME AS Manager,M.EMPLOYEE_ID AS Mgrno
FROM EMPLOYEES E
LEFT JOIN EMPLOYEES M ON E.MANAGER_ID = M.EMPLOYEE_ID
ORDER BY E.EMPLOYEE_ID;
GO
--Task 8: Create a query that displays employee last names, department numbers, and all the employees who work in the same department as a given employee.
SELECT E1.DEPARTMENT_ID AS DEPARTMENT,E1.LAST_NAME AS EMPLOYEE,E2.LAST_NAME AS COLLEAGUE
FROM EMPLOYEES E1
JOIN EMPLOYEES E2 ON E1.DEPARTMENT_ID = E2.DEPARTMENT_ID
WHERE E1.EMPLOYEE_ID != E2.EMPLOYEE_ID;
--OR
SELECT E1.DEPARTMENT_ID AS DEPARTMENT,E1.LAST_NAME AS EMPLOYEE,E2.LAST_NAME AS COLLEAGUE
FROM EMPLOYEES E1,EMPLOYEES E2 
WHERE E1.DEPARTMENT_ID = E2.DEPARTMENT_ID AND E1.EMPLOYEE_ID != E2.EMPLOYEE_ID;
GO
--Task 9: Show the structure of the JOB_GRADES table. Create a query that displays the name, job, department name, salary, and grade for all employees.
CREATE TABLE JOB_GRADES (
    JOB_ID VARCHAR(10),
    GRADE VARCHAR(2)
);
--INSERT DUMMPY VALUES INTO JOB_GRADES TABLE
INSERT INTO JOB_GRADES VALUES('AD_PRES','A'),('AD_VP','B'),('AD_VP','A'),('AC_VP','C');
GO
SELECT E.LAST_NAME,E.JOB_ID,D.DEPARTMENT_NAME,E.SALARY,J.GRADE
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN JOB_GRADES J ON E.JOB_ID = J.JOB_ID;
--OR
SELECT E.LAST_NAME,E.JOB_ID,D.DEPARTMENT_NAME,E.SALARY,J.GRADE
FROM EMPLOYEES E,DEPARTMENTS D,JOB_GRADES J  
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND E.JOB_ID = J.JOB_ID;
GO
--Task 10: Create a query to display the name and hire date of any employee hired after employee Davies.
SELECT E.LAST_NAME,E.HIRE_DATE
FROM EMPLOYEES E
WHERE E.HIRE_DATE > (SELECT HIRE_DATE FROM EMPLOYEES WHERE LAST_NAME = 'Davies');
GO
--Task 11: Display the names and hire dates for all employees who were hired before their managers, along with their manager�s names and hire dates.
SELECT E.LAST_NAME AS Employee,E.HIRE_DATE AS Emp_Hired,M.LAST_NAME AS Manager,M.HIRE_DATE AS Mgr_Hired
FROM EMPLOYEES E
JOIN EMPLOYEES M ON E.MANAGER_ID = M.EMPLOYEE_ID
WHERE E.HIRE_DATE < M.HIRE_DATE;
--OR
SELECT E.LAST_NAME AS Employee,E.HIRE_DATE AS Emp_Hired,M.LAST_NAME AS Manager,M.HIRE_DATE AS Mgr_Hired
FROM EMPLOYEES E,EMPLOYEES M 
WHERE E.MANAGER_ID = M.EMPLOYEE_ID AND  E.HIRE_DATE < M.HIRE_DATE;
GO











