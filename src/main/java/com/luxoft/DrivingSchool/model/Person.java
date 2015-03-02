package com.luxoft.drivingschool.model;

import com.luxoft.drivingschool.model.enums.Gender;
import org.springframework.data.jpa.domain.AbstractPersistable;

import javax.persistence.*;
import java.util.Date;

@MappedSuperclass
public abstract class Person extends AbstractPersistable<Long> {
    private String login;
    private String password;
    @Column(length = 40)
    private String firstName;
    @Column(length = 40)
    private String lastName;
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

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
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
}
