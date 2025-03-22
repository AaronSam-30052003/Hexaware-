--CASE STUDY-PROJECT MANAGEMENT
USE CASESTUDY;
GO
--CREATE TABLLE PROJECT
CREATE TABLE Project (
    id INT PRIMARY KEY IDENTITY(1,1),
    projectName VARCHAR(255) NOT NULL,
    description TEXT,
    start_date DATE NOT NULL,
    status VARCHAR(50) NOT NULL
);
GO
--CREATE TABLE EMPLOYES
CREATE TABLE Employes(
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(255) NOT NULL,
    designation VARCHAR(255) NOT NULL,
    gender VARCHAR(50),
    salary DECIMAL(10, 2),
    project_id INT,
    FOREIGN KEY (project_id) REFERENCES Project(id)
);
GO
--CREATE TABLE TASK
CREATE TABLE Task (
    task_id INT PRIMARY KEY IDENTITY(1,1),
    task_name VARCHAR(255) NOT NULL,
    project_id INT,
    employee_id INT,
    status VARCHAR(50) NOT NULL,
    FOREIGN KEY (project_id) REFERENCES Project(id),
    FOREIGN KEY (employee_id) REFERENCES Employes(id)
);
