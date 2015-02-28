package com.luxoft.DrivingSchool.repository;

import com.luxoft.DrivingSchool.model.Student;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Aleksei Chumakov on 28.02.2015.
 */
public interface StudentRepository extends JpaRepository<Student, Long> {
}
