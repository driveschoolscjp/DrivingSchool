package com.luxoft.drivingschool.service.testing;


import com.luxoft.drivingschool.model.testing.Answer;
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
}
