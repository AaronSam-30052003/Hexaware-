class ProductDAO:
    def __init__(self, conn):
        self.conn = conn

    def insert_product(self, product):
        cursor = self.conn.cursor()
        query = """
            INSERT INTO TechShopSchema.Products (ProductName, Description, Price)
            VALUES (?, ?, ?)
        """
        cursor.execute(query, (product.name, product.description, product.price))
        self.conn.commit()

    def get_product_by_id(self, product_id):
        cursor = self.conn.cursor()
        query = """
            SELECT ProductID, ProductName, Description, Price
            FROM TechShopSchema.Products
            WHERE ProductID = ?
        """
        cursor.execute(query, (product_id,))
        row = cursor.fetchone()
        if row:
            return {
                "ProductID": row[0],
                "ProductName": row[1],
                "Description": row[2],
                "Price": row[3]
            }
        return None

    def update_product_info(self, product_id, name, description, price):
        cursor = self.conn.cursor()
        query = """
            UPDATE TechShopSchema.Products
            SET ProductName = ?, Description = ?, Price = ?
            WHERE ProductID = ?
        """
        cursor.execute(query, (name, description, price, product_id))
        self.conn.commit()
