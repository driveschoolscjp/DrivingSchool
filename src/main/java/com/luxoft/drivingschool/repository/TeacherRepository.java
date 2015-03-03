package com.luxoft.drivingschool.repository;

import com.luxoft.drivingschool.model.Group;
import com.luxoft.drivingschool.model.Teacher;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TeacherRepository extends JpaRepository<Teacher, Long> {

    List<Teacher> findByFirstname(String firstname);

}
