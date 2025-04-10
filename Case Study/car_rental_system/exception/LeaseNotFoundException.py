class LeaseNotFoundException(Exception):
    def __init__(self, message="Lease not found in database."):
        super().__init__(message)
