from dao.HospitalServiceImpl import HospitalServiceImpl
from entity.Appointment import Appointment
from entity.Patient import Patient
from entity.Doctor import Doctor

if __name__ == "__main__":
    service = HospitalServiceImpl()

    while True:
        print("\n--- Hospital Management System ---")
        print("1. Add Patient")
        print("2. View All Patients")
        print("3. Update Patient")
        print("4. Delete Patient")
        print("5. Add Doctor")
        print("6. View All Doctors")
        print("7. Update Doctor")
        print("8. Delete Doctor")
        print("9. Schedule Appointment")
        print("10. Update Appointment")
        print("11. Cancel Appointment")
        print("12. View All Appointments")
        print("13. Get Appointment by ID")
        print("14. Get Appointments for Patient")
        print("15. Get Appointments for Doctor")
        print("0. Exit")

        choice = input("Enter choice: ")

        try:
            if choice == '1':
                firstName = input("Enter first name: ")
                lastName = input("Enter last name: ")
                dob = input("Enter DOB (YYYY-MM-DD): ")
                gender = input("Enter gender: ")
                contact = input("Enter contact number: ")
                address = input("Enter address: ")
                patient = Patient(None, firstName, lastName, dob, gender, contact, address)
                service.addPatient(patient)
                print("Patient added.")

            elif choice == '2':
                for p in service.getAllPatients():
                    print(p)

            elif choice == '3':
                pid = int(input("Enter patient ID: "))
                firstName = input("Enter new first name: ")
                lastName = input("Enter new last name: ")
                dob = input("Enter new DOB (YYYY-MM-DD): ")
                gender = input("Enter new gender: ")
                contact = input("Enter new contact: ")
                address = input("Enter new address: ")
                patient = Patient(pid, firstName, lastName, dob, gender, contact, address)
                service.updatePatient(patient)
                print("Patient updated.")

            elif choice == '4':
                pid = int(input("Enter patient ID to delete: "))
                service.deletePatient(pid)
                print("Patient deleted.")

            elif choice == '5':
                firstName = input("Enter first name: ")
                lastName = input("Enter last name: ")
                spec = input("Enter specialization: ")
                contact = input("Enter contact: ")
                doctor = Doctor(None, firstName, lastName, spec, contact)
                service.addDoctor(doctor)
                print("Doctor added.")

            elif choice == '6':
                for d in service.getAllDoctors():
                    print(d)

            elif choice == '7':
                did = int(input("Enter doctor ID: "))
                firstName = input("Enter new first name: ")
                lastName = input("Enter new last name: ")
                spec = input("Enter new specialization: ")
                contact = input("Enter new contact: ")
                doctor = Doctor(did, firstName, lastName, spec, contact)
                service.updateDoctor(doctor)
                print("Doctor updated.")

            elif choice == '8':
                did = int(input("Enter doctor ID to delete: "))
                service.deleteDoctor(did)
                print("Doctor deleted.")

            elif choice == '9':
                pid = int(input("Enter patient ID: "))
                did = int(input("Enter doctor ID: "))
                date = input("Enter date (YYYY-MM-DD): ")
                desc = input("Enter description: ")
                appt = Appointment(None, pid, did, date, desc)
                service.scheduleAppointment(appt)
                print("Appointment scheduled.")

            elif choice == '10':
                aid = int(input("Enter appointment ID: "))
                pid = int(input("Enter new patient ID: "))
                did = int(input("Enter new doctor ID: "))
                date = input("Enter new date (YYYY-MM-DD): ")
                desc = input("Enter new description: ")
                appt = Appointment(aid, pid, did, date, desc)
                service.updateAppointment(appt)
                print("Appointment updated.")

            elif choice == '11':
                aid = int(input("Enter appointment ID to cancel: "))
                service.cancelAppointment(aid)
                print("Appointment cancelled.")

            elif choice == '12':
                for a in service.getAllAppointments():
                    print(a)

            elif choice == '13':
                aid = int(input("Enter appointment ID: "))
                appt = service.getAppointmentById(aid)
                print(appt)

            elif choice == '14':
                pid = int(input("Enter patient ID: "))
                for a in service.getAppointmentsForPatient(pid):
                    print(a)

            elif choice == '15':
                did = int(input("Enter doctor ID: "))
                for a in service.getAppointmentsForDoctor(did):
                    print(a)

            elif choice == '0':
                break

            else:
                print("Invalid choice.")

        except Exception as e:
            print(f"Error: {e}")
