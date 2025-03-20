CREATE DATABASE demo;
USE demo;
/*go
create table project(pro_name varchar(10), emp_id int,foreign key(emp_id) references employee(emp_id));
create table employee(name varchar(30),emp_id int PRIMARY KEY,age int,email varchar(30));

insert into employee values('Aaron sam',1,20,'aaronvsam3004@gmail.com'),('Sobana',2,20,'sobana3004@gmail.com');
INSERT INTO project (pro_name, emp_id)
VALUES ('Project A', 1), ('Project B', 2);

select* from employee;
select* from project;*/
--TASK 2
UPDATE employee
set age=21 where name ='Aaron sam';
select * from employee;
go
create table summa(id int not null,name varchar(20) not null,age int ,year int,salary decimal(10,2),primary key(id,name));
--valid data
insert into summa values(1,'mickey',10,2004,50000.00),(2,'choki',20,2004,60000.00);
--invalid data
insert into summa values(2,'mickey',15,2005,59000.00);
select *from summa;
go

--task 3
--Create a table without constraints
CREATE TABLE employees (
    emp_id INT,
    name VARCHAR(50),
    age INT,
    salary DECIMAL(10, 2)
);

-- Add CHECK constraint for age >= 18
ALTER TABLE employees
ADD CONSTRAINT check_age CHECK(age >= 18);

-- Add NOT NULL constraint on the 'name' column
ALTER TABLE employees
ALTER COLUMN name VARCHAR(50) NOT NULL;

-- Valid data
INSERT INTO employees (emp_id, name, age, salary)
VALUES (1, 'AARONSAM', 25, 50000.00);

-- invlaid data
INSERT INTO employees (emp_id, name, age, salary)
VALUES (3, 'MICKEY', 16, 30000.00); 
select *from employees;
go
--TASK-1 Query to find the condition of the CHECK constraint for 'employees' table
