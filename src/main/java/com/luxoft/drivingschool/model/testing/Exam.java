package com.luxoft.drivingschool.model.testing;

import org.springframework.data.jpa.domain.AbstractPersistable;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by Svetlana Lawrentyeva on 07.03.15.
 */


@Entity
@Table(name = "exams")
public class Exam extends AbstractPersistable<Long> {
    private String name;
    private int ticketQuantity;
    private int questionPerTicketQuantity;


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getTicketQuantity() {
        return ticketQuantity;
    }

    public void setTicketQuantity(int ticketQuantity) {
        this.ticketQuantity = ticketQuantity;
    }

    public int getQuestionPerTicketQuantity() {
        return questionPerTicketQuantity;
    }

    public void setQuestionPerTicketQuantity(int questionPerTicketQuantity) {
        this.questionPerTicketQuantity = questionPerTicketQuantity;
    }

    @Override
    public void setId(Long id) {
        super.setId(id);
    }
}
