package com.luxoft.drivingschool.model;

import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;
import org.springframework.data.jpa.domain.AbstractPersistable;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "schedule")
public class Schedule extends AbstractPersistable<Long> {
    @ManyToOne
    private Teacher teacher;
    @ManyToOne
    private Student student;
    @Type(type="org.joda.time.contrib.hibernate.PersistentDateTime")
    private LocalDate day;
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

    public LocalDate getDay() {
        return day;
    }

    public void setDay(LocalDate day) {
        this.day = day;
    }

    public int getFinishInterval() {
        return finishInterval;
    }

    public void setFinishInterval(int finishInterval) {
        this.finishInterval = finishInterval;
    }
}
