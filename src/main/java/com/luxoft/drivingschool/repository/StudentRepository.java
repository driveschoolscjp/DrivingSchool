package com.luxoft.drivingschool.repository;

import com.luxoft.drivingschool.model.Student;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface StudentRepository extends JpaRepository<Student, Long> {

    List<Student> findByGroupIdOrderByLastnameAsc(long groupId);

    Student findByLogin(String login);

    List<Student> findByFirstnameLikeOrLastnameLikeAllIgnoreCase(String firstnameLike, String lastnameLike);
}
