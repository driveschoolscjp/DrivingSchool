package com.luxoft.drivingschool.service;

import com.luxoft.drivingschool.model.Registration;
import com.luxoft.drivingschool.repository.RegistrationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



@Service
@Transactional(readOnly = true)
public class RegistrationService {


    @Autowired
    private RegistrationRepository registrationRepository;

    @Transactional
    public Registration save(Registration registration){

        return registrationRepository.save(registration);
    }
}
