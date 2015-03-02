package com.luxoft.drivingschool.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.List;

@Entity
@Table(name = "teachers")
public class Teacher extends Person {
    @OneToMany(mappedBy="teacher", cascade=CascadeType.REMOVE)
    private List<Schedule> schedule;
    private String description;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
