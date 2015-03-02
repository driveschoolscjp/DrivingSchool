package com.luxoft.drivingschool.service;

import com.luxoft.drivingschool.model.Person;

/**
 * Created by Aleksei Chumakov on 01.03.2015.
 */
public interface AuthService {
    Person getPerson(String login);
}
