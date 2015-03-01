package com.luxoft.DrivingSchool.controller;

import com.luxoft.DrivingSchool.model.Student;
import com.luxoft.DrivingSchool.repository.StudentRepository;
import com.luxoft.DrivingSchool.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by SCJP on 26.02.2015.
 */
@Controller
public class UserController {




   private StudentRepository studentRepository;


    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView takeLogin(HttpServletRequest httpServletRequest){
        ModelAndView mav = new ModelAndView();

       String login = httpServletRequest.getParameter("login");
       String password =  httpServletRequest.getParameter("password");

        System.out.println("login: " + login);
        System.out.println("password: " + password);


        if (login.equals("administrator") && password.equals("administrator")){
            mav.setViewName("administrator");
            return mav;
        }
        mav.setViewName("client");
        return mav;
    }


    @RequestMapping(value = "add", method = RequestMethod.GET)
    public String viewRegistration(Map<String, Object> model) {
        Student userForm = new Student();
        model.put("userForm", userForm);

        return "addClient";
    }


    @RequestMapping(value = "add", method = RequestMethod.POST)
    public String processRegistration(@ModelAttribute("userForm") Student user) {

        // implement your own registration logic here...

        studentRepository.save(user);

        // for testing purpose:
        System.out.println("id: " + user.getId());
        System.out.println("login: " + user.getLogin());
        System.out.println("password: " + user.getPassword());
        System.out.println("email: " + user.getEmail());
        System.out.println("Name: " + user.getFirstname());
        System.out.println("Surname: " + user.getLastname());
        System.out.println("Patronymic: " + user.getPatronymic());
        System.out.println("INN: " + user.getInn().toString());
        System.out.println("Passport: " + user.getPassport());
        System.out.println("Number of ride: " + user.getRideNumber());
        System.out.println("Instructor: " + user.getInstructor().toString());
        System.out.println("Group: " + user.getGroup().toString());
        System.out.println("Gender: " + user.getGender().toString());
        System.out.println("Birthday: " + user.getBirthday().toString());

        return "registrationSuccess";
    }



}
