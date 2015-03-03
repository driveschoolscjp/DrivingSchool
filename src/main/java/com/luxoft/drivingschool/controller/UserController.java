package com.luxoft.drivingschool.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

// Можно ставить @RequestMapping над классом, тогда этот путь будет комбинироваться с путем в @RequestMapping метода
// также можно указывать массив путей
@Controller
public class UserController {

    // либо же в методе можно ничего не указывать в @RequestMapping(method = RequestMethod.GET)
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
