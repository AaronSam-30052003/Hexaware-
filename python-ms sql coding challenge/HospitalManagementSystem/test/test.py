import pytest
from unittest.mock import patch, MagicMock
from dao.HospitalServiceImpl import HospitalServiceImpl
from entity.Appointment import Appointment
from entity.Patient import Patient
from entity.Doctor import Doctor
from exception.Exception import PatientNumberNotFoundException
service = HospitalServiceImpl()

@patch("dao.HospitalServiceImpl.DBConnUtil.getConnection")
def test_add_patient(mock_conn):
    mock_cursor = MagicMock()
    mock_conn.return_value.cursor.return_value = mock_cursor

    patient = Patient(None, "Aaron", "sam", "2004-05-30", "Male", "8807402200", "Madurai")
    assert service.addPatient(patient) is True
    mock_cursor.execute.assert_called_once()

@patch("dao.HospitalServiceImpl.DBConnUtil.getConnection")
def test_get_all_patients(mock_conn):
    mock_cursor = MagicMock()
    mock_conn.return_value.cursor.return_value = mock_cursor
    mock_cursor.fetchall.return_value = [
        (1, "Aaron", "sam", "2004-05-30", "Male", "8807402200", "Madurai")
    ]

    result = service.getAllPatients()
    assert len(result) == 1
    assert result[0].firstName == "Aaron"

@patch("dao.HospitalServiceImpl.DBConnUtil.getConnection")
def test_add_doctor(mock_conn):
    mock_cursor = MagicMock()
    mock_conn.return_value.cursor.return_value = mock_cursor

    doctor = Doctor(None, "Choki", "Mickey", "Cardiology", "9944488074")
    assert service.addDoctor(doctor) is True
    mock_cursor.execute.assert_called_once()

@patch("dao.HospitalServiceImpl.DBConnUtil.getConnection")
def test_schedule_appointment(mock_conn):
    mock_cursor = MagicMock()
    mock_conn.return_value.cursor.return_value = mock_cursor

    appt = Appointment(None, 1, 1, "2025-04-20", "Body Checkup")
    assert service.scheduleAppointment(appt) is True
    mock_cursor.execute.assert_called_once()

@patch("dao.HospitalServiceImpl.DBConnUtil.getConnection")
def test_get_appointment_by_id_found(mock_conn):
    mock_cursor = MagicMock()
    mock_conn.return_value.cursor.return_value = mock_cursor
    mock_cursor.fetchone.return_value = (1, 1, 1, "2025-04-20", "Body Checkup")

    appt = service.getAppointmentById(1)
    assert appt.description == "Body Checkup"

@patch("dao.HospitalServiceImpl.DBConnUtil.getConnection")
def test_get_appointment_by_id_not_found(mock_conn):
    mock_cursor = MagicMock()
    mock_conn.return_value.cursor.return_value = mock_cursor
    mock_cursor.fetchone.return_value = None

    with pytest.raises(PatientNumberNotFoundException):
        service.getAppointmentById(999)

@patch("dao.HospitalServiceImpl.DBConnUtil.getConnection")
def test_get_appointments_for_patient_found(mock_conn):
    mock_cursor = MagicMock()
    mock_conn.return_value.cursor.return_value = mock_cursor
    mock_cursor.fetchall.return_value = [
        (1, 1, 2, "2025-04-20", "Consultation for body health")
    ]

    result = service.getAppointmentsForPatient(1)
    assert len(result) == 1
    assert result[0].description == "Consultation for body health"

@patch("dao.HospitalServiceImpl.DBConnUtil.getConnection")
def test_get_appointments_for_patient_not_found(mock_conn):
    mock_cursor = MagicMock()
    mock_conn.return_value.cursor.return_value = mock_cursor
    mock_cursor.fetchall.return_value = []

    with pytest.raises(PatientNumberNotFoundException):
        service.getAppointmentsForPatient(999)
