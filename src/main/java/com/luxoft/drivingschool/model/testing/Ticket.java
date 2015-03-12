package com.luxoft.drivingschool.model.testing;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.data.jpa.domain.AbstractPersistable;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.util.List;

/**
 * Created by Svetlana Lawrentyeva on 07.03.15.
 */

@Entity
@Table(name = "tickets")
public class Ticket extends AbstractPersistable<Long> implements Comparable<Ticket> {
    private int number;
    @ManyToOne
    @JsonIgnore
    private Exam exam;

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public Exam getExam() {
        return exam;
    }

    public void setExam(Exam exam) {
        this.exam = exam;
    }


    @Override
    public int compareTo(Ticket o) {
        return this.number-((Ticket)o).number;
    }
    @Override
    public void setId(Long id) {
        super.setId(id);
    }
}
