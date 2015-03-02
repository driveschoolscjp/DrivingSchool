package com.luxoft.drivingschool.repository;

import com.luxoft.drivingschool.model.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 * Created by Aleksei Chumakov on 28.02.2015.
 */
public interface StudentRepository extends JpaRepository<Student, Long> {
    @Query("select s from Student s where s.login = :login")
    Student findByLogin(@Param("login") String login);
}
