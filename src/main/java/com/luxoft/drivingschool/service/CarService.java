package com.luxoft.drivingschool.service;

import com.luxoft.drivingschool.repository.CarRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CarService {

    @Autowired
    CarRepository carRepository;
}
