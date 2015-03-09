package com.luxoft.drivingschool.controller;

import com.luxoft.drivingschool.model.Car;
import com.luxoft.drivingschool.model.enums.Transmission;
import com.luxoft.drivingschool.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
public class HomeController {

    @Autowired
    private CarService carService;

    private static final String ROOT_MAPPING_PATH = "/";
    private static final String HOME_MAPPING_PATH = "/home";
    private static final String SCHEDULE_MAPPING_PATH = "/schedule";
    private static final String CONTACT_MAPPING_PATH = "/contact";
    private static final String CARS_MAPPING_PATH = "/cars";
    private static final String COST_MAPPING_PATH = "/cost";
    private static final String SEARCH_COST_MAPPING_PATH = "/searchCost";
    
    private static final String VIEW_HOME_PATH = "home";
    private static final String SCHEDULE_HOME_PATH = "schedule";
    private static final String CONTACT_HOME_PATH = "contact";
    private static final String CARS_HOME_PATH = "cars";
    private static final String COST_HOME_PATH = "cost";
    
    private static final String CAR_ATTRIBUTE = "car";
    private static final String CARS_ATTRIBUTE = "cars";

    @RequestMapping(value = {ROOT_MAPPING_PATH, HOME_MAPPING_PATH}, method = {RequestMethod.GET, RequestMethod.HEAD})
    public String home() {

        return VIEW_HOME_PATH;
    }

    @RequestMapping(value = SCHEDULE_MAPPING_PATH, method = RequestMethod.GET)
    public String scheduleView() {
        return SCHEDULE_HOME_PATH;
    }

    @RequestMapping(value = CONTACT_MAPPING_PATH, method = RequestMethod.GET)
    public String contact() {
        return CONTACT_HOME_PATH    ;
    }

    @RequestMapping(value = CARS_MAPPING_PATH, method = RequestMethod.GET)
    public String cars(Model model) {
        model.addAttribute(CARS_ATTRIBUTE, carService.findAll());
        return CARS_HOME_PATH    ;
    }

    // переход на страницу разчета стоимости обучения
    @RequestMapping(value = COST_MAPPING_PATH, method = RequestMethod.GET)
    public String cost(Model model) {
        model.addAttribute(CAR_ATTRIBUTE, new Car());
        return COST_HOME_PATH;
    }

    //выбор всех машин из заданых параметров, при подсчете стоимости обучения
    @RequestMapping(value = SEARCH_COST_MAPPING_PATH, method = RequestMethod.POST)
    public String processRegistration(@ModelAttribute(CAR_ATTRIBUTE) Car car, Model model) {
        Set<Car> carsTotalList = new HashSet<Car>();
        Set<Car> carsPricePerHourList = new HashSet<Car>();
        Set<Car> carsHorsePowerList = new HashSet<Car>();

        float pricePerHour = car.getPricePerHour();
        int horsePower = car.getHorsePower();
        Transmission transmission = car.getTransmission();

        if ((pricePerHour != 0)&&(!transmission.equals(null)) &&(horsePower != 0)) {

                carsPricePerHourList.addAll(carService.findByPricePerHourLessThanAndTransmission(pricePerHour, transmission));
                carsPricePerHourList.addAll(carService.findByPricePerHourAndTransmission(pricePerHour, transmission));
                carsHorsePowerList.addAll(carService.findByHorsePowerAndTransmission(horsePower, transmission));
                carsHorsePowerList.addAll(carService.findByHorsePowerLessThanAndTransmission(horsePower, transmission));


            if((!carsHorsePowerList.isEmpty()) && !(carsPricePerHourList.isEmpty())){

             for(Car c : carsHorsePowerList){
                 for (Car c2 : carsPricePerHourList){
                     if(c.equals(c2)){
                         carsTotalList.add(c);
                     }
                 }
             }
            }


        }
        model.addAttribute(CARS_ATTRIBUTE, carsTotalList);

        return COST_HOME_PATH;
    }


}