package com.luxoft.drivingschool.service;

import com.luxoft.drivingschool.model.Car;
import com.luxoft.drivingschool.repository.CarRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional (readOnly = true)
public class CarService {
    @Autowired
    private CarRepository carRepository;

    public List<Car> findAll(){
        return carRepository.findAll();
    }

    @Transactional
    public Car save(Car car){
        carRepository.save(car);
        return car;
    }

    public Car findOne(long id){
        return carRepository.findOne(id);
    }

}
