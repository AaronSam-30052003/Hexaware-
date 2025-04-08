import pyodbc
from techshop.config import DATABASE_CONFIG

def get_connection():
    conn_str = (
        f"DRIVER={{{DATABASE_CONFIG['driver']}}};"
        f"SERVER={DATABASE_CONFIG['server']};"
        f"DATABASE={DATABASE_CONFIG['database']};"
        f"Trusted_Connection={DATABASE_CONFIG['trusted_connection']};"
    )
    return pyodbc.connect(conn_str)
