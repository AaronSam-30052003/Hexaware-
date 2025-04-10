from util.db_property_util import get_connection_string
from util.db_conn_util import get_connection

class DBConnector:
    def __init__(self, server, db):
        self.connection_string = get_connection_string(server, db)
        self.connection = get_connection(self.connection_string)

    def get_conn(self):
        return self.connection
