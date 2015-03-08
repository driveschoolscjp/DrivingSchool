package com.luxoft.drivingschool.repository;

import com.luxoft.drivingschool.model.Car;
import com.luxoft.drivingschool.model.enums.Transmission;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CarRepository extends JpaRepository<Car, Long> {

    List<Car> findByBrand(String brand);

    List<Car> findByHorsePower(int horsePower);

    List<Car> findByTransmission(Transmission transmission);

    List<Car> findByPricePerHour(float pricePerHour);
}
