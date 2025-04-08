class Patient:
    def __init__(self, patientId=None, firstName="", lastName="", dateOfBirth="", gender="", contactNumber="", address=""):
        self.patientId = patientId
        self.firstName = firstName
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
        self.gender = gender
        self.contactNumber = contactNumber
        self.address = address

    def __str__(self):
        return f"{self.patientId}, {self.firstName} {self.lastName}, {self.dateOfBirth}, {self.gender}, {self.contactNumber}, {self.address}"
