from curd_package.database import *
from curd_package.crud import *
def crud_operations():
    conn = connect_to_db()
    while True:
        print("\nChoose an option:")
        print("1. Add a row")
        print("2. Update a row")
        print("3. Delete a row")
        print("4. Select rows")
        print("5. Insert multiple rows")
        print("6. Exit")

        choice = input("Enter your choice: ")

        if choice == '1':
            insert_row(conn)
        elif choice == '2':
            update_row(conn)
        elif choice == '3':
            delete_row(conn)
        elif choice == '4':
            select_rows(conn)
        elif choice == '5':
            insert_rows_repeatedly(conn)
        elif choice == '6':
            print("Exiting...")
            break
        else:
            print("Invalid choice. Please try again.")

    conn.close()

if __name__ == "__main__":
    crud_operations()
