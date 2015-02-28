package com.luxoft.DrivingSchool.repository;

import com.luxoft.DrivingSchool.model.Student;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface StudentRepository extends JpaRepository<Student, Long> {

    List<Student> findByFirstname(String firstname);

    List<Student> findByGroupId(long groupId);
}
