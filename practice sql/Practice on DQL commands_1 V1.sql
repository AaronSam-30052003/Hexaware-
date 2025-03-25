USE demo;
GO
--CRAETE DEPT TABLE
CREATE TABLE DEPT (
    DEPTNO INT NOT NULL PRIMARY KEY,
    DNAME VARCHAR(14),
    LOC VARCHAR(13)
);
--INSERT VALUES INTO DEPT TABLE
INSERT INTO DEPT (DEPTNO, DNAME, LOC) VALUES 
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');
GO
--CREATE EMP TABLE
CREATE TABLE EMP (
    EMPNO INT NOT NULL PRIMARY KEY,
    ENAME VARCHAR(10),
    JOB VARCHAR(9),
    MGR INT,
    HIREDATE DATE,
    SAL DECIMAL(7,2),
    COMM DECIMAL(7,2),
    DEPTNO INT NOT NULL,
    FOREIGN KEY (DEPTNO) REFERENCES DEPT(DEPTNO)
);
--INSERT VALUES INTO EMP TABLE
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES
(7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, 10),
(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30),
(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 10),
(7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, NULL, 20),
(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30),
(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30),
(7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 30),
(7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, NULL, 30),
(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30),
(7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, NULL, 20),
(7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, NULL, 20),
(7788, 'SCOTT', 'ANALYST', 7566, '1982-12-09', 3000, NULL, 20),
(7876, 'ADAMS', 'CLERK', 7788, '1983-01-12', 1100, NULL, 20),
(7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, NULL, 10);
GO
--Task 1: Query to Display Name and Salary of Employees Earning More than 2,000
SELECT ENAME,SAL FROM EMP
WHERE SAL>2000;
GO
--Task 2: Query to Display the Employee Name and Department Number for Employee Number 7902
SELECT ENAME,DEPTNO FROM EMP
WHERE EMPNO=7902;
GO
--Task 3: Query to Display Employees Whose Salary Is Not in the Range of 2,000 and 5,000
SELECT ENAME,SAL FROM EMP
WHERE SAL NOT BETWEEN 2000 AND 5000;
GO
--Task 4: Query to Display Employee Name, Job, and Hire Date for Employees Hired Between 2/20/1981 and 5/1/1981
SELECT ENAME,JOB,HIREDATE FROM EMP
WHERE HIREDATE BETWEEN '2/10/1981' AND '5/1/1981'
ORDER BY HIREDATE;
GO
--Task 5: Query to Display the Name and Department Number of All Employees in Departments 10 and 30 in Alphabetical Order by Name
SELECT ENAME,DEPTNO FROM EMP
WHERE DEPTNO IN(10,30)
ORDER BY ENAME;
GO
--Task 6: Query to List the Name and Salary of Employees Who Earn Between 2,000 and 3,000, and Are in Department 10 or 30
SELECT ENAME,SAL FROM EMP
WHERE SAL BETWEEN 2000 AND 3000 AND DEPTNO IN(10,30)
ORDER BY ENAME;
GO
--Task 7: Query to Display the Name and Hire Date of Every Employee Hired in 1981
SELECT ENAME,HIREDATE FROM EMP
WHERE YEAR(HIREDATE)='1981';
GO
--Task 8: Query to Display the Name and Job Title of All Employees Who Do Not Have a Manager
SELECT ENAME,JOB FROM EMP
WHERE MGR IS NULL;
GO
--Task 9: Query to Display the Name, Salary, and Commission for All Employees Who Earn Commissions. Sort in Descending Order of Salary and Commissions
SELECT ENAME,SAL,COMM FROM EMP
WHERE COMM IS NOT NULL
ORDER BY SAL,COMM DESC;
GO
--Task 10: Query to Display the Names of All Employees Where the Third Letter of the Name is an "A"
SELECT ENAME
FROM EMP
WHERE SUBSTRING(ENAME, 3, 1) = 'A';
--OR THIS METHOD
SELECT ENAME FROM EMP WHERE ENAME LIKE '__A%';
GO
--Task 11: Query to Display the Name of All Employees Who Have an "A" and an "E" in Their Last Name
SELECT ENAME FROM EMP
WHERE ENAME LIKE '%A%' AND ENAME LIKE '%E%';
GO
--Task 12: Query to Display the Name, Job, and Salary for All Employees Whose Job is Salesman or Clerk and Whose Salary is Not Equal to 1,600, 8000, or 1,300
SELECT ENAME,JOB,SAL FROM EMP
WHERE JOB IN ('Salesman','Clerk') AND SAL NOT IN (1600,8000,1300);
GO
--Task 13: Query to Display the Name, Salary, and Commission for All Employees Whose Commission Amount is 20% Greater Than Salary
SELECT ENAME, SAL, COMM FROM EMP
WHERE COMM = SAL * 1.2;
GO
