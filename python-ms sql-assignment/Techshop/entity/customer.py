class Customer:
    def __init__(self, customer_id, first_name, last_name, email, phone, address):
        self.__customer_id = customer_id
        self.first_name = first_name
        self.last_name = last_name
        self.email = email
        self.phone = phone
        self.address = address

    @property
    def customer_id(self):
        return self.__customer_id

    def calculate_total_orders(self, orders):
        return sum(1 for order in orders if order.customer.customer_id == self.customer_id)

    def get_customer_details(self):
        return f"ID: {self.customer_id}, Name: {self.first_name} {self.last_name}, Email: {self.email}, Phone: {self.phone}, Address: {self.address}"

    def update_customer_info(self, email=None, phone=None, address=None):
        if email:
            self.email = email
        if phone:
            self.phone = phone
        if address:
            self.address = address
