package com.luxoft.DrivingSchool.model;

import org.springframework.data.jpa.domain.AbstractPersistable;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by Aleksei Chumakov on 28.02.2015.
 */
@Entity
@Table(name = "schedule")
public class Schedule extends AbstractPersistable<Long> {
    @ManyToOne
    @JoinColumn(name = "teacher_id")
    private Teacher teacher;
    @ManyToOne
    @JoinColumn(name = "student_id")
    private Student student;
    @Temporal(value = TemporalType.DATE)
    private Date day;
    private int startInterval;
    private int finishInterval;

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public int getStartInterval() {
        return startInterval;
    }

    public void setStartInterval(int startInterval) {
        this.startInterval = startInterval;
    }

    public Date getDay() {
        return day;
    }

    public void setDay(Date day) {
        this.day = day;
    }

    public int getFinishInterval() {

        return finishInterval;
    }

    public void setFinishInterval(int finishInterval) {
        this.finishInterval = finishInterval;
    }
}
