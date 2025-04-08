from dao.HospitalServiceImpl import HospitalServiceImpl
from entity.Appointment import Appointment
from exception.PatientNumberNotFoundException import PatientNumberNotFoundException

if __name__ == "__main__":
    service = HospitalServiceImpl()

    while True:
        print("\n--- Hospital Management System ---")
        print("1. Get Appointment by ID")
        print("2. Get Appointments for Patient")
        print("3. Get Appointments for Doctor")
        print("4. Schedule Appointment")
        print("5. Update Appointment")
        print("6. Cancel Appointment")
        print("0. Exit")
        choice = input("Enter choice: ")

        try:
            if choice == '1':
                aid = int(input("Enter appointment ID: "))
                appt = service.getAppointmentById(aid)
                print(appt)

            elif choice == '2':
                pid = int(input("Enter patient ID: "))
                appts = service.getAppointmentsForPatient(pid)
                for a in appts:
                    print(a)

            elif choice == '3':
                did = int(input("Enter doctor ID: "))
                appts = service.getAppointmentsForDoctor(did)
                for a in appts:
                    print(a)

            elif choice == '4':
                pid = int(input("Enter patient ID: "))
                did = int(input("Enter doctor ID: "))
                date = input("Enter date (YYYY-MM-DD): ")
                desc = input("Enter description: ")
                appt = Appointment(None, pid, did, date, desc)
                if service.scheduleAppointment(appt):
                    print("Appointment scheduled.")

            elif choice == '5':
                aid = int(input("Enter appointment ID to update: "))
                pid = int(input("Enter new patient ID: "))
                did = int(input("Enter new doctor ID: "))
                date = input("Enter new date: ")
                desc = input("Enter new description: ")
                appt = Appointment(aid, pid, did, date, desc)
                if service.updateAppointment(appt):
                    print("Appointment updated.")

            elif choice == '6':
                aid = int(input("Enter appointment ID to cancel: "))
                if service.cancelAppointment(aid):
                    print("Appointment cancelled.")

            elif choice == '0':
                break

            else:
                print("Invalid choice!")

        except PatientNumberNotFoundException as e:
            print("Error:", e)

        except Exception as e:
            print("An unexpected error occurred:", e)
