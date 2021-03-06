package com.luxoft.drivingschool.model;

import org.hibernate.annotations.Type;
import org.joda.time.LocalDateTime;
import org.springframework.data.jpa.domain.AbstractPersistable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "messages")
public class Message extends AbstractPersistable<Long> {

    private String theme;
    @Column(columnDefinition = "TEXT")
    private String message;
    @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentLocalDateTime")
    private LocalDateTime dateTime;
    @ManyToOne
    private Student student;
    private boolean old;

    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public LocalDateTime getDateTime() {
        return dateTime;
    }

    public void setDateTime(LocalDateTime dateTime) {
        this.dateTime = dateTime;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public boolean isOld() {
        return old;
    }

    public void setOld(boolean old) {
        this.old = old;
    }

    public void setId(Long id) {
        super.setId(id);
    }
}
