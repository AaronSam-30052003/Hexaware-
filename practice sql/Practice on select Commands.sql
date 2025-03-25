USE Practice;
GO
USE Practice;
GO
--1)The following SELECT statement executes successfully (ANS=TRUE)
SELECT ename, job, sal AS Sal
FROM emp;
GO
--2)The following SELECT statement executes successfully (ANS=TRUE)
SELECT *FROM Dept;
GO
--3)There are three coding errors in this statement. Can you identify them?
/*SELECT empno, ename
Sal x 12 ANNUAL SALARIES
FROM emp;*/--ERROR CODE
--CORRECTED QUERY
SELECT empno, ename, sal * 12 AS "ANNUAL SALARIES"
FROM emp;
GO
--4)Show the structure of the DEPT table. Select all data from the table.
SELECT *FROM dept;
GO
--5)Create a query to display the EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, and DEPTNO for each employee, with employee name appearing first. Provide an alias STARTDATE for the HIREDATE column.
SELECT ename AS Employee, empno AS EMP#, job AS Job_Title, mgr AS Manager, 
       hiredate AS StartDate, sal AS Monthly_Salary, comm AS Commission, deptno AS Department
FROM emp;
GO
--6)Create a query to display unique jobs from the EMP table.
SELECT DISTINCT JOB FROM EMP;
GO
--7)In question no. 5, name the column headings: EMP #, Employee, Job Title, and Hire Date, respectively. Run your query again.
SELECT empno AS "EMP #", ename AS Employee, job AS "Job Title", hiredate AS "Hire Date"
FROM emp;
GO

--Practice II - Restricting and Sorting Data

--8)Create a query to display the name and salary of employees earning more than 2,000 from the EMP table.
SELECT ENAME,SAL FROM EMP
WHERE SAL >2000;
GO
--9)Create a query to display the employee name and department number for employee number 7902.
SELECT ename, deptno FROM emp
WHERE empno = 7902;
GO
--10)Display the name and salary for all employees whose salary is not in the range of 2,000 and 5,000.
SELECT ename, sal FROM emp
WHERE sal NOT BETWEEN 2000 AND 5000;
GO
--11)Display the employee name, job, and hire date of employees hired between February 20, 1981, and May 1, 1981. Order the query in ascending order by hire date.
SELECT ename, job, hiredate
FROM emp WHERE hiredate BETWEEN '1981-02-20' AND '1981-05-01'
ORDER BY hiredate ASC;
GO
--12)Display the name and department number of all employees in departments 10 and 30 in alphabetical order by name.
SELECT ename, deptno FROM emp
WHERE deptno IN (10, 30)
ORDER BY ename;
GO
--13)List the name and salary of employees who earn between 2,000 and 3,000, and are in department 10 or 30. Label the columns "Employee" and "Monthly Salary," respectively.
SELECT ename AS Employee, sal AS "Monthly Salary"
FROM emp
WHERE sal BETWEEN 2000 AND 3000
AND deptno IN (10, 30);
GO
--14)Display the name and hire date of every employee who was hired in 1981.
SELECT ename, hiredate
FROM emp
WHERE YEAR(hiredate) = 1981;
GO
--15) Display the name and job title of all employees who do not have a manager.
SELECT ename, job FROM emp
WHERE mgr IS NULL;
GO
--16)Display the name, salary, and commission for all employees who earn commissions. Sort data in descending order of salary and commissions.
SELECT ename, sal, comm FROM emp
WHERE comm IS NOT NULL
ORDER BY sal DESC, comm DESC;
GO
--17)Display the names of all employees where the third letter of the name is an A.
SELECT ename FROM emp
WHERE ename LIKE '__A%';
--OR
SELECT ENAME FROM EMP
WHERE SUBSTRING(ENAME,3,1)='A';
GO
--18)Display the name of all employees who have an A and an E in their last name.
SELECT ename FROM emp
WHERE ename LIKE '%A%' AND ENAME LIKE '%E%';
--OR
SELECT ename FROM emp
WHERE ename LIKE '%A%E%';
GO
--19)Display the name, job, and salary for all employees whose job is salesman or clerk and whose salary is not equal to 1,600, 800, or 1,300.
SELECT ename, job, sal FROM emp
WHERE job IN ('SALESMAN', 'CLERK')
AND sal NOT IN (1600, 800, 1300);
GO
--20)Display the name, salary, and commission for all employees whose commission amount is 20% greater than salary.
SELECT ename, sal, comm FROM emp
WHERE comm = sal * 1.2;
GO










