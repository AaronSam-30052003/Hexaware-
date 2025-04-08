from techshop.db_connect import get_connection
def create_schema_and_tables():
    with get_connection() as conn:
        cursor = conn.cursor()
        drop_tables_sql = """
            DROP TABLE IF EXISTS TechShopSchema.OrderDetails;
            DROP TABLE IF EXISTS TechShopSchema.Orders;
            DROP TABLE IF EXISTS TechShopSchema.Inventory;
            DROP TABLE IF EXISTS TechShopSchema.Products;
            DROP TABLE IF EXISTS TechShopSchema.Customers;
        """
        cursor.execute(drop_tables_sql)

        cursor.execute("""
        IF NOT EXISTS (
            SELECT * FROM sys.schemas WHERE name = 'TechShopSchema'
        )
        BEGIN
            EXEC('CREATE SCHEMA TechShopSchema');
        END
        """)

        cursor.execute("""
        CREATE TABLE TechShopSchema.Customers (
            CustomerID INT PRIMARY KEY IDENTITY(1,1),
            FirstName VARCHAR(50),
            LastName VARCHAR(50),
            Email VARCHAR(100) UNIQUE,
            Phone VARCHAR(20),
            Address VARCHAR(255)
        );
        """)

        cursor.execute("""
        CREATE TABLE TechShopSchema.Products (
            ProductID INT PRIMARY KEY IDENTITY(1,1),
            ProductName VARCHAR(100),
            Description VARCHAR(255),
            Price DECIMAL(10, 2)
        );
        """)

        cursor.execute("""
        CREATE TABLE TechShopSchema.Orders (
            OrderID INT PRIMARY KEY IDENTITY(1,1),
            CustomerID INT,
            OrderDate DATETIME,
            TotalAmount DECIMAL(10, 2),
            FOREIGN KEY (CustomerID) REFERENCES TechShopSchema.Customers(CustomerID) ON DELETE CASCADE
        );
        """)

        cursor.execute("""
        CREATE TABLE TechShopSchema.OrderDetails (
            OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
            OrderID INT,
            ProductID INT,
            Quantity INT,
            FOREIGN KEY (OrderID) REFERENCES TechShopSchema.Orders(OrderID) ON DELETE CASCADE,
            FOREIGN KEY (ProductID) REFERENCES TechShopSchema.Products(ProductID) ON DELETE CASCADE
        );
        """)

        cursor.execute("""
        CREATE TABLE TechShopSchema.Inventory (
            InventoryID INT PRIMARY KEY IDENTITY(1,1),
            ProductID INT,
            QuantityInStock INT,
            LastStockUpdate DATETIME,
            FOREIGN KEY (ProductID) REFERENCES TechShopSchema.Products(ProductID) ON DELETE CASCADE
        );
        """)

        conn.commit()
        print("Schema and tables created successfully.")
