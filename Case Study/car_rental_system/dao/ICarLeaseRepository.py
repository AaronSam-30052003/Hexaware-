from abc import ABC, abstractmethod

class ICarLeaseRepository(ABC):
    @abstractmethod
    def addCar(self, car): pass

    @abstractmethod
    def findCarById(self, carID): pass

    @abstractmethod
    def addCustomer(self, customer): pass

    @abstractmethod
    def findCustomerById(self, customerID): pass

    @abstractmethod
    def createLease(self, customerID, carID, startDate, endDate, leaseType): pass

    @abstractmethod
    def recordPayment(self, leaseID, amount): pass
