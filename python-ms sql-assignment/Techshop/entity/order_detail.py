class OrderDetail:
    def __init__(self, order_detail_id, order, product, quantity):
        self.__order_detail_id = order_detail_id
        self.order = order
        self.product = product
        self.quantity = quantity
        self.discount = 0.0

    @property
    def order_detail_id(self):
        return self.__order_detail_id

    def calculate_subtotal(self):
        return self.product.price * self.quantity * (1 - self.discount)

    def get_order_detail_info(self):
        return f"Product: {self.product.name}, Quantity: {self.quantity}, Subtotal: {self.calculate_subtotal():.2f}"

    def update_quantity(self, new_quantity):
        if new_quantity > 0:
            self.quantity = new_quantity

    def add_discount(self, discount_percent):
        if 0 <= discount_percent <= 100:
            self.discount = discount_percent / 100
