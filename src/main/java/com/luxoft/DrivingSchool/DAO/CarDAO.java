package com.luxoft.DrivingSchool.DAO;

import com.luxoft.DrivingSchool.model.Car;
import com.luxoft.DrivingSchool.model.Transmission;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CarDAO extends JpaRepository<Car, Long> {

    List<CarDAO> findByBrand(String brand);

    List<CarDAO> findByEngineSize(float engineSize);

    List<CarDAO> findByTransmission(Transmission transmission);
}
