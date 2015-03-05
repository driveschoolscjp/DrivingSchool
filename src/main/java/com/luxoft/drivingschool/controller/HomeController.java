package com.luxoft.drivingschool.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping({"/", "/home"})
public class HomeController {

    @RequestMapping(method = {RequestMethod.GET, RequestMethod.HEAD})
    public String home() {
        return "home";
    }

    @RequestMapping(value = "schedule", method = {RequestMethod.GET, RequestMethod.HEAD})
    public String sheduleView() {
        return "schedule";
    }
}