USE CODINGCHALLENGE;
GO
-- Create Schema
CREATE SCHEMA hospitalschema;
GO
-- Patient Table
CREATE TABLE hospitalschema.Patient (
    patientId INT IDENTITY(1,1) PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    dateOfBirth DATE,
    gender VARCHAR(50),
    contactNumber VARCHAR(15),
    address VARCHAR(255)
);
GO
-- Doctor Table
CREATE TABLE hospitalschema.Doctor (
    doctorId INT IDENTITY(1,1) PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    specialization VARCHAR(100),
    contactNumber VARCHAR(15)
);
GO
-- Appointment Table
CREATE TABLE hospitalschema.Appointment (
    appointmentId INT IDENTITY(1,1) PRIMARY KEY,
    patientId INT FOREIGN KEY REFERENCES hospitalschema.Patient(patientId),
    doctorId INT FOREIGN KEY REFERENCES hospitalschema.Doctor(doctorId),
    appointmentDate DATE,
    description VARCHAR(255)
);
GO
--insert values into patient table
INSERT INTO hospitalschema.Patient (firstName, lastName, dateOfBirth, gender, contactNumber, address) VALUES
('Aaron', 'Sam', '2004-05-30', 'Male', '9876543210', 'Ambedkar Nagar'),
('Sobana', 'RS', '2003-11-04', 'Female', '9123456780', 'KMR School'),
('Choki', 'Mickey', '2001-12-05', 'Female', '9001234567', 'KK Nagar'),
('Mickey', 'Choki', '2005-11-11', 'Male', '9898989898', 'Anna Nagar'),
('Tomie', 'Samie', '2004-03-30', 'Female', '9888123456', 'Madurai');
GO
INSERT INTO hospitalschema.Doctor (firstName, lastName, specialization, contactNumber) VALUES
('Dr. SAM', 'AS', 'Cardiologist', '9979873982'),
('Dr. TOMIE', 'AS', 'Neurologist', '9981297212'),
('Dr. ROHIT', 'SHARMA', 'Orthopedic', '7215878126'),
('Dr. HITMAN', 'Sharma', 'Dermatologist', '9721868721'),
('Dr. CHOKI', 'MICKEY', 'Pediatrician', '9675756861');
GO
INSERT INTO hospitalschema.Appointment (patientId, doctorId, appointmentDate, description) VALUES
(1, 1, '2025-04-10', 'Routine heart check-up'),
(2, 2, '2025-04-11', 'Migraine consultation'),
(3, 3, '2025-04-12', 'Knee pain evaluation'),
(4, 4, '2025-04-13', 'Skin rash examination'),
(5, 5, '2025-04-14', 'Child vaccination');
GO


select* from hospitalschema.Appointment;











