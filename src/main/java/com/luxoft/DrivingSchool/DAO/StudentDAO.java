package com.luxoft.DrivingSchool.DAO;

import com.luxoft.DrivingSchool.model.Student;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface StudentDAO extends JpaRepository<Student, Long> {

    Student findByFirstname(String firstname);

    List<Student> findByGroupId(long groupId);
}
