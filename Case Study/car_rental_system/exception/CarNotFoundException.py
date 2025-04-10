class CarNotFoundException(Exception):
    def __init__(self, message="Car not found in database."):
        super().__init__(message)
