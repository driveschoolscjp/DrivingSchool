package com.luxoft.drivingschool.model.tests;


import com.luxoft.drivingschool.model.Group;
import org.springframework.data.jpa.domain.AbstractPersistable;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "questions")
public class Question extends AbstractPersistable<Long> {
    private int number;
    private String question;
    private int ticket;
    private long id_theme;
    private String pathToPicture;
    @ManyToOne
    private Theme theme;
}
