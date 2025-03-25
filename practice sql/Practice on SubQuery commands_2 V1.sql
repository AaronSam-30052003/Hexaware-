USE Practice;
GO
-- PRACTICE ON SUBSQUERY

--1) Display the name and hire date of any employee in the same department as SMITH. Exclude SMITH.
SELECT ENAME, HIREDATE FROM EMP
WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SMITH')
AND ENAME != 'SMITH'; --WE CAN ALSO USE <>
GO
--2)Display the employee numbers and last names of all employees who earn more than the average salary, sorted by salary.
SELECT EMPNO, ENAME FROM EMP
WHERE SAL > (SELECT AVG(SAL) FROM EMP)
ORDER BY SAL ASC;
GO
--3) Display the employee numbers and names of all employees who work in a department with any employee whose name contains a U.
SELECT EMPNO, ENAME FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%U%');
GO
--4)Display the last name and salary of every employee who reports to BLAKE.
SELECT ENAME, SAL FROM EMP
WHERE MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'BLAKE');
GO
--5)Display the department number, name, and job ID for every employee in the sales department.
SELECT DEPTNO, ENAME, JOB FROM EMP
WHERE DEPTNO = 30; 
GO
--6)Modify the query in 5th exercise to display the employee numbers, last names, and salaries of all employees who earn more than the average salary and who work in a department with any employee with an 'A' in their name.
SELECT EMPNO, ENAME, SAL
FROM EMP WHERE SAL > (SELECT AVG(SAL) FROM EMP)
AND DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%A%');
GO



