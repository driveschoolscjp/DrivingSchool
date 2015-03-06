package com.luxoft.drivingschool.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

// Можно ставить @RequestMapping над классом, тогда этот путь будет комбинироваться с путем в @RequestMapping метода
// также можно указывать массив путей
@Controller
public class UserController {

    private static final String LOGIN_MAPPING_PATH = "/login";

    private static final String LOGIN_REQUEST_PARAM = "login";
    private static final String PASSWORD_REQUEST_PARAM = "password";

    private static final String VIEW_ADMIN_PATH = "admin";
    private static final String VIEW_ADMIN_ADMIN_PATH = "admin/admin";

    // либо же в методе можно ничего не указывать в @RequestMapping(method = RequestMethod.GET)
    @RequestMapping(value = LOGIN_MAPPING_PATH, method = RequestMethod.POST)
    public String takeLogin(@RequestParam(LOGIN_REQUEST_PARAM) String login,
                            @RequestParam(PASSWORD_REQUEST_PARAM) String password) {

        System.out.println("login: " + login);
        System.out.println("password: " + password);

        if (login.equals("a") && password.equals("a")) {
            return VIEW_ADMIN_ADMIN_PATH;
        }
        return VIEW_ADMIN_PATH;
    }
}
