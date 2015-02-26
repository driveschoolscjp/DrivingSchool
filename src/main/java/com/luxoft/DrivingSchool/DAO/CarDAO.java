package com.luxoft.DrivingSchool.DAO;

import java.util.List;

public interface CarDAO extends GenericDAO<CarDAO> {

    List<CarDAO> findByBrand(String brand);

    List<CarDAO> findByfindByEngineSize(double engineSize);

    List<CarDAO> findByTransmission(String transmission);
}
