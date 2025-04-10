class Doctor:
    def __init__(self, doctorId=None, firstName="", lastName="", specialization="", contactNumber=""):
        self.doctorId = doctorId
        self.firstName = firstName
        self.lastName = lastName
        self.specialization = specialization
        self.contactNumber = contactNumber

    def __str__(self):
        return f"{self.doctorId}, {self.firstName} {self.lastName}, {self.specialization}, {self.contactNumber}"
