-- Create Database if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'CareerHub')
CREATE DATABASE CareerHub;
GO
USE CareerHub;
GO
--Create schema 
CREATE SCHEMA CareerhubSchema;
-- Create Companies Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'CareerhubSchema.Companies')
CREATE TABLE CareerhubSchema.Companies (
        CompanyID INT PRIMARY KEY, 
        CompanyName NVARCHAR(255), 
        Location NVARCHAR(255)
    );
GO
--insert data into companies table
INSERT INTO CareerhubSchema.Companies (CompanyID, CompanyName, Location)
VALUES 
(1, 'Hexaware', 'Chennai'),
(2, 'Avasoft', 'Chennai'),
(3, 'Google', 'London'),
(4, 'IBM', 'Los Angeles'),
(5, 'Microsoft', 'Chicago'),
(6, 'QuickTech', 'Austin'),
(7, 'CodeMasters', 'Seattle'),
(8, 'GreenTech', 'San Francisco'),
(9, 'DataWiz', 'Austin'),
(10, 'SmartSystems', 'Boston');
GO
-- Create Jobs Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'CareerhubSchema.Jobs')
    CREATE TABLE CareerhubSchema.Jobs (
        JobID INT PRIMARY KEY,
        CompanyID INT,
        JobTitle NVARCHAR(255),
        JobDescription TEXT,
        JobLocation NVARCHAR(255),
        Salary DECIMAL(18, 2),
        JobType NVARCHAR(50),
        PostedDate DATETIME,
        CONSTRAINT FK_Job_Company FOREIGN KEY (CompanyID) REFERENCES CareerhubSchema.Companies(CompanyID)ON DELETE CASCADE);
GO
--insert values into jobs table
INSERT INTO CareerhubSchema.Jobs (JobID, CompanyID, JobTitle, JobDescription, JobLocation, Salary, JobType, PostedDate)
VALUES 
(1, 1, 'Software Developer', 'Develop and maintain software applications', 'New York', 90000.00, 'Full-time', '2025-03-01'),
(2, 2, 'Product Manager', 'Oversee product development and launch', 'San Francisco', 120000.00, 'Full-time', '2025-03-05'),
(3, 3, 'Data Scientist', 'Analyze data to drive business insights', 'Chennai', 110000.00, 'Full-time', '2025-02-20'),
(4, 4, 'DevOps Engineer', 'Manage infrastructure and deployments', 'Mumbai', 95000.00, 'Part-time', '2025-02-25'),
(5, 5, 'UX Designer', 'Design user-friendly interfaces', 'Chicago', 85000.00, 'Full-time', '2025-03-10'),
(6, 6, 'Full-stack Developer', 'Develop both front-end and back-end of web applications', 'Austin', 105000.00, 'Contract', '2025-03-15'),
(7, 7, 'Cloud Architect', 'Design cloud infrastructure and services', 'Seattle', 130000.00, 'Full-time', '2025-03-18'),
(8, 8, 'Systems Engineer', 'Manage and optimize system performance', 'San Francisco', 100000.00, 'Part-time', '2025-03-12'),
(9, 9, 'AI Engineer', 'Develop and optimize AI algorithms', 'Austin', 115000.00, 'Full-time', '2025-03-20'),
(10, 10, 'Marketing Specialist', 'Plan and execute marketing campaigns', 'Boston', 75000.00, 'Full-time', '2025-03-22');
GO
-- Create Applicants Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'CareerhubSchema.Applicants' )
CREATE TABLE CareerhubSchema.Applicants (
        ApplicantID INT PRIMARY KEY, 
        FirstName NVARCHAR(100), 
        LastName NVARCHAR(100), 
        Email NVARCHAR(255), 
        Phone NVARCHAR(15), 
        Resume TEXT
    );
GO
INSERT INTO CareerhubSchema.Applicants (ApplicantID, FirstName, LastName, Email, Phone, Resume)
VALUES 
(1, 'Aaron', 'sam', 'aaronsam2508@gmail.com', '1234567890', 'Resume content for Aaron'),
(2, 'Sobana', 'RS', 'sobana3004@gmail.com', '1234567891', 'Resume content for Sobana'),
(3, 'Tomie', 'AS', 'tomie@gmail.com', '1234567892', 'Resume content for Tomie'),
(4, 'Mickey', 'Choki', 'mickeychoki@gmail.com', '1234567893', 'Resume content for Mickeychoki'),
(5, 'Choki', 'Mickey', 'chokimickey@gmail.com', '1234567894', 'Resume content for Chokimickey'),
(6, 'David', 'Miller', 'david@gmail.com', '1234567895', 'Resume content for David Miller'),
(7, 'Rohit', 'sharmna', 'rohit@gmail.com', '1234567896', 'Resume content for Rohit'),
(8, 'Hitman', 'sharma', 'hitman@gmail.com', '1234567897', 'Resume content for Hitman'),
(9, 'Grace', 'Taylor', 'gracet@gmail.com', '123456898', 'Resume content for Grace Taylor'),
(10, 'Hannah', 'Anderson', 'hannah@gmail.com', '1234567899', 'Resume content for Hannah Anderson');
GO
-- Create Applications Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'CareerhubSchema.Applications' )
CREATE TABLE CareerhubSchema.Applications (
        ApplicationID INT PRIMARY KEY, 
        JobID INT, 
        ApplicantID INT, 
        ApplicationDate DATETIME, 
        CoverLetter TEXT,
        CONSTRAINT FK_Application_Job FOREIGN KEY (JobID) REFERENCES CareerhubSchema.Jobs(JobID) ON DELETE CASCADE,
        CONSTRAINT FK_Application_Applicant FOREIGN KEY (ApplicantID) REFERENCES CareerhubSchema.Applicants(ApplicantID) ON DELETE CASCADE
    );
GO
INSERT INTO CareerhubSchema.Applications (ApplicationID, JobID, ApplicantID, ApplicationDate, CoverLetter)
VALUES 
(1, 1, 1, '2025-03-01', 'Cover letter for John Doe applying to Software Developer'),
(2, 2, 2, '2025-03-06', 'Cover letter for Jane Smith applying to Product Manager'),
(3, 3, 3, '2025-02-21', 'Cover letter for Alice Johnson applying to Data Scientist'),
(4, 4, 4, '2025-02-26', 'Cover letter for Bob Brown applying to DevOps Engineer'),
(5, 5, 5, '2025-03-11', 'Cover letter for Charlie Davis applying to UX Designer'),
(6, 6, 6, '2025-03-16', 'Cover letter for David Miller applying to Full-stack Developer'),
(7, 7, 7, '2025-03-19', 'Cover letter for Eve Wilson applying to Cloud Architect'),
(8, 8, 8, '2025-03-13', 'Cover letter for Frank Moore applying to Systems Engineer'),
(9, 9, 9, '2025-03-21', 'Cover letter for Grace Taylor applying to AI Engineer'),
(10, 10, 10, '2025-03-23', 'Cover letter for Hannah Anderson applying to Marketing Specialist');
GO
--5)Count the number of applications for each job listing
SELECT J.JobTitle, 
       COUNT(A.ApplicationID) AS ApplicationCount
FROM CareerhubSchema.Jobs J
LEFT JOIN CareerhubSchema.Applications A ON J.JobID = A.JobID
GROUP BY J.JobTitle;
GO
--6) Retrieve job listings within a specified salary range
DECLARE @MinSalary DECIMAL(10, 2) = 50000;
DECLARE @MaxSalary DECIMAL(10, 2) = 100000;
SELECT J.JobTitle, C.CompanyName, J.JobLocation, J.Salary
FROM CareerhubSchema.Jobs J
JOIN CareerhubSchema.Companies C ON J.CompanyID = C.CompanyID
WHERE J.Salary BETWEEN @MinSalary AND @MaxSalary;
--OR 
SELECT J.JobTitle, C.CompanyName, J.JobLocation, J.Salary
FROM CareerhubSchema.Jobs J,CareerhubSchema.Companies C WHERE J.CompanyID = C.CompanyID
 AND J.Salary BETWEEN @MinSalary AND @MaxSalary;
GO
--7 Job application history for a specific applicant
DECLARE @ApplicantID INT = 1;
SELECT J.JobTitle, C.CompanyName, A.ApplicationDate
FROM CareerhubSchema.Applications A,CareerhubSchema.Jobs J,CareerhubSchema.Companies C 
WHERE  A.JobID = J.JobID AND J.CompanyID = C.CompanyID AND A.ApplicantID = @ApplicantID;
GO
--8)Average salary offered by all companies
SELECT AVG(Salary) AS AverageSalary
FROM CareerhubSchema.Jobs WHERE Salary > 0;
GO
--9)Identify the company with the most job listings
SELECT TOP 1 C.CompanyName, COUNT(J.JobID) AS JobCount
FROM CareerhubSchema.Companies C,CareerhubSchema.Jobs J WHERE C.CompanyID = J.CompanyID
GROUP BY C.CompanyName
ORDER BY JobCount DESC;
--OR 
SELECT TOP 1 C.CompanyName, COUNT(J.JobID) AS JobCount
FROM CareerhubSchema.Companies C
JOIN CareerhubSchema.Jobs J ON C.CompanyID = J.CompanyID
GROUP BY C.CompanyName
ORDER BY JobCount DESC;
GO
--10)Applicants who applied to companies in 'CityX' and have 3+ years of experience
SELECT A.FirstName, A.LastName, C.CompanyName, J.JobTitle
FROM CareerhubSchema.Applicants A
JOIN CareerhubSchema.Applications App ON A.ApplicantID = App.ApplicantID
JOIN CareerhubSchema.Jobs J ON App.JobID = J.JobID
JOIN CareerhubSchema.Companies C ON J.CompanyID = C.CompanyID
WHERE C.Location = 'CityX' AND DATEDIFF(YEAR, App.ApplicationDate, GETDATE()) >= 3;
GO
--11) Distinct job titles with salaries between 60,000 and 80,000
SELECT DISTINCT JobTitle FROM CareerhubSchema.Jobs
WHERE Salary BETWEEN 60000 AND 80000;
GO
--12)Find jobs with no applications
SELECT J.JobTitle FROM CareerhubSchema.Jobs J
LEFT JOIN CareerhubSchema.Applications A ON J.JobID = A.JobID
WHERE A.ApplicationID IS NULL;
GO
--13) List of job applicants with the companies and positions they applied to
SELECT A.FirstName, A.LastName, C.CompanyName, J.JobTitle
FROM CareerhubSchema.Applicants A
JOIN CareerhubSchema.Applications App ON A.ApplicantID = App.ApplicantID
JOIN CareerhubSchema.Jobs J ON App.JobID = J.JobID
JOIN CareerhubSchema.Companies C ON J.CompanyID = C.CompanyID;
--OR
SELECT A.FirstName, A.LastName, C.CompanyName, J.JobTitle
FROM CareerhubSchema.Applicants A,CareerhubSchema.Applications App,CareerhubSchema.Jobs J,CareerhubSchema.Companies C
WHERE A.ApplicantID = App.ApplicantID AND App.JobID = J.JobID AND J.CompanyID = C.CompanyID;
GO
--14)List of companies with the count of jobs they have posted
SELECT C.CompanyName, COUNT(J.JobID) AS JobCount
FROM CareerhubSchema.Companies C
LEFT JOIN CareerhubSchema.Jobs J ON C.CompanyID = J.CompanyID
GROUP BY C.CompanyName;
GO
--15)List all applicants and the companies/positions they applied for including those who have not applied
SELECT A.FirstName, A.LastName, C.CompanyName AS CompanyName, J.JobTitle AS JobTitle
FROM CareerhubSchema.Applicants A
LEFT JOIN CareerhubSchema.Applications App ON A.ApplicantID = App.ApplicantID
LEFT JOIN CareerhubSchema.Jobs J ON App.JobID = J.JobID
LEFT JOIN CareerhubSchema.Companies C ON J.CompanyID = C.CompanyID;
GO
--16)Find companies with jobs offering salary higher than the average salary of all jobs
SELECT C.CompanyName
FROM CareerhubSchema.Companies C
JOIN CareerhubSchema.Jobs J ON C.CompanyID = J.CompanyID
WHERE J.Salary > (SELECT AVG(Salary) FROM CareerhubSchema.Jobs WHERE Salary > 0);
--OR
SELECT C.CompanyName
FROM CareerhubSchema.Companies C,CareerhubSchema.Jobs J 
WHERE C.CompanyID = J.CompanyID
AND J.Salary > (SELECT AVG(Salary) FROM CareerhubSchema.Jobs WHERE Salary > 0);
GO
--17)Display applicants with names and concatenated city and state
--AS THERE IS NO ATTRIBUTE AND CITY AND STATE I HAVE USED LOCATION ATTRIBUTE FORM COMPANIES TABLE
SELECT A.FirstName + ' ' + A.LastName AS ApplicantName, 
       C.Location AS Location
FROM CareerhubSchema.Applicants A,CareerhubSchema.Companies C
WHERE A.ApplicantID=C.CompanyID;
GO
--18) Retrieve jobs with titles containing Developer or Engineer
SELECT JobTitle FROM CareerhubSchema.Jobs
WHERE JobTitle LIKE '%Developer%' OR JobTitle LIKE '%Engineer%';
GO
--19)List applicants and jobs they applied for, including those without applications
SELECT A.FirstName, A.LastName, J.JobTitle AS JobTitle
FROM CareerhubSchema.Applicants A
LEFT JOIN CareerhubSchema.Applications App ON A.ApplicantID = App.ApplicantID
LEFT JOIN CareerhubSchema.Jobs J ON App.JobID = J.JobID;
GO
--20) List all combinations of applicants and companies based on a specific city and experience of more than 2 years
SELECT A.FirstName, A.LastName, C.CompanyName
FROM CareerhubSchema.Applicants A
JOIN CareerhubSchema.Applications App ON A.ApplicantID = App.ApplicantID
JOIN CareerhubSchema.Jobs J ON App.JobID = J.JobID
JOIN CareerhubSchema.Companies C ON J.CompanyID = C.CompanyID
WHERE C.Location = 'Chennai' AND DATEDIFF(YEAR, App.ApplicationDate, GETDATE()) > 2 ;
GO


















