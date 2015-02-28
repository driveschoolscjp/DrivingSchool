package com.luxoft.DrivingSchool.repository;

import com.luxoft.DrivingSchool.model.Teacher;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TeacherRepository extends JpaRepository<Teacher, Long> {

    List<Teacher> findByFirstname(String firstname);
}
