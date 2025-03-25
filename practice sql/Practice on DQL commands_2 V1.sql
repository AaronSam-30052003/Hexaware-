CREATE DATABASE Practice;
GO
USE Practice;
GO
--CREATE DEPT TABLE
CREATE TABLE DEPT (
    DEPTNO INT NOT NULL PRIMARY KEY,
    DNAME VARCHAR(14),
    LOC VARCHAR(13)
);
-- INSERT VALUES INTO DEPT TABLE
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
-- INSERT VALUES INTO EMP TABLE
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
--Task 4: Display the highest, lowest, sum, and average salary of all employees. Round the results to the nearest whole number.
SELECT 
    ROUND(MIN(SAL), 0) AS MINIMUM,
    ROUND(MAX(SAL), 0) AS MAXIMUM,
    ROUND(SUM(SAL), 0) AS SUM,
    ROUND(AVG(SAL), 0) AS AVERAGE
FROM EMP;
GO
--Task 5: Display the minimum, maximum, sum, and average salary for each job type.
SELECT 
    JOB,
    ROUND(MIN(SAL), 0) AS MINIMUM,
    ROUND(MAX(SAL), 0) AS MAXIMUM,
    ROUND(SUM(SAL), 0) AS SUM,
    ROUND(AVG(SAL), 0) AS AVERAGE
FROM EMP
GROUP BY JOB;
GO
--Task 6: Display the number of people with the same job.
SELECT JOB,COUNT(*) AS COUNT
FROM EMP
GROUP BY JOB;
GO
--Task 7: Determine the number of managers without listing them. Label the column Number of Managers.
SELECT COUNT(DISTINCT MGR) AS 'NUMBER OF MANAGERS'
FROM EMP
WHERE MGR IS NOT NULL;
--Task 8: Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.
SELECT ROUND(MAX(SAL) - MIN(SAL), 0) AS DIFFERENCE
FROM EMP;
GO
--Task 9 :Display the manager number and the salary of the lowest paid employee for that manager.
--Exclude anyone whose manager is not known. Exclude any groups where the minimum salary is 1,000 or less. Sort the output in descending order of salary.
SELECT  MGR, MIN(SAL) AS MIN_SAL FROM EMP
WHERE MGR IS NOT NULL
GROUP BY MGR
HAVING MIN(SAL) > 1000
ORDER BY MIN(SAL) DESC;
GO
--Task 10: Display the total number of employees and the number of employees hired in 1981, 1983, and 1980. Create appropriate column headings.
SELECT 
    COUNT(*) AS TOTAL,
    SUM(CASE WHEN YEAR(HIREDATE) = 1983 THEN 1 ELSE 0 END) AS [1983],
    SUM(CASE WHEN YEAR(HIREDATE) = 1982 THEN 1 ELSE 0 END) AS [1982],
    SUM(CASE WHEN YEAR(HIREDATE) = 1980 THEN 1 ELSE 0 END) AS [1980]
FROM EMP;
GO
--Task 13:Create a matrix query to display the job, the salary for that job based on department number, and the total salary for that job, for departments 10, 20, and 30, giving each column an appropriate heading.
SELECT 
	JOB,
    SUM(CASE WHEN DEPTNO = 10 THEN SAL ELSE 0 END) AS [Dept 10],
    SUM(CASE WHEN DEPTNO = 20 THEN SAL ELSE 0 END) AS [Dept 20],
    SUM(CASE WHEN DEPTNO = 30 THEN SAL ELSE 0 END) AS [Dept 30],
    SUM(SAL) AS [Total]
FROM EMP
WHERE DEPTNO IN (10, 20, 30)
GROUP BY JOB;
GO






