class Inventory:
    def __init__(self):
        self.stock = {}  # product_id -> (quantity, product)

    def add_product(self, product, quantity):
        if product.product_id in self.stock:
            self.stock[product.product_id][0] += quantity
        else:
            self.stock[product.product_id] = [quantity, product]

    def get_quantity_in_stock(self, product_id):
        return self.stock.get(product_id, [0])[0]

    def add_to_inventory(self, product_id, quantity):
        if product_id in self.stock:
            self.stock[product_id][0] += quantity

    def remove_from_inventory(self, product_id, quantity):
        if product_id in self.stock and self.stock[product_id][0] >= quantity:
            self.stock[product_id][0] -= quantity
            return True
        return False

    def update_stock_quantity(self, product_id, new_quantity):
        if product_id in self.stock:
            self.stock[product_id][0] = new_quantity

    def is_product_available(self, product_id, quantity):
        return self.get_quantity_in_stock(product_id) >= quantity

    def get_inventory_value(self):
        return sum(qty * prod.price for pid, (qty, prod) in self.stock.items())

    def list_low_stock_products(self, threshold):
        return [(pid, prod.name) for pid, (qty, prod) in self.stock.items() if qty < threshold]

    def list_out_of_stock_products(self):
        return [(pid, prod.name) for pid, (qty, prod) in self.stock.items() if qty == 0]

    def list_all_products(self):
        return [(prod.product_id, prod.name, qty) for prod_id, (qty, prod) in self.stock.items()]
