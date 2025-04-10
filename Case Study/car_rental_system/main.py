from dao.CarLeaseRepositoryImpl import CarLeaseRepositoryImpl
from entity.Car import Car
from entity.Customer import Customer
from entity.Payment import Payment
from entity.Lease import Lease

repo = CarLeaseRepositoryImpl()

def main_menu():
    while True:
        print("\n==== Car Rental System ====")
        print("1. Add Car")
        print("2. Remove Car")
        print("3. Find Car by ID")
        print("4. List Available Cars")
        print("5. List Rented Cars")
        print("6. Add Customer")
        print("7. Remove Customer")
        print("8. View All Customers")
        print("9. Create Lease")
        print("10. Return Car")
        print("11. View Active Leases")
        print("12. View Lease History")
        print("13. Record Payment")
        print("14. View Customer Payment History")
        print("15. View Total Revenue")
        print("0. Exit")

        choice = input("Enter your choice: ")

        try:
            if choice == "1":
                car = Car(
                    int(input("Vehicle ID: ")),
                    input("Make: "),
                    input("Model: "),
                    int(input("Year: ")),
                    float(input("Daily Rate: ")),
                    input("Status (available/notAvailable): "),
                    int(input("Passenger Capacity: ")),
                    float(input("Engine Capacity: "))
                )
                repo.addCar(car)
                print("Car added successfully.")

            elif choice == "2":
                repo.removeCar(int(input("Enter Car ID to remove: ")))
                print("Car removed successfully.")

            elif choice == "3":
                car = repo.findCarById(int(input("Enter Car ID: ")))
                print(vars(car))

            elif choice == "4":
                cars = repo.listAvailableCars()
                if cars:
                    for car in cars:
                        print(vars(car))
                else:
                    print("No cars available.")

            elif choice == "5":
                cars = repo.listRentedCars()
                if cars:
                    for car in cars:
                        print(vars(car))
                else:
                    print("No rented cars found.")

            elif choice == "6":
                customer = Customer(
                    int(input("Customer ID: ")),
                    input("First Name: "),
                    input("Last Name: "),
                    input("Email: "),
                    input("Phone Number: ")
                )
                repo.addCustomer(customer)
                print("Customer added successfully.")

            elif choice == "7":
                repo.removeCustomer(int(input("Enter Customer ID to remove: ")))
                print("Customer removed successfully.")

            elif choice == "8":
                customers = repo.listCustomers()
                if customers:
                    for cust in customers:
                        print(vars(cust))
                else:
                    print("No customers found.")

            elif choice == "9":
                lease = repo.createLease(
                    int(input("Customer ID: ")),
                    int(input("Vehicle ID: ")),
                    input("Start Date (YYYY-MM-DD): "),
                    input("End Date (YYYY-MM-DD): "),
                    input("Lease Type (Daily/Monthly): ")
                )
                print(f"Lease created: {vars(lease)}")

            elif choice == "10":
                repo.returnCar(int(input("Enter Lease ID to return car: ")))
                print("Car returned and status updated.")

            elif choice == "11":
                leases = repo.listActiveLeases()
                if leases:
                    for lease in leases:
                        print(vars(lease))
                else:
                    print("No active leases found.")

            elif choice == "12":
                leases = repo.listLeaseHistory()
                if leases:
                    for lease in leases:
                        print(vars(lease))
                else:
                    print("No lease history available.")

            elif choice == "13":
                repo.recordPayment(
                    int(input("Lease ID: ")),
                    float(input("Amount: "))
                )
                print("Payment recorded.")

            elif choice == "14":
                payments = repo.getPaymentHistoryByCustomer(int(input("Enter Customer ID: ")))
                if payments:
                    for p in payments:
                        print(vars(p))
                else:
                    print("No payment records found for this customer.")

            elif choice == "15":
                revenue = repo.getTotalRevenue()
                print(f"Total Revenue: ₹{revenue:.2f}")

            elif choice == "0":
                print("Goodbye!")
                break

            else:
                print("Invalid option. Try again.")

        except Exception as e:
            print("Error:", e)

if __name__ == "__main__":
    main_menu()
