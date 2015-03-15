package com.luxoft.drivingschool.service.testing;


import com.luxoft.drivingschool.model.testing.Answer;
import com.luxoft.drivingschool.model.testing.Question;
import com.luxoft.drivingschool.repository.testing.AnswerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class AnswerService {
    @Autowired
    AnswerRepository answerRepository;

    public List<Answer> findAll(){
        return answerRepository.findAll();
    }

    @Transactional
    public Answer save(Answer answer){
        return answerRepository.save(answer);
    }

    public Answer findOne(long id){
        return answerRepository.findOne(id);
    }

    public List<Answer> findByQuestionId(long id) {
        return answerRepository.findByQuestionId(id);
    }

    public long selectQuestionId(Long id) {
        return answerRepository.selectQuestionId(id).get(0);
    }

    public Question findQuestionByAnswerId(Long id) {
        return new Question();
    }

    @Transactional
    public void delete (long id){
        answerRepository.delete(id);
    }
}
