import pytest
from unittest.mock import patch, MagicMock
from dao.CarLeaseRepositoryImpl import CarLeaseRepositoryImpl
from entity.Car import Car
from exception.CarNotFoundException import CarNotFoundException


@patch('dao.CarLeaseRepositoryImpl.DBConnUtil.getConnection')
def test_add_car(mock_get_conn):
    mock_conn = MagicMock()
    mock_cursor = MagicMock()
    mock_conn.cursor.return_value = mock_cursor
    mock_get_conn.return_value = mock_conn

    repo = CarLeaseRepositoryImpl()
    car = Car(1, "Toyota", "Camry", 2020, 100.0, "available", 5, 2.5)

    repo.addCar(car)

    mock_cursor.execute.assert_called_once()
    mock_conn.commit.assert_called_once()

@patch('dao.CarLeaseRepositoryImpl.DBConnUtil.getConnection')
def test_find_car_by_id_found(mock_get_conn):
    mock_conn = MagicMock()
    mock_cursor = MagicMock()
    mock_cursor.fetchone.return_value = (1, "Toyota", "Camry", 2020, 100.0, "available", 5, 2.5)
    mock_conn.cursor.return_value = mock_cursor
    mock_get_conn.return_value = mock_conn

    repo = CarLeaseRepositoryImpl()
    car = repo.findCarById(1)

    assert isinstance(car, Car)
    assert car.vehicleID == 1
    mock_cursor.execute.assert_called_once()

@patch('dao.CarLeaseRepositoryImpl.DBConnUtil.getConnection')
def test_find_car_by_id_not_found(mock_get_conn):
    mock_conn = MagicMock()
    mock_cursor = MagicMock()
    mock_cursor.fetchone.return_value = None
    mock_conn.cursor.return_value = mock_cursor
    mock_get_conn.return_value = mock_conn

    repo = CarLeaseRepositoryImpl()

    with pytest.raises(CarNotFoundException):
        repo.findCarById(999)

@patch('dao.CarLeaseRepositoryImpl.DBConnUtil.getConnection')
def test_list_available_cars(mock_get_conn):
    mock_conn = MagicMock()
    mock_cursor = MagicMock()
    mock_cursor.fetchall.return_value = [
        (1, "Toyota", "Camry", 2020, 100.0, "available", 5, 2.5),
        (2, "Honda", "Civic", 2021, 90.0, "available", 4, 2.0)
    ]
    mock_conn.cursor.return_value = mock_cursor
    mock_get_conn.return_value = mock_conn

    repo = CarLeaseRepositoryImpl()
    cars = repo.listAvailableCars()

    assert len(cars) == 2
    assert isinstance(cars[0], Car)

@patch('dao.CarLeaseRepositoryImpl.DBConnUtil.getConnection')
def test_remove_car_not_found(mock_get_conn):
    mock_conn = MagicMock()
    mock_cursor = MagicMock()
    mock_cursor.rowcount = 0
    mock_conn.cursor.return_value = mock_cursor
    mock_get_conn.return_value = mock_conn

    repo = CarLeaseRepositoryImpl()
    with pytest.raises(CarNotFoundException):
        repo.removeCar(999)
