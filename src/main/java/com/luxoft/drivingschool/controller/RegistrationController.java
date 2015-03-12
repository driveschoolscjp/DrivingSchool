package com.luxoft.drivingschool.controller;

import com.luxoft.drivingschool.model.Car;
import com.luxoft.drivingschool.model.Registration;
import com.luxoft.drivingschool.service.CarService;
import com.luxoft.drivingschool.service.RegistrationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RegistrationController {

    @Autowired
    private CarService carService;

    @Autowired
    RegistrationService registrationService;

    // переход на страницу "запись в автошколу"
    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {

        model.addAttribute("cars", carService.findAll());
        model.addAttribute("registration", new Registration());
        return "registration";
    }
    // переход на страницу "запись в автошколу" с выбраным авто
    @RequestMapping(value =  "/registration", method = RequestMethod.POST)
    public String defaultCarRegistration(@RequestParam("id") long id, Model model) {

        Registration registration = new Registration();
        Car car = carService.findOne(id);
        registration.setCar(car);

        model.addAttribute("cars", carService.findAll());
        model.addAttribute("registration", registration);
        return "registration";
    }

    // Сохранение "запись в автошколу" и переход на home page
    @RequestMapping(value = "/registration/save", method = RequestMethod.POST)
    public String processRegistration(@ModelAttribute("registration") Registration registration) {

        registration = registrationService.save(registration);
        return "home"; // На страничку просмотра
    }

    // переход на страницу просмотра заявок
    @RequestMapping(value = "admin/registration/search", method = RequestMethod.GET)
    public String registrations(Model model) {
        model.addAttribute("registrations", registrationService.findAll());
        return "admin/registrationSearch";
    }

    // Удаление регистрации и обратно на страничку поиска
    @RequestMapping(value = "admin/registration/delete", method = RequestMethod.GET)
    public String deleteRegistration(@RequestParam("id") long id, Model model) {

        registrationService.delete(id);
        return "redirect:/admin/registration/search";
    }
}
