from hos_pak.specialization import Specialization
from hos_pak.utility import input_is_valid
from hos_pak.database import get_connection
from hos_pak.patient import Patient

class OperationsManager:
    def __init__(self):
        self.specs = []
        self.load_existing_patients()

    def load_existing_patients(self):
        """Loads existing patients from the database into their specialization queues."""
        conn = get_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT name, status, specialization FROM Patients")

        spec_map = {}
        for name, status, specialization in cursor.fetchall():
            if specialization not in spec_map:
                spec_map[specialization] = Specialization(specialization.replace("Specialization ", ""))
            patient = Patient(name, status)
            spec_map[specialization].queue.append(patient)

        self.specs = list(spec_map.values())
        conn.close()

    def print_menu(self):
        print("\n--- Program Options ---")
        print("1) Add new patient")
        print("2) Print all patients")
        print("3) Get next patient")
        print("4) Remove a leaving patient")
        print("5) End the program")
        return input_is_valid("Enter your choice (1-5): ", 1, 5)

    def find_specialization(self, name):
        for spec in self.specs:
            if spec.name == 'Specialization ' + name:
                return spec
        return None

    def run(self):
        while True:
            choice = self.print_menu()

            if choice == 1:
                spec_name = input("Enter specialization: ")
                patient_name = input("Enter patient name: ")
                status = input_is_valid("Enter status (0: Normal, 1: Urgent, 2: Super-Urgent): ", 0, 2)

                spec = self.find_specialization(spec_name)
                if not spec:
                    spec = Specialization(spec_name)
                    self.specs.append(spec)

                spec.add_new_patient(patient_name, status)

            elif choice == 2:
                for spec in self.specs:
                    print(f"\n{spec.name}:")
                    spec.print_patients()

            elif choice == 3:
                spec_name = input("Enter specialization: ")
                spec = self.find_specialization(spec_name)
                if spec:
                    spec.get_next_patient()
                else:
                    print("No such specialization found.")

            elif choice == 4:
                spec_name = input("Enter specialization: ")
                patient_name = input("Enter patient name: ")
                spec = self.find_specialization(spec_name)
                if spec:
                    removed = spec.remove_patient(patient_name)
                    if not removed:
                        print("No patient with such a name in this specialization.")
                else:
                    print("No such specialization found.")

            elif choice == 5:
                print("Exiting program")
                break
