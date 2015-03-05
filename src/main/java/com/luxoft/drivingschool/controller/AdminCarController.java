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

@RequestMapping("/admin/car")
@Controller
public class AdminCarController {

    private static final String VIEW_SEARCH_PATH = "/admin/car/search";
    private static final String VIEW_SHOW_PATH = "admin/car/show";
    private static final String VIEW_EDIT_PATH = "admin/car/edit";
    private static final String REDIRECT_SHOW_TO_ID_PATH = "redirect:show?id=";

    private static final String SEARCH_MAPPING_PATH="/search";
    private static final String ADD_MAPPING_PATH="/add";
    private static final String SAVE_MAPPING_PATH="/save";
    private static final String SHOW_MAPPING_PATH="/show";
    private static final String EDIT_MAPPING_PATH="/edit";

    private static final String CARS_ATTRIBUTE="cars";
    private static final String CAR_ATTRIBUTE="car";
    private static final String TEACHERS_ATTRIBUTE="teachers";
    private static final String INSTRUCTORS_ATTRIBUTE="instructors";

    private static final String ID_REQUEST_PARAM="id";

    @Autowired
    private CarService carService;

    @Autowired
    private TeacherService teacherService;

    @RequestMapping(value = SEARCH_MAPPING_PATH, method = RequestMethod.GET)
    public String showAllCars(Model model) {

        model.addAttribute(CARS_ATTRIBUTE, carService.findAll());
        model.addAttribute(TEACHERS_ATTRIBUTE, teacherService.findAll());
        return VIEW_SEARCH_PATH;
    }


    // Переход на форму сохранения
    @RequestMapping(value = ADD_MAPPING_PATH, method = RequestMethod.GET)
    public String showRegistration(Model model) {

        model.addAttribute(CAR_ATTRIBUTE, new Car());
        model.addAttribute(INSTRUCTORS_ATTRIBUTE, teacherService.findByCarIsNull());
        return VIEW_EDIT_PATH;
    }

    // Сохранение и переход на форму просмотра
    @RequestMapping(value = SAVE_MAPPING_PATH, method = RequestMethod.POST)
    public String processRegistration(@ModelAttribute(CAR_ATTRIBUTE) Car car) {
        car = carService.save(car);
        return REDIRECT_SHOW_TO_ID_PATH + car.getId(); // На страничку просмотра
    }

    // Показ одногу машину
    @RequestMapping(value = SHOW_MAPPING_PATH, method = RequestMethod.GET)
    public String show(@RequestParam(ID_REQUEST_PARAM) long id, Model model) {

        model.addAttribute(CAR_ATTRIBUTE, carService.findOne(id));
        return VIEW_SHOW_PATH;
    }

    // Редактирование одной машинины
    @RequestMapping(value = EDIT_MAPPING_PATH, method = RequestMethod.GET)
    public String edit(@RequestParam(ID_REQUEST_PARAM) long id, Model model) {

        Car car = carService.findOne(id);
        List<Teacher> instructors = teacherService.findByCarIsNull();

        instructors.add(car.getInstructor());
        model.addAttribute(CAR_ATTRIBUTE, car);
        model.addAttribute(INSTRUCTORS_ATTRIBUTE, instructors);

        return VIEW_EDIT_PATH;
    }
}
