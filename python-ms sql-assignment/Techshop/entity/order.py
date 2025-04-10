class Order:
    def __init__(self, order_id, customer, order_date, status="Processing"):
        self.__order_id = order_id
        self.customer = customer
        self.order_date = order_date
        self.status = status
        self.total_amount = 0.0
        self.order_details = []

    @property
    def order_id(self):
        return self.__order_id

    def calculate_total_amount(self):
        self.total_amount = sum(detail.calculate_subtotal() for detail in self.order_details)
        return self.total_amount

    def get_order_details(self):
        return {
            "OrderID": self.order_id,
            "Customer": self.customer.get_customer_details(),
            "OrderDate": self.order_date,
            "TotalAmount": self.calculate_total_amount(),
            "Status": self.status
        }

    def update_order_status(self, new_status):
        self.status = new_status

    def cancel_order(self, inventory):
        for detail in self.order_details:
            inventory.add_to_inventory(detail.product.product_id, detail.quantity)
        self.status = "Cancelled"
