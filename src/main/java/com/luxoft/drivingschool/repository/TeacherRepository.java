package com.luxoft.drivingschool.repository;

import com.luxoft.drivingschool.model.Teacher;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TeacherRepository extends JpaRepository<Teacher, Long> {

    List<Teacher> findByCarId(long carId);

    List<Teacher> findByCarIsNotNull();

    List<Teacher> findByCarIsNull();

    List<Teacher> findByFirstnameLikeOrLastnameLikeAllIgnoreCase(String firstname, String lastname);
}
