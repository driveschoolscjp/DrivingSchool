package com.luxoft.drivingschool.model;

import com.luxoft.drivingschool.model.enums.Gender;
import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;
import org.springframework.data.jpa.domain.AbstractPersistable;

import javax.persistence.Column;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public abstract class Person extends AbstractPersistable<Long> {

    @Column(length = 50)
    private String firstname;
    @Column(length = 50)
    private String lastname;
    @Column(length = 50)
    private String patronymic;
    @Column(length = 8)
    private String passport;
    private int inn;
    @Type(type="org.joda.time.contrib.hibernate.PersistentDateTime")
    private LocalDate birthday;
    @Enumerated(EnumType.STRING)
    private Gender gender;
    private String tel;
    private String email;
    private String photoURI;

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

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

    public String getPassport() {
        return passport;
    }

    public void setPassport(String passport) {
        this.passport = passport;
    }

    public int getInn() {
        return inn;
    }

    public void setInn(int inn) {
        this.inn = inn;
    }

    public LocalDate getBirthday() {
        return birthday;
    }

    public void setBirthday(LocalDate birthday) {
        this.birthday = birthday;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
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

    public String getPhotoURI() {
        return photoURI;
    }

    public void setPhotoURI(String photoURI) {
        this.photoURI = photoURI;
    }
}
