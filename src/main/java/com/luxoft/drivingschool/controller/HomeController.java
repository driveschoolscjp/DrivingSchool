package com.luxoft.drivingschool.controller;

import com.luxoft.drivingschool.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

    @Autowired
    private CarService carService;

    private static final String ROOT_MAPPING_PATH = "/";
    private static final String HOME_MAPPING_PATH = "/home";
    private static final String SCHEDULE_MAPPING_PATH = "/schedule";
    private static final String CONTACT_MAPPING_PATH = "/contact";
    private static final String CARS_MAPPING_PATH = "/cars";

    private static final String VIEW_HOME_PATH = "home";
    private static final String SCHEDULE_HOME_PATH = "schedule";
    private static final String CONTACT_HOME_PATH = "contact";
    private static final String CARS_HOME_PATH = "/cars";

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
}