from entity.customer import Customer
from entity.product import Product
from entity.order import Order
from dao.db_connector import DBConnector
from dao.customer_dao import CustomerDAO
from dao.product_dao import ProductDAO
from dao.order_dao import OrderDAO
from datetime import datetime

def main():
    connector = DBConnector("DESKTOP-4I9OMIH", "TechShop")
    conn = connector.get_conn()

    customer_dao = CustomerDAO(conn)
    product_dao = ProductDAO(conn)
    order_dao = OrderDAO(conn)

    while True:
        print("\n--- TechShop Main Menu ---")
        print("1. Register Customer")
        print("2. View Customer Details")
        print("3. Add Product")
        print("4. View Product Details")
        print("5. Create Order")
        print("6. Update Customer Info")
        print("7. Update Product Info")
        print("8. Cancel Order")
        print("9. Exit")

        choice = input("Enter choice: ")

        if choice == "1":
            cid = int(input("Enter Customer ID: "))
            fname = input("First Name: ")
            lname = input("Last Name: ")
            email = input("Email: ")
            phone = input("Phone: ")
            addr = input("Address: ")
            customer = Customer(cid, fname, lname, email, phone, addr)
            customer_dao.insert_customer(customer)
            print("Customer registered.")
        elif choice == "2":
            cid = int(input("Enter Customer ID: "))
            customer = customer_dao.get_customer_by_id(cid)
            if customer:
                print("\nCustomer Details:")
                print(f"Customer ID : {customer['CustomerID']}")
                print(f"Name        : {customer['FirstName']} {customer['LastName']}")
                print(f"Email       : {customer['Email']}")
                print(f"Phone       : {customer['Phone']}")
                print(f"Address     : {customer['Address']}")
            else:
                print("Customer not found.")
        elif choice == "3":
            pid = int(input("Enter Product ID: "))
            name = input("Product Name: ")
            desc = input("Description: ")
            price = float(input("Price: "))
            product = Product(pid, name, desc, price)
            product_dao.insert_product(product)
            print(" Product added.")


        elif choice == "4":
            pid = int(input("Enter Product ID: "))
            product = product_dao.get_product_by_id(pid)
            if product:
                print("\nProduct Details:")
                print(f"Product ID   : {product['ProductID']}")
                print(f"Name         : {product['ProductName']}")
                print(f"Description  : {product['Description']}")
                print(f"Price        : ₹{product['Price']:.2f}")
            else:
                print("Product not found.")
        elif choice == "5":
            oid = int(input("Enter Order ID: "))
            cid = int(input("Enter Customer ID: "))
            fname = input("Customer First Name: ")
            lname = input("Customer Last Name: ")
            email = input("Email: ")
            phone = input("Phone: ")
            addr = input("Address: ")
            c = Customer(cid, fname, lname, email, phone, addr)
            order = Order(oid, c, datetime.now())
            order.total_amount = float(input("Enter Total Amount: "))
            order_dao.insert_order(order)
            print(" Order created.")



        elif choice == "6":
            cid = int(input("Enter Customer ID: "))
            email = input("New Email: ")
            phone = input("New Phone: ")
            addr = input("New Address: ")
            customer_dao.update_customer_info(cid, email, phone, addr)
            print(f"Customer ID {cid} updated successfully.")
        elif choice == "7":
                pid = int(input("Enter Product ID: "))
                name = input("New Product Name: ").strip()
                desc = input("New Description: ").strip()
                price_input = input("New Price: ").strip()
                if not price_input:
                    print("Price cannot be empty.")
                else:
                    price = float(price_input)
                    product_dao.update_product_info(pid, name, desc, price)
                    print(f"Product ID {pid} updated successfully.")

        elif choice == "8":
            oid = int(input("Enter Order ID to cancel: "))
            print(f"Order {oid} marked as Cancelled .")

        elif choice == "9":
            print(" Exiting TechShop App.")
            break

        else:
            print(" Invalid choice. Please try again.")

if __name__ == "__main__":
    main()
