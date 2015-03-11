package com.luxoft.drivingschool.repository.testing;

import com.luxoft.drivingschool.model.testing.Result;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by SCJP on 10.03.2015.
 */
public interface ResultRepository  extends JpaRepository<Result, Long> {
//    List<Result> findByStudentId(long studentId);

    @Query(value = "SELECT results.id, results.dateof," +
            "results.answer_id, results.student_id from results" +
            "  join answers on answers.id = results.answer_id" +
            "  join questions on questions.id = answers.question_id" +
            " WHERE questions.ticket_id = ?2 and results.student_id=?1 and results.dateof = (" +
            "  select MAX(results.dateof) from results" +
            "    join answers on answers.id = results.answer_id" +
            "    join questions on questions.id = answers.question_id" +
            "  WHERE questions.ticket_id = ?2 and results.student_id=?1" +
            ")", nativeQuery = true)
    List<Result> findByStudentId(long studentId, long ticketId);

    @Query(value = "SELECT count(answers.correct) from answers" +
            "  join results on answers.id = results.answer_id" +
            "  join questions on questions.id = answers.question_id" +
            " WHERE questionS.ticket_id = ?2 and results.student_id= ?1 and answers.correct = true and results.dateof = (" +
            "  select MAX(results.dateof) from results" +
            "    join answers on answers.id = results.answer_id" +
            "    join questions on questions.id = answers.question_id" +
            "  WHERE questions.ticket_id = ?2 and results.student_id= ?1" +
            ")", nativeQuery = true)
    int countCorrect(long studentId, long ticketId);

    @Query(value = "SELECT count(answers.correct) from answers" +
            "  join results on answers.id = results.answer_id" +
            "  join questions on questions.id = answers.question_id" +
            " WHERE questionS.ticket_id = ?2 and results.student_id= ?1 and answers.correct = false and results.dateof = (" +
            "  select MAX(results.dateof) from results" +
            "    join answers on answers.id = results.answer_id" +
            "    join questions on questions.id = answers.question_id" +
            "  WHERE questions.ticket_id = ?2 and results.student_id= ?1" +
            ")", nativeQuery = true)
    int countIncorrect(long studentId, long ticketId);


}
