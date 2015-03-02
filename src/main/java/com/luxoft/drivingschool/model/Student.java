package com.luxoft.drivingschool.model;

import javax.persistence.*;

@Entity
@Table(name = "students")
public class Student extends Person {

    private String login;
    private String password;
    @ManyToOne(fetch = FetchType.LAZY)
    private Group group;
    @ManyToOne(fetch = FetchType.LAZY)
    private Teacher instructor;
    private int rideNumber;

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

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
