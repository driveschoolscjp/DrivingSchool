package com.luxoft.drivingschool.controller;

import com.luxoft.drivingschool.model.Student;
import com.luxoft.drivingschool.repository.StudentRepository;
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
}
