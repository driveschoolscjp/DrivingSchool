package com.luxoft.DrivingSchool.service;

import com.luxoft.DrivingSchool.repository.CarRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CarService {

    @Autowired
    CarRepository carRepository;
}
