from util.DBConnUtil import DBConnUtil
from entity.Car import Car
from entity.Customer import Customer
from entity.Lease import Lease
from entity.Payment import Payment
from exception.CarNotFoundException import CarNotFoundException
from exception.CustomerNotFoundException import CustomerNotFoundException
from exception.LeaseNotFoundException import LeaseNotFoundException
from datetime import datetime

class CarLeaseRepositoryImpl:
    def __init__(self):
        self.conn = DBConnUtil.getConnection()

    def addCar(self, car):
        cursor = self.conn.cursor()
        cursor.execute(
            "INSERT INTO Carrental.Vehicles VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
            (car.vehicleID, car.make, car.model, car.year, car.dailyRate,
             car.status, car.passengerCapacity, car.engineCapacity)
        )
        self.conn.commit()

    def removeCar(self, carID):
        cursor = self.conn.cursor()
        cursor.execute("DELETE FROM Carrental.Vehicles WHERE vehicleID = ?", (carID,))
        if cursor.rowcount == 0:
            raise CarNotFoundException()
        self.conn.commit()

    def findCarById(self, carID):
        cursor = self.conn.cursor()
        cursor.execute("SELECT * FROM Carrental.Vehicles WHERE vehicleID = ?", (carID,))
        row = cursor.fetchone()
        if not row:
            raise CarNotFoundException()
        return Car(*row)

    def listAvailableCars(self):
        cursor = self.conn.cursor()
        cursor.execute("SELECT * FROM Carrental.Vehicles WHERE status = 'available'")
        rows = cursor.fetchall()
        return [Car(*row) for row in rows]

    def listRentedCars(self):
        cursor = self.conn.cursor()
        cursor.execute("SELECT * FROM Carrental.Vehicles WHERE status = 'notAvailable'")
        rows = cursor.fetchall()
        return [Car(*row) for row in rows]

    def addCustomer(self, customer):
        cursor = self.conn.cursor()
        cursor.execute(
            "INSERT INTO Carrental.Customers VALUES (?, ?, ?, ?, ?)",
            (customer.customerID, customer.firstName, customer.lastName,
             customer.email, customer.phoneNumber)
        )
        self.conn.commit()

    def removeCustomer(self, customerID):
        cursor = self.conn.cursor()
        cursor.execute("DELETE FROM Carrental.Customers WHERE customerID = ?", (customerID,))
        if cursor.rowcount == 0:
            raise CustomerNotFoundException()
        self.conn.commit()

    def findCustomerById(self, customerID):
        cursor = self.conn.cursor()
        cursor.execute("SELECT * FROM Carrental.Customers WHERE customerID = ?", (customerID,))
        row = cursor.fetchone()
        if not row:
            raise CustomerNotFoundException()
        return Customer(*row)

    def listCustomers(self):
        cursor = self.conn.cursor()
        cursor.execute("SELECT * FROM Carrental.Customers")
        rows = cursor.fetchall()
        return [Customer(*row) for row in rows]

    def createLease(self, customerID, carID, startDate, endDate, leaseType):
        cursor = self.conn.cursor()
        cursor.execute("SELECT 1 FROM Carrental.Customers WHERE customerID = ?", (customerID,))
        if not cursor.fetchone():
            raise CustomerNotFoundException()

        cursor.execute("SELECT 1 FROM Carrental.Vehicles WHERE vehicleID = ?", (carID,))
        if not cursor.fetchone():
            raise CarNotFoundException()

        cursor.execute(
            "INSERT INTO Carrental.Lease(vehicleID, customerID, startDate, endDate, type) OUTPUT INSERTED.leaseID VALUES (?, ?, ?, ?, ?)",
            (carID, customerID, startDate, endDate, leaseType)
        )
        leaseID = cursor.fetchone()[0]

        cursor.execute("UPDATE Carrental.Vehicles SET status='notAvailable' WHERE vehicleID=?", (carID,))
        self.conn.commit()
        return Lease(leaseID, carID, customerID, startDate, endDate, leaseType)

    def returnCar(self, leaseID):
        cursor = self.conn.cursor()
        cursor.execute("SELECT vehicleID FROM Carrental.Lease WHERE leaseID = ?", (leaseID,))
        result = cursor.fetchone()
        if not result:
            raise LeaseNotFoundException()
        vehicleID = result[0]

        cursor.execute("UPDATE Carrental.Vehicles SET status='available' WHERE vehicleID = ?", (vehicleID,))
        self.conn.commit()

    def listActiveLeases(self):
        cursor = self.conn.cursor()
        today = datetime.now().date()
        cursor.execute("SELECT * FROM Carrental.Lease WHERE endDate >= ?", (today,))
        rows = cursor.fetchall()
        return [Lease(*row) for row in rows]

    def listLeaseHistory(self):
        cursor = self.conn.cursor()
        cursor.execute("SELECT * FROM Carrental.Lease")
        rows = cursor.fetchall()
        return [Lease(*row) for row in rows]

    def recordPayment(self, leaseID, amount):
        cursor = self.conn.cursor()
        cursor.execute("SELECT 1 FROM Carrental.Lease WHERE leaseID = ?", (leaseID,))
        if not cursor.fetchone():
            raise LeaseNotFoundException()

        cursor.execute(
            "INSERT INTO Carrental.Payment(leaseID, paymentDate, amount) VALUES (?, ?, ?)",
            (leaseID, datetime.now().date(), amount)
        )
        self.conn.commit()

    def getPaymentHistoryByCustomer(self, customerID):
        cursor = self.conn.cursor()
        cursor.execute("""
            SELECT p.* FROM Carrental.Payment p
            JOIN Carrental.Lease l ON p.leaseID = l.leaseID
            WHERE l.customerID = ?
        """, (customerID,))
        rows = cursor.fetchall()
        return [Payment(*row) for row in rows]

    def getTotalRevenue(self):
        cursor = self.conn.cursor()
        cursor.execute("SELECT SUM(amount) FROM Carrental.Payment")
        result = cursor.fetchone()
        return result[0] if result[0] else 0.0
