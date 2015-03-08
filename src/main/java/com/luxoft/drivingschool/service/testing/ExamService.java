package com.luxoft.drivingschool.service.testing;

import com.luxoft.drivingschool.model.testing.Exam;
import com.luxoft.drivingschool.repository.testing.ExamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Svetlana Lawrentyeva on 07.03.15.
 */

@Service
@Transactional(readOnly = true)
public class ExamService {

    @Autowired
    ExamRepository examRepository;

    public List<Exam> findAll() {
        return examRepository.findAll();
    }

    @Transactional
    public Exam save(Exam exam) {
        return examRepository.save(exam);
    }

    public Exam findOne(long examId) {
        return examRepository.findOne(examId);
    }
}
