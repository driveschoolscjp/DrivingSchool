package com.luxoft.drivingschool.model.testing;


import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.data.jpa.domain.AbstractPersistable;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "questions")
public class Question extends AbstractPersistable<Long> implements Comparable<Question> {

    private int number;
    private String question;
    private String pathToPicture;
    @ManyToOne(optional = true)
    @JsonIgnore
    private Theme theme;
    @ManyToOne
    @JsonIgnore
    private Ticket ticket;
    private String description;

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getQuestion() {
        return question;
    }

    public void setQues(String ques) {
        this.question = ques;
    }
    public String getQues() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public Ticket getTicket() {
        return ticket;
    }

    public void setTicket(Ticket ticket) {
        this.ticket = ticket;
    }

    public String getPathToPicture() {
        return pathToPicture;
    }

    public void setPathToPicture(String pathToPicture) {
        this.pathToPicture = pathToPicture;
    }

    public Theme getTheme() {
        return theme;
    }

    public void setTheme(Theme theme) {
        this.theme = theme;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public int compareTo(Question o) {
        return this.number-((Question)o).number;
    }
    @Override
    public void setId(Long id) {
        super.setId(id);
    }
}
