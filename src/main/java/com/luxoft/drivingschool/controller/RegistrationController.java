package com.luxoft.drivingschool.controller;

import com.luxoft.drivingschool.service.RegistrationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RegistrationController {

    @Autowired
    RegistrationService registrationService;

    //TODO перенести сюда всю работу с регистрацией


    // переход на страницу просмотра заявок
    @RequestMapping(value = "admin/registration/search", method = RequestMethod.GET)
    public String cars(Model model) {
        model.addAttribute("registrations", registrationService.findAll());
        return "admin/registrationSearch";
    }
}
