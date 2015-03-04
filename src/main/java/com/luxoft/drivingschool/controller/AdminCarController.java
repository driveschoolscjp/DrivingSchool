package com.luxoft.drivingschool.controller;

import com.luxoft.drivingschool.model.Car;
import com.luxoft.drivingschool.model.Teacher;
import com.luxoft.drivingschool.service.CarService;
import com.luxoft.drivingschool.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * Created by SCJP on 04.03.2015.
 */
@RequestMapping("/admin/car")
@Controller
public class AdminCarController {
    @Autowired
    private CarService carService;

    @Autowired
    private TeacherService teacherService;

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String showAllCars(Model model) {

        model.addAttribute("cars", carService.findAll());
        model.addAttribute("teachers", teacherService.findAll());
        return "admin/car/search";
    }


    // Переход на форму сохранения
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String showRegistration(Model model) {

        model.addAttribute("car", new Car());
        model.addAttribute("instructors", teacherService.findByCarIsNull());
        return "admin/car/edit";
    }

    // Сохранение и переход на форму просмотра
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String processRegistration(@ModelAttribute("car") Car car) {
        car = carService.save(car);
        return "redirect:show?id=" + car.getId(); // На страничку просмотра
    }

    // Показ одногу машину
    @RequestMapping(value = "/show", method = RequestMethod.GET)
    public String show(@RequestParam("id") long id, Model model) {

        model.addAttribute("car", carService.findOne(id));
        return "admin/car/show";
    }

    // Редактирование одной машинины
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(@RequestParam("id") long id, Model model) {

        Car car = carService.findOne(id);
        List<Teacher> instructors = teacherService.findByCarIsNull();

        instructors.add(car.getInstructor());
        model.addAttribute("car", car);
        model.addAttribute("instructors", instructors);

        return "admin/car/edit";
    }
}
