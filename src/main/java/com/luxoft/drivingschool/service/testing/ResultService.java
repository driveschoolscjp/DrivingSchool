package com.luxoft.drivingschool.service.testing;

import com.luxoft.drivingschool.model.testing.Result;
import com.luxoft.drivingschool.repository.testing.ResultRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by SCJP on 10.03.2015.
 */

@Service
@Transactional(readOnly = true)
public class ResultService {
    @Autowired
    private ResultRepository resultRepository;

    @Transactional
    public Result save(Result result) {
        long studentId = result.getStudent().getId();
        long questionId = result.getAnswer().getQuestion().getId();
        List<Result> results = resultRepository.findByStudentIdAndQuestionId(studentId, questionId);
        resultRepository.delete(results);
        return resultRepository.save(result);
    }

    public List<Result> findByStudentId(long studentId, long ticketId) {
        return resultRepository.findByStudentId(studentId, ticketId);
    }

    public int countCorrect(long studentId, long ticketId) {
        return resultRepository.countCorrect(studentId, ticketId);
    }

    public Integer countIncorrect(long studentId, Long ticketId) {
        return resultRepository.countIncorrect(studentId, ticketId);
    }
}
