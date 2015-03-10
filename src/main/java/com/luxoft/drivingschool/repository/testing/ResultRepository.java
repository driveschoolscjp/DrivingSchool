package com.luxoft.drivingschool.repository.testing;

import com.luxoft.drivingschool.model.testing.Result;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by SCJP on 10.03.2015.
 */
public interface ResultRepository  extends JpaRepository<Result, Long> {
    List<Result> findByStudentId(long studentId);
}
