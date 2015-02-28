package com.luxoft.DrivingSchool.service.impl;

import com.luxoft.DrivingSchool.model.Car;
import com.luxoft.DrivingSchool.service.CarService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Aleksei Chumakov on 28.02.2015.
 */
@Service("carService")
@Transactional
public class CarServiceImpl extends BaseServiceImpl<Car> implements CarService {
}
