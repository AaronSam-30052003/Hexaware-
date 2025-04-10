class PaymentFailedException(Exception):
    def __init__(self, message="Payment failed during processing."):
        super().__init__(message)
