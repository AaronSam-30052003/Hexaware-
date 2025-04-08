def insert_data(cursor):
    customers = [
        ('Aaron', 'Sam', 'aaronsam3004@gmail.com', '880740200', 'Madurai'),
        ('Sobana', 'RS', 'sobana@gmail.com', '9988444220', 'Madurai'),
        ('Samie', 'AS', 'samie@gmail.com', '1234567789', 'Chennai'),
        ('Tomie', 'AS', 'tomie@gmail.com', '3627797988', 'Chennai'),
        ('Choki', 'Mickey', 'chokimickey@gmail.com', '9729867282', 'Mumbai'),
        ('Mickey', 'Choki', 'mickeychoki@gmail.com', '8923879722', 'Bangalore'),
        ('Moon', 'RS', 'moon@gmail.com', '5816528681', 'Kerala'),
        ('Cute', 'Tomie', 'cute@gmail.com', '8168365811', 'Madurai'),
        ('Love', 'Moon', 'love@gmail.com', '9173974971', 'Hyderabad'),
        ('Rohit', 'Hitman', 'rohit@gmail.com', '8136846133', 'Theni'),
    ]
    for row in customers:
        cursor.execute("INSERT INTO TechShopSchema.Customers (FirstName, LastName, Email, Phone, Address) VALUES (?, ?, ?, ?, ?)", row)


def insert_products(cursor):
    products = [
        ('Smartphone', 'Latest model smartphone with all the features', 699.99),
        ('Laptop', 'Powerful laptop with 16GB RAM', 999.99),
        ('Headphones', 'Noise-cancelling wireless headphones', 199.99),
        ('Smartwatch', 'Smartwatch with fitness tracking features', 249.99),
        ('Tablet', 'Portable tablet for work and play', 399.99),
        ('Camera', 'DSLR camera with high-resolution sensor', 899.99),
        ('Speaker', 'Bluetooth portable speaker', 129.99),
        ('Keyboard', 'Wireless mechanical keyboard', 89.99),
        ('Monitor', 'Curved 4K monitor', 599.99),
        ('Charger', 'Fast charging cable and adapter', 29.99),
    ]
    for row in products:
        cursor.execute("INSERT INTO TechShopSchema.Products (ProductName, Description, Price) VALUES (?, ?, ?)", row)


def insert_orders(cursor):
    orders = [
        (1, '2025-03-20', 1299.99),
        (2, '2025-03-21', 399.99),
        (3, '2025-03-22', 599.99),
        (4, '2025-03-23', 899.99),
        (5, '2025-03-24', 699.99),
        (6, '2025-03-25', 129.99),
        (7, '2025-03-26', 1599.99),
        (8, '2025-03-27', 699.99),
        (9, '2025-03-28', 799.99),
        (10, '2025-03-29', 449.99),
    ]
    for row in orders:
        cursor.execute("INSERT INTO TechShopSchema.Orders (CustomerID, OrderDate, TotalAmount) VALUES (?, ?, ?)", row)


def insert_order_details(cursor):
    order_details = [
        (1, 1, 1),
        (1, 3, 2),
        (2, 2, 1),
        (3, 4, 1),
        (4, 6, 2),
        (5, 5, 1),
        (6, 7, 1),
        (7, 8, 1),
        (8, 9, 1),
        (9, 10, 2),
    ]
    for row in order_details:
        cursor.execute("INSERT INTO TechShopSchema.OrderDetails (OrderID, ProductID, Quantity) VALUES (?, ?, ?)", row)


def insert_inventory(cursor):
    inventory = [
        (1, 50, '2025-03-20'),
        (2, 30, '2025-03-21'),
        (3, 60, '2025-03-22'),
        (4, 40, '2025-03-23'),
        (5, 20, '2025-03-24'),
        (6, 10, '2025-03-25'),
        (7, 100, '2025-03-26'),
        (8, 80, '2025-03-27'),
        (9, 25, '2025-03-28'),
        (10, 150, '2025-03-29'),
    ]
    for row in inventory:
        cursor.execute("INSERT INTO TechShopSchema.Inventory (ProductID, QuantityInStock, LastStockUpdate) VALUES (?, ?, ?)", row)
