package com.luxoft.drivingschool.service;

import com.luxoft.drivingschool.model.Student;

/**
 * Created by Aleksei Chumakov on 28.02.2015.
 */
public interface StudentService {
    Student findByLogin(String login);
}
