package com.luxoft.drivingschool.repository.testing;

import com.luxoft.drivingschool.model.testing.Answer;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by SCJP on 06.03.2015.
 */
public interface AnswerRepository extends JpaRepository<Answer, Long> {
}
