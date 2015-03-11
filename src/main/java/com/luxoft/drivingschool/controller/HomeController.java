package com.luxoft.drivingschool.controller;

import com.luxoft.drivingschool.model.Car;
import com.luxoft.drivingschool.model.Student;
import com.luxoft.drivingschool.model.enums.Transmission;
import com.luxoft.drivingschool.model.enums.UserRoleEnum;
import com.luxoft.drivingschool.service.CarService;
import com.luxoft.drivingschool.service.GroupService;
import com.luxoft.drivingschool.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
public class HomeController {

    @Autowired
    private CarService carService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private GroupService groupService;

    @RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.HEAD})
    public String home() {
        return "home";
    }

    @RequestMapping(value = "/schedule", method = RequestMethod.GET)
    public String scheduleView(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth.getAuthorities().contains(new SimpleGrantedAuthority(UserRoleEnum.ROLE_STUDENT.name()))) {
            Student student = studentService.findByLogin(auth.getName());
            model.addAttribute("student", student);
        }
        return "schedule";
    }

    @RequestMapping(value = "/contact", method = RequestMethod.GET)
    public String contact() {
        return "contact";
    }

    @RequestMapping(value = "/cars", method = RequestMethod.GET)
    public String cars(Model model) {
        model.addAttribute("cars", carService.findAll());
        return "cars"    ;
    }

    // переход на страницу расчета стоимости обучения
    @RequestMapping(value = "/cost", method = RequestMethod.GET)
    public String cost(Model model) {
        model.addAttribute("car", new Car());
        return "cost";
    }

    //выбор всех машин из заданых параметров, при подсчете стоимости обучения
    @RequestMapping(value = "/cost", method = RequestMethod.POST)
    public String processRegistration(@ModelAttribute("car") Car car, Model model) {
        Set<Car> carsTotalList = new HashSet<>();
        Set<Car> carsPricePerHourList = new HashSet<>();
        Set<Car> carsHorsePowerList = new HashSet<>();

        float pricePerHour = car.getPricePerHour();
        int horsePower = car.getHorsePower();
        Transmission transmission = car.getTransmission();

        if ((pricePerHour != 0)&&(transmission!=null) &&(horsePower != 0)) {

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
        model.addAttribute("cars", carsTotalList);

        return "cost";
    }



    // Показ одного инструктора и его авто, отдельно от всех инструкторов
    @RequestMapping(value = "/show", method = RequestMethod.GET)
    public String show(@RequestParam("id") long id, Model model) {

        List<Car> cars = new ArrayList<>();
        Car car = carService.findOne(id);

        for (Car c: carService.findAll()){
            if(!(c.equals(car))){
                cars.add(c);
            }
        }

        model.addAttribute("cars",  cars);
        model.addAttribute("car", carService.findOne(id));
        return "carsShow";
    }

    @RequestMapping(value = "/futuregroups", method = RequestMethod.GET)
    public String futuregroups(Model model) {
        model.addAttribute("groups", groupService.findFutureGroups());
        return "groups";
    }

}