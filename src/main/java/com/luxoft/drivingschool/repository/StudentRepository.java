package com.luxoft.drivingschool.repository;

import com.luxoft.drivingschool.model.Student;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface StudentRepository extends JpaRepository<Student, Long> {
    List<Student> findByFirstname(String firstname);
    List<Student> findByGroupId(long groupId);
    Student findByLogin(String login);
    List<Student> findByInstructorFirstname(String firstname);
}
