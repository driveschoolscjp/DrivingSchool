package com.luxoft.drivingschool.controller.testing;

import com.luxoft.drivingschool.model.Student;
import com.luxoft.drivingschool.model.testing.Answer;
import com.luxoft.drivingschool.model.testing.Exam;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Svetlana Lawrentyeva on 08.03.15.
 */

@Component
public class UserExamDetail {
    private Student student;
    private Exam exam;
    private List<Answer> results;

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Exam getExam() {
        return exam;
    }

    public void setExam(Exam exam) {
        this.exam = exam;
    }

    public List<Answer> getResults() {
        return results;
    }

    public void setResults(List<Answer> results) {
        this.results = results;
    }
}
