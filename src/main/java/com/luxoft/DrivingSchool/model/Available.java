package com.luxoft.DrivingSchool.model;

import org.springframework.data.jpa.domain.AbstractPersistable;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "available")
public class Available extends AbstractPersistable<Long> {
    @ManyToOne(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "teacher_id")
    private Teacher teacher;
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
