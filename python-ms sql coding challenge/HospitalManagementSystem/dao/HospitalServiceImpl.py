from dao.IHospitalService import IHospitalService
from util.DBConnUtil import DBConnUtil
from entity.Appointment import Appointment
from entity.Patient import Patient
from entity.Doctor import Doctor
from exception.PatientNumberNotFoundException import PatientNumberNotFoundException

class HospitalServiceImpl(IHospitalService):

    # ---------------- APPOINTMENTS ----------------
    def scheduleAppointment(self, appointment):
        conn = DBConnUtil.getConnection()
        cursor = conn.cursor()
        cursor.execute(
            "INSERT INTO hospitalschema.Appointment(patientId, doctorId, appointmentDate, description) VALUES (?, ?, ?, ?)",
            (appointment.patientId, appointment.doctorId, appointment.appointmentDate, appointment.description)
        )
        conn.commit()
        conn.close()
        return True

    def updateAppointment(self, appointment):
        conn = DBConnUtil.getConnection()
        cursor = conn.cursor()
        cursor.execute(
            "UPDATE hospitalschema.Appointment SET patientId=?, doctorId=?, appointmentDate=?, description=? WHERE appointmentId=?",
            (appointment.patientId, appointment.doctorId, appointment.appointmentDate, appointment.description, appointment.appointmentId)
        )
        conn.commit()
        conn.close()
        return True

    def cancelAppointment(self, appointmentId):
        conn = DBConnUtil.getConnection()
        cursor = conn.cursor()
        cursor.execute("DELETE FROM hospitalschema.Appointment WHERE appointmentId=?", (appointmentId,))
        conn.commit()
        conn.close()
        return True

    def getAllAppointments(self):
        conn = DBConnUtil.getConnection()
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM hospitalschema.Appointment")
        rows = cursor.fetchall()
        conn.close()
        return [Appointment(*row) for row in rows]

    def getAppointmentById(self, appointmentId):
        conn = DBConnUtil.getConnection()
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM hospitalschema.Appointment WHERE appointmentId = ?", (appointmentId,))
        row = cursor.fetchone()
        conn.close()
        if row:
            return Appointment(*row)
        else:
            raise PatientNumberNotFoundException("Appointment ID not found")

    def getAppointmentsForPatient(self, patientId):
        conn = DBConnUtil.getConnection()
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM hospitalschema.Appointment WHERE patientId = ?", (patientId,))
        rows = cursor.fetchall()
        conn.close()
        if not rows:
            raise PatientNumberNotFoundException("No appointments found for this patient")
        return [Appointment(*row) for row in rows]

    def getAppointmentsForDoctor(self, doctorId):
        conn = DBConnUtil.getConnection()
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM hospitalschema.Appointment WHERE doctorId = ?", (doctorId,))
        rows = cursor.fetchall()
        conn.close()
        return [Appointment(*row) for row in rows]

    # ---------------- PATIENTS ----------------
    def addPatient(self, patient):
        conn = DBConnUtil.getConnection()
        cursor = conn.cursor()
        cursor.execute(
            "INSERT INTO hospitalschema.Patient(firstName, lastName, dateOfBirth, gender, contactNumber, address) VALUES (?, ?, ?, ?, ?, ?)",
            (patient.firstName, patient.lastName, patient.dateOfBirth, patient.gender, patient.contactNumber, patient.address)
        )
        conn.commit()
        conn.close()
        return True

    def updatePatient(self, patient):
        conn = DBConnUtil.getConnection()
        cursor = conn.cursor()
        cursor.execute(
            "UPDATE hospitalschema.Patient SET firstName=?, lastName=?, dateOfBirth=?, gender=?, contactNumber=?, address=? WHERE patientId=?",
            (patient.firstName, patient.lastName, patient.dateOfBirth, patient.gender, patient.contactNumber, patient.address, patient.patientId)
        )
        conn.commit()
        conn.close()
        return True

    def deletePatient(self, patientId):
        conn = DBConnUtil.getConnection()
        cursor = conn.cursor()
        cursor.execute("DELETE FROM hospitalschema.Patient WHERE patientId=?", (patientId,))
        conn.commit()
        conn.close()
        return True

    def getAllPatients(self):
        conn = DBConnUtil.getConnection()
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM hospitalschema.Patient")
        rows = cursor.fetchall()
        conn.close()
        return [Patient(*row) for row in rows]

    # ---------------- DOCTORS ----------------
    def addDoctor(self, doctor):
        conn = DBConnUtil.getConnection()
        cursor = conn.cursor()
        cursor.execute(
            "INSERT INTO hospitalschema.Doctor(firstName, lastName, specialization, contactNumber) VALUES (?, ?, ?, ?)",
            (doctor.firstName, doctor.lastName, doctor.specialization, doctor.contactNumber)
        )
        conn.commit()
        conn.close()
        return True

    def updateDoctor(self, doctor):
        conn = DBConnUtil.getConnection()
        cursor = conn.cursor()
        cursor.execute(
            "UPDATE hospitalschema.Doctor SET firstName=?, lastName=?, specialization=?, contactNumber=? WHERE doctorId=?",
            (doctor.firstName, doctor.lastName, doctor.specialization, doctor.contactNumber, doctor.doctorId)
        )
        conn.commit()
        conn.close()
        return True

    def deleteDoctor(self, doctorId):
        conn = DBConnUtil.getConnection()
        cursor = conn.cursor()
        cursor.execute("DELETE FROM hospitalschema.Doctor WHERE doctorId=?", (doctorId,))
        conn.commit()
        conn.close()
        return True

    def getAllDoctors(self):
        conn = DBConnUtil.getConnection()
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM hospitalschema.Doctor")
        rows = cursor.fetchall()
        conn.close()
        return [Doctor(*row) for row in rows]
