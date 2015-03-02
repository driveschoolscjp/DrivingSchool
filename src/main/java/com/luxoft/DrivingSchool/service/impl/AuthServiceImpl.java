package com.luxoft.drivingschool.service.impl;

import com.luxoft.drivingschool.model.Person;
import com.luxoft.drivingschool.service.AuthService;
import com.luxoft.drivingschool.service.StudentService;
import com.luxoft.drivingschool.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Aleksei Chumakov on 02.03.2015.
 */
@Service("authService")
@Transactional
public class AuthServiceImpl implements AuthService {
    @Autowired
    private StudentService studentService;
    @Autowired
    private TeacherService teacherService;
    public Person getPerson(String login) {
        Person user = teacherService.findByLogin(login);
        if (user != null) {
            return user;
        }
        return studentService.findByLogin(login);
    }
}
