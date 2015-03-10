package com.luxoft.drivingschool.model.testing;


import com.luxoft.drivingschool.model.Student;
import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;
import org.springframework.data.jpa.domain.AbstractPersistable;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "results")
public class Result  extends AbstractPersistable<Long> {
    @OneToOne
    private Student student;
    @OneToOne
    private Answer answer;
    @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
    private LocalDate dateOf;

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Answer getAnswer() {
        return answer;
    }

    public void setAnswer(Answer answer) {
        this.answer = answer;
    }

    public LocalDate getDateOf() {
        return dateOf;
    }

    public void setDateOf(LocalDate dateOf) {
        this.dateOf = dateOf;
    }
}
