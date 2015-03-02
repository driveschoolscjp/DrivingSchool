package com.luxoft.drivingschool.model;

import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;
import org.springframework.data.jpa.domain.AbstractPersistable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "groups")
public class Group extends AbstractPersistable<Long> {

    @Column(length = 40)
    private String name;
    @Type(type="org.joda.time.contrib.hibernate.PersistentDateTime")
    private LocalDate startDate;
    @Type(type="org.joda.time.contrib.hibernate.PersistentDateTime")
    private LocalDate finishDate;
    @ManyToOne
    private Teacher teacher;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getFinishDate() {
        return finishDate;
    }

    public void setFinishDate(LocalDate finishDate) {
        this.finishDate = finishDate;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }
}
