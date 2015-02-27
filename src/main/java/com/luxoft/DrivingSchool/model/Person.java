package com.luxoft.DrivingSchool.model;

import org.springframework.data.jpa.domain.AbstractPersistable;

import javax.persistence.*;
import java.util.Date;

@MappedSuperclass
public abstract class Person extends AbstractPersistable<Long> {
    @Column(length = 40)
    private String name;
    @Column(length = 40)
    private String surname;
    @Column(length = 40)
    private String patronymic;
    @Column(length = 6)
    private String passport;
    private Integer inn;
    @Temporal(value = TemporalType.DATE)
    private Date birthday;
    @Enumerated(EnumType.ORDINAL)
    private Gender gender;
    private String email;
    private String photoURI;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getPatronymic() {
        return patronymic;
    }

    public void setPatronymic(String patronymic) {
        this.patronymic = patronymic;
    }

    public String getPassport() {
        return passport;
    }

    public void setPassport(String passport) {
        this.passport = passport;
    }

    public Integer getInn() {
        return inn;
    }

    public void setInn(Integer inn) {
        this.inn = inn;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhotoURI() {
        return photoURI;
    }

    public void setPhotoURI(String phooURI) {
        this.photoURI = photoURI;
    }
}
