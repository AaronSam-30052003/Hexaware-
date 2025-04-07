import pyodbc

def connect_to_db():
    conn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};'
                          'SERVER=DESKTOP-4I9OMIH;'  
                          'DATABASE=Practice;'  
                          'Trusted_Connection=yes;')  
    return conn
