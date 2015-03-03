package com.luxoft.drivingschool.model;

import org.springframework.data.jpa.domain.AbstractPersistable;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "schedule")
public class Schedule extends AbstractPersistable<Long> {

    @ManyToOne
    private Teacher instructor;
    @ManyToOne
    private Student student;
    @Temporal(value = TemporalType.DATE)
    private Date day;
    private int startInterval;
    private int finishInterval;

    public Teacher getInstructor() {
        return instructor;
    }

    public void setInstructor(Teacher instructor) {
        this.instructor = instructor;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Date getDay() {
        return day;
    }

    public void setDay(Date day) {
        this.day = day;
    }

    public int getStartInterval() {
        return startInterval;
    }

    public void setStartInterval(int startInterval) {
        this.startInterval = startInterval;
    }

    public int getFinishInterval() {
        return finishInterval;
    }

    public void setFinishInterval(int finishInterval) {
        this.finishInterval = finishInterval;
    }
}
