package com.luxoft.DrivingSchool.DAO;

import com.luxoft.DrivingSchool.model.Teacher;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TeacherDAO extends JpaRepository<Teacher, Long> {

    List<Teacher> findByFirstname(String firstname);
}
