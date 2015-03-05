package com.luxoft.drivingschool.model.tests;

import org.springframework.data.jpa.domain.AbstractPersistable;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "answers")
public class Answer extends AbstractPersistable<Long> {
    private String answer;
    private boolean isTrue;
    @ManyToOne
    private Question question;
}
