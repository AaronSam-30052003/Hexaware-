import pyodbc
from util.DBPropertyUtil import DBPropertyUtil

class DBConnUtil:
    @staticmethod
    def getConnection():
        conn_str = DBPropertyUtil.getPropertyString()
        return pyodbc.connect(conn_str)
