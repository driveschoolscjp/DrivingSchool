package com.luxoft.drivingschool.repository;

import com.luxoft.drivingschool.model.Car;
import org.springframework.data.jpa.repository.JpaRepository;
import com.luxoft.drivingschool.model.enums.Transmission;
import java.util.List;

public interface CarRepository extends JpaRepository<Car, Long> {

    List<Car> findByBrand(String brand);

    List<Car> findByHorsePower(int horsePower);

    List<Car> findByTransmission(Transmission transmission);

    List<Car> findByInstructorFirstname(String firstname);

    List<Car> findByPricePerHour(float pricePerHour);


}
