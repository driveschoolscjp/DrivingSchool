package com.luxoft.drivingschool.model;

import com.luxoft.drivingschool.model.enums.Gender;
import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;
import org.springframework.data.jpa.domain.AbstractPersistable;

import javax.persistence.Column;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.MappedSuperclass;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@MappedSuperclass
public abstract class Person extends AbstractPersistable<Long> {

    @NotNull
    @Size(min = 2, max = 50)
    private String firstname;
    @NotNull
    @Size(min = 2, max = 50)
    private String lastname;
    @NotNull
    @Size(min = 2, max = 50)
    private String patronymic;
    @Column(length = 8)
    @NotNull
    @Pattern(regexp = "^[А-Я]{2}\\d{6}$")
    private String passport;
    @Column(length = 8)
    @NotNull
    @Pattern(regexp = "^\\d{8}$")
    private String inn;
    @NotNull
    @Past
    @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
    private LocalDate birthday;
    @NotNull
    @Enumerated(EnumType.STRING)
    private Gender gender;
    @Size(min = 2, max = 30)
    private String tel;
    @Size(min = 2, max = 30)
    private String email;

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

    public String getInn() {
        return inn;
    }

    public void setInn(String inn) {
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

    @Override
    public void setId(Long id) {
        super.setId(id);
    }
}
