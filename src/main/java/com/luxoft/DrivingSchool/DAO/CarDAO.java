package com.luxoft.DrivingSchool.DAO;

import com.luxoft.DrivingSchool.model.Car;

import java.util.List;

public interface CarDAO extends GenericDAO<Car> {

    List<CarDAO> findByBrand(String brand);

    List<CarDAO> findByfindByEngineSize(double engineSize);

    List<CarDAO> findByTransmission(String transmission);
}
