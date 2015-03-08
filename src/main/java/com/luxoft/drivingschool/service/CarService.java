package com.luxoft.drivingschool.service;

import com.luxoft.drivingschool.model.Car;
import com.luxoft.drivingschool.model.enums.Transmission;
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
        return carRepository.save(car);
    }

    public Car findOne(long id){
        return carRepository.findOne(id);
    }

    public List<Car> findByTransmission(Transmission transmission){
        return carRepository.findByTransmission(transmission);
    }

    public  List<Car> findByPricePerHourLessThanAndTransmission(float pricePerHour,Transmission transmission){
     return carRepository.findByPricePerHourLessThanAndTransmission(pricePerHour, transmission);
    }

    public  List<Car> findByHorsePowerLessThanAndTransmission( int horsePower,Transmission transmission){
        return carRepository.findByHorsePowerLessThanAndTransmission(horsePower, transmission);
    }
    public  List<Car> findByPricePerHourAndTransmission(float pricePerHour,Transmission transmission){
        return carRepository.findByPricePerHourAndTransmission(pricePerHour, transmission);
    }

    public  List<Car> findByHorsePowerAndTransmission( int horsePower,Transmission transmission){
        return carRepository.findByHorsePowerAndTransmission(horsePower, transmission);
    }

}
