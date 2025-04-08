from dao.IHospitalService import IHospitalService
from util.DBConnUtil import DBConnUtil
from entity.Appointment import Appointment
from exception.PatientNumberNotFoundException import PatientNumberNotFoundException

class HospitalServiceImpl(IHospitalService):
    def getAppointmentById(self, appointmentId):
        conn = DBConnUtil.getConnection()
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM hospitalschema.Appointment WHERE appointmentId = ?", appointmentId)
        row = cursor.fetchone()
        conn.close()
        if row:
            return Appointment(*row)
        else:
            raise PatientNumberNotFoundException("Appointment ID not found")

    def getAppointmentsForPatient(self, patientId):
        conn = DBConnUtil.getConnection()
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM hospitalschema.Appointment WHERE patientId = ?", patientId)
        rows = cursor.fetchall()
        conn.close()
        if not rows:
            raise PatientNumberNotFoundException("No appointments found for this patient")
        return [Appointment(*row) for row in rows]

    def getAppointmentsForDoctor(self, doctorId):
        conn = DBConnUtil.getConnection()
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM hospitalschema.Appointment WHERE doctorId = ?", doctorId)
        rows = cursor.fetchall()
        conn.close()
        return [Appointment(*row) for row in rows]

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
        cursor.execute("DELETE FROM hospitalschema.Appointment WHERE appointmentId=?", appointmentId)
        conn.commit()
        conn.close()
        return True
