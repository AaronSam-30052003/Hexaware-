--CASE STUDY -TRANSPORT MANAGEMENT
USE CASESTUDY;
GO
--CREATE VEHICLE TABLE
CREATE TABLE Veh (
    VehicleID INT PRIMARY KEY IDENTITY(1,1),
    Model VARCHAR(255),
    Capacity DECIMAL(10, 2),
    Type VARCHAR(50),
    Status VARCHAR(50)
);
GO
--CREATE ROUTES TABLE
CREATE TABLE Routes (
    RouteID INT PRIMARY KEY IDENTITY(1,1),
    StartDestination VARCHAR(255),
    EndDestination VARCHAR(255),
    Distance DECIMAL(10, 2)
);
--CREATE TABLE TRIPS
CREATE TABLE Trips (
    TripID INT PRIMARY KEY IDENTITY(1,1),
    VehicleID INT,
    RouteID INT,
    DepartureDate DATETIME,
    ArrivalDate DATETIME,
    Status VARCHAR(50),
    TripType VARCHAR(50) DEFAULT 'Freight',
    MaxPassengers INT,
    FOREIGN KEY (VehicleID) REFERENCES Veh(VehicleID),
    FOREIGN KEY (RouteID) REFERENCES Routes(RouteID)
);
--CREATE TABLE PASSENGERS
CREATE TABLE Passengers (
    PassengerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(255),
    Gender VARCHAR(255),
    Age INT,
    Email VARCHAR(255) UNIQUE,
    PhoneNumber VARCHAR(50)
);

CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY IDENTITY(1,1),
    TripID INT,
    PassengerID INT,
    BookingDate DATETIME,
    Status VARCHAR(50),
    FOREIGN KEY (TripID) REFERENCES Trips(TripID),
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID)
);
