package com.luxoft.drivingschool.service;

import com.luxoft.drivingschool.model.Teacher;

/**
 * Created by Aleksei Chumakov on 28.02.2015.
 */
public interface TeacherService {
    Teacher findByLogin(String login);
}
