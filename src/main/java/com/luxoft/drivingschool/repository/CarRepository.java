package com.luxoft.drivingschool.repository;

import com.luxoft.drivingschool.model.Car;
import com.luxoft.drivingschool.model.enums.Transmission;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CarRepository extends JpaRepository<Car, Long> {

    List<Car> findByBrand(String brand);

    List<Car> findByHorsePowerAndTransmission( int horsePower, Transmission transmission);
    List<Car> findByHorsePowerLessThanAndTransmission( int horsePower, Transmission transmission);
    List<Car> findByPricePerHourLessThanAndTransmission( float pricePerHour, Transmission transmission);
    List<Car> findByPricePerHourAndTransmission( float pricePerHour, Transmission transmission);

    List<Car> findByTransmission(Transmission transmission);
}
