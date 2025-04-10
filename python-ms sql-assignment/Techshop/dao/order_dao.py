class OrderDAO:
    def __init__(self, conn):
        self.conn = conn

    def insert_order(self, order):
        cursor = self.conn.cursor()
        query = """
            INSERT INTO TechShopSchema.Orders (CustomerID, OrderDate, TotalAmount)
            VALUES (?, ?, ?)
        """
        cursor.execute(query, (order.customer.customer_id, order.order_date, order.total_amount))
        self.conn.commit()
