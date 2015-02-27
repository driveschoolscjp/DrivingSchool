package com.luxoft.DrivingSchool.model;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "teachers")
public class Teacher extends Person {
    private String description;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
