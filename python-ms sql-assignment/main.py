import pyodbc
from techshop.create_tables import create_schema_and_tables
from techshop.insert_data import insert_data, insert_products, insert_orders, insert_order_details, insert_inventory
from techshop.db_connect import get_connection

if __name__ == "__main__":
    conn = get_connection()
    cursor = conn.cursor()
    create_schema_and_tables()
    insert_data(cursor)
    insert_products(cursor)
    insert_orders(cursor)
    insert_order_details(cursor)
    insert_inventory(cursor)
    conn.commit()
    print("Data inserted successfully.")
    cursor.close()
    conn.close()
