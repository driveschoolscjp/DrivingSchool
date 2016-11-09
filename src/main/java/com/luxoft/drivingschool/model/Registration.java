package com.luxoft.drivingschool.model;


import org.springframework.data.jpa.domain.AbstractPersistable;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "registrations")
public class Registration extends AbstractPersistable<Long> {

    @NotNull
    @Size(min = 2, max = 50)
    private String firstname;
    @NotNull
    @Size(min = 2, max = 50)
    private String lastname;
    @NotNull
    @Size(min = 2, max = 50)
    private String patronymic;
    @NotNull
    @Size(min = 2, max = 30)
    private String tel;
    @NotNull
    @Size(min = 2, max = 30)
    private String email;
    @ManyToOne
    private Car car;

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getPatronymic() {
        return patronymic;
    }

    public void setPatronymic(String patronymic) {
        this.patronymic = patronymic;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
    }
}
