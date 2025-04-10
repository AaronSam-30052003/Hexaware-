import pyodbc

def get_connection(conn_str):
    try:
        conn = pyodbc.connect(conn_str)
        return conn
    except pyodbc.Error as e:
        print("Database connection failed:", e)
        return None
