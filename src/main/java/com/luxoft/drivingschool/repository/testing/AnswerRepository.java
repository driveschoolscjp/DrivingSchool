package com.luxoft.drivingschool.repository.testing;

import com.luxoft.drivingschool.model.testing.Answer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by SCJP on 06.03.2015.
 */
public interface AnswerRepository extends JpaRepository<Answer, Long> {
    List<Answer> findByQuestionId(long id);

    @Query(value = "SELECT answers.question_id FROM answers WHERE id = ?0", nativeQuery = true)
    List<Long> selectQuestionId(Long id);
}
