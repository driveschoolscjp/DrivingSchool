package com.luxoft.drivingschool.repository;


import com.luxoft.drivingschool.model.Registration;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by SCJP on 10.03.2015.
 */
public interface RegistrationRepository extends JpaRepository<Registration, Long> {

}
