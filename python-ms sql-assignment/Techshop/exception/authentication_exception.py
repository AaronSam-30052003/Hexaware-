class AuthenticationException(Exception):
    def __init__(self, message="Unauthorized access attempt detected."):
        super().__init__(message)
