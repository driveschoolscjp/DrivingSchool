package com.luxoft.DrivingSchool.repository;

import com.luxoft.DrivingSchool.model.Car;
import com.luxoft.DrivingSchool.model.Transmission;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CarRepository extends JpaRepository<Car, Long> {

    List<CarRepository> findByBrand(String brand);

    List<CarRepository> findByEngineSize(float engineSize);

    List<CarRepository> findByTransmission(Transmission transmission);
}
