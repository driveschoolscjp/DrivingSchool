package com.luxoft.drivingschool.service.testing;


import com.luxoft.drivingschool.model.testing.Question;
import com.luxoft.drivingschool.repository.testing.QuestionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class QuestionService {

    @Autowired
    QuestionRepository questionRepository;

    public List<Question> findAll(){
        return questionRepository.findAll();
    }

    @Transactional
    public Question save(Question question){
        return questionRepository.save(question);
    }

    public Question findOne(long id){
        return questionRepository.findOne(id);
    }

    public List<Question> findAllByTicket() {
        return questionRepository.findAll();
    }

    public List<Question> findByTicketId(Long ticketId) {
        return questionRepository.findByTicketId(ticketId);
    }

    public int lastNumber(long ticketId) {
        return questionRepository.countByTicketId(ticketId);
    }

    public Question findByTicketIdAndNumber(long ticketId, int number){
        return questionRepository.findByTicketIdAndNumber(ticketId, number);
    }

}
