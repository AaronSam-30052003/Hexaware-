from hos_pak.patient import Patient
from hos_pak.database import get_connection

class Specialization:
    MAX_CAPACITY = 10
    PATIENT_STATUS = {0: "Normal", 1: "Urgent", 2: "Super-Urgent"}

    def __init__(self, name):
        self.name = f'Specialization {name}'
        self.queue = []

    def add_new_patient(self, name, status):
        if len(self.queue) >= self.MAX_CAPACITY:
            print("Apologies, the queue is full for this specialization.")
            return

        if status not in self.PATIENT_STATUS:
            print("Invalid status. Status should be 0 (normal), 1 (urgent), or 2 (super-urgent).")
            return

        new_patient = Patient(name, status)
        self.queue.append(new_patient)
        self.queue.sort(key=lambda x: x.status, reverse=True)

        try:
            conn = get_connection()
            cursor = conn.cursor()
            cursor.execute(
                "INSERT INTO Patients (name, status, specialization) VALUES (?, ?, ?)",
                (name, status, self.name)
            )
            conn.commit()
        except Exception as e:
            print(f"Error inserting into DB: {e}")
        finally:
            conn.close()

        print(f"Patient: {new_patient.name} is {self.PATIENT_STATUS[new_patient.status]}")

    def get_next_patient(self):
        if not self.queue:
            print("The queue is empty.")
            return

        next_patient = self.queue.pop(0)

        try:
            conn = get_connection()
            cursor = conn.cursor()
            cursor.execute(
                "DELETE FROM Patients WHERE name = ? AND specialization = ?",
                (next_patient.name, self.name)
            )
            conn.commit()
        except Exception as e:
            print(f"Error deleting from DB: {e}")
        finally:
            conn.close()

        print(f"{next_patient.name}, please go with the doctor.")

    def remove_patient(self, name):
        patient_to_remove = next((patient for patient in self.queue if patient.name == name), None)
        if patient_to_remove:
            self.queue.remove(patient_to_remove)

            try:
                conn = get_connection()
                cursor = conn.cursor()
                cursor.execute(
                    "DELETE FROM Patients WHERE name = ? AND specialization = ?",
                    (name, self.name)
                )
                conn.commit()
            except Exception as e:
                print(f"Error deleting from DB: {e}")
            finally:
                conn.close()

            print(f"Patient {name} removed from {self.name}.")
            return True
        else:
            print(f"No patient named {name} found in {self.name}.")
            return False

    def print_patients(self):
        if not self.queue:
            print(f"No patients in {self.name}.")
        else:
            for patient in self.queue:
                print(f"Patient: {patient.name} is {self.PATIENT_STATUS[patient.status]}")

    def is_full(self):
        return len(self.queue) >= self.MAX_CAPACITY

    def __str__(self):
        return f"{self.name}: There are {len(self.queue)} patients"
