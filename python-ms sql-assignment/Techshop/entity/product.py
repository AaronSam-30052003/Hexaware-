class Product:
    def __init__(self, product_id, name, description, price):
        self.__product_id = product_id
        self.name = name
        self.description = description
        self.price = max(price, 0.0)

    @property
    def product_id(self):
        return self.__product_id

    def get_product_details(self):
        return f"Product ID: {self.product_id}, Name: {self.name}, Description: {self.description}, Price: ${self.price:.2f}"

    def update_product_info(self, name=None, description=None, price=None):
        if name:
            self.name = name
        if description:
            self.description = description
        if price is not None and price >= 0:
            self.price = price

    def is_product_in_stock(self, inventory):
        return inventory.get_quantity_in_stock(self.product_id) > 0
