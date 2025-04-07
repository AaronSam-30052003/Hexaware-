def insert_row(conn):
    cursor = conn.cursor()
    first_name = input("Enter first name: ")
    last_name = input("Enter last name: ")
    email = input("Enter email: ")
    hire_date = input("Enter hire date (YYYY-MM-DD): ")
    query = """
    INSERT INTO emps (first_name, last_name, email, hire_date)
    VALUES (?, ?, ?, ?)
    """
    cursor.execute(query, (first_name, last_name, email, hire_date))
    conn.commit()
    print("Employee added successfully.")
def update_row(conn):
    cursor = conn.cursor()
    employee_id = input("Enter the employee ID you want to update: ")
    first_name = input("Enter new first name: ")
    last_name = input("Enter new last name: ")
    email = input("Enter new email: ")
    hire_date = input("Enter new hire date (YYYY-MM-DD): ")
    query = """
    UPDATE emps
    SET first_name = ?, last_name = ?, email = ?, hire_date = ?
    WHERE id = ?
    """
    cursor.execute(query, (first_name, last_name, email, hire_date, employee_id))
    conn.commit()
    print("Employee updated successfully.")
def delete_row(conn):
    cursor = conn.cursor()
    employee_id = input("Enter the employee ID you want to delete: ")
    query = "DELETE FROM emps WHERE id = ?"
    cursor.execute(query, (employee_id,))
    conn.commit()
    print("Employee deleted successfully.")
def select_rows(conn):
    cursor = conn.cursor()
    query = "SELECT * FROM emps"
    cursor.execute(query)
    rows = cursor.fetchall()
    print("Employees in the database:")
    for row in rows:
        print(f"ID: {row.id}, Name: {row.first_name} {row.last_name}, Email: {row.email}, Hire Date: {row.hire_date}")
def insert_rows_repeatedly(conn):
    while True:
        insert_row(conn)
        another = input("Do you want to insert one more employee? (y/n): ")
        if another.lower() == 'n':
            break
