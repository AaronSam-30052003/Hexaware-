class CustomerDAO:
    def __init__(self, conn):
        self.conn = conn

    def insert_customer(self, customer):
        cursor = self.conn.cursor()
        query = """
            INSERT INTO TechShopSchema.Customers (FirstName, LastName, Email, Phone, Address)
            VALUES (?, ?, ?, ?, ?)
        """
        cursor.execute(query, (customer.first_name, customer.last_name,
                               customer.email, customer.phone, customer.address))
        self.conn.commit()

    def get_customer_by_id(self, customer_id):
        cursor = self.conn.cursor()
        query = """
            SELECT CustomerID, FirstName, LastName, Email, Phone, Address
            FROM TechShopSchema.Customers
            WHERE CustomerID = ?
        """
        cursor.execute(query, (customer_id,))
        row = cursor.fetchone()
        if row:
            return {
                "CustomerID": row[0],
                "FirstName": row[1],
                "LastName": row[2],
                "Email": row[3],
                "Phone": row[4],
                "Address": row[5]
            }
        return None

    def update_customer_info(self, customer_id, email, phone, address):
        cursor = self.conn.cursor()
        query = """
            UPDATE TechShopSchema.Customers
            SET Email = ?, Phone = ?, Address = ?
            WHERE CustomerID = ?
        """
        cursor.execute(query, (email, phone, address, customer_id))
        self.conn.commit()
