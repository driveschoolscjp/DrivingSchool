package com.luxoft.drivingschool.model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "students")
public class Student extends Person {
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "group_id")
    private Group group;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "instructor_id")
    private Teacher instructor;
    private int rideNumber;
    @OneToMany(mappedBy="student", cascade=CascadeType.REMOVE)
    private List<Schedule> schedule;

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

    public int getRideNumber() {
        return rideNumber;
    }

    public void setRideNumber(int rideNumber) {
        this.rideNumber = rideNumber;
    }

    public Teacher getInstructor() {
        return instructor;
    }

    public void setInstructor(Teacher instructor) {
        this.instructor = instructor;
    }
}
