package com.luxoft.drivingschool.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

// Можно ставить @RequestMapping над классом, тогда этот путь будет комбинироваться с путем в @RequestMapping метода
// также можно указывать массив путей
@Controller
public class UserController {

    // либо же в методе можно ничего не указывать в @RequestMapping(method = RequestMethod.GET)
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String takeLogin(@RequestParam("login") String login,
                            @RequestParam("password") String password) {

        System.out.println("login: " + login);
        System.out.println("password: " + password);

        if (login.equals("admin") && password.equals("admin")) {
            return "admin";
        }
        return "client";
    }
}
