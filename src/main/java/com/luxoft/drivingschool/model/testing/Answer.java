package com.luxoft.drivingschool.model.testing;

import org.springframework.data.jpa.domain.AbstractPersistable;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "answers")
public class Answer extends AbstractPersistable<Long> {
    private String answer;
    private boolean correct;
    @ManyToOne
    private Question question;

    public String getAns() {
        return answer;
    }

    public void setAns(String ans) {
        this.answer = ans;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public boolean getCorrect() {
        return correct;
    }

    public void setCorrect(boolean correct) {
        this.correct = correct;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }
    @Override
    public void setId(Long id) {
        super.setId(id);
    }
}
