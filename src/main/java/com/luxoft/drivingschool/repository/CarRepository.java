package com.luxoft.drivingschool.repository;

import com.luxoft.drivingschool.model.Car;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CarRepository extends JpaRepository<Car, Long> {

    List<Car> findByBrand(String brand);

    List<Car> findByInstructorFirstname(String firstname);

    List<Car> findByPricePerHour(float pricePerHour);
}
