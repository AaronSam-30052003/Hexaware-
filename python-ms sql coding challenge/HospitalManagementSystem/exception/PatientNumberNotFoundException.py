class PatientNumberNotFoundException(Exception):
    def __init__(self, message="Patient not found"):
        super().__init__(message)
