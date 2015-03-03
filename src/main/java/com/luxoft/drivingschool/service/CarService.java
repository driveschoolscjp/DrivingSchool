package com.luxoft.drivingschool.service;

import com.luxoft.drivingschool.repository.CarRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CarService {
    @Autowired
    private CarRepository carRepository;
}
