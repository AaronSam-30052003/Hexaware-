class CustomerNotFoundException(Exception):
    def __init__(self, message="Customer not found in database."):
        super().__init__(message)
