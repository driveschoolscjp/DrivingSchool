package com.luxoft.drivingschool.repository;


import com.luxoft.drivingschool.model.Registration;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RegistrationRepository extends JpaRepository<Registration, Long> {

}
