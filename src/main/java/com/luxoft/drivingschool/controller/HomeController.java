package com.luxoft.drivingschool.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

    private static final String ROOT_MAPPING_PATH = "/";
    private static final String HOME_MAPPING_PATH = "/home";
    private static final String SCHEDULE_MAPPING_PATH = "/schedule";
    private static final String CONTACT_MAPPING_PATH = "/contact";

    private static final String VIEW_HOME_PATH = "home";
    private static final String SCHEDULE_HOME_PATH = "schedule";
    private static final String CONTACT_HOME_PATH = "contact";
    private static final String COST_HOME_PATH = "cost";

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

    @RequestMapping(value = COST_HOME_PATH, method = RequestMethod.GET)
    public String cost() {
        return COST_HOME_PATH    ;
    }
}