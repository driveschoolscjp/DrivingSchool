package com.luxoft.drivingschool.repository;

import com.luxoft.drivingschool.model.Car;
import com.luxoft.drivingschool.model.Transmission;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CarRepository extends JpaRepository<Car, Long> {

    List<CarRepository> findByBrand(String brand);

    List<CarRepository> findByEngineSize(float engineSize);

    List<CarRepository> findByTransmission(Transmission transmission);
}
