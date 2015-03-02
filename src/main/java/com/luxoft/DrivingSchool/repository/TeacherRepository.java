package com.luxoft.drivingschool.repository;

import com.luxoft.drivingschool.model.Teacher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 * Created by Aleksei Chumakov on 28.02.2015.
 */
public interface TeacherRepository extends JpaRepository<Teacher, Long> {
    @Query("select t from Teacher t where t.login = :login")
    Teacher findByLogin(@Param("login") String login);
}
