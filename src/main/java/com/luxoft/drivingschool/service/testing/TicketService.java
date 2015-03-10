package com.luxoft.drivingschool.service.testing;

import com.luxoft.drivingschool.model.testing.Ticket;
import com.luxoft.drivingschool.repository.testing.TicketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Svetlana Lawrentyeva on 07.03.15.
 */

@Service
@Transactional(readOnly = true)
public class TicketService {

    @Autowired
    TicketRepository ticketRepository;

    public List<Ticket> findByExamId(long examId) {
        return ticketRepository.findByExamId(examId);
    }

    @Transactional
    public Ticket save(Ticket ticket) {
        return ticketRepository.save(ticket);
    }

    public int countByExamId(long examId) {
        return ticketRepository.countByExamId(examId);
    }

    public Ticket findOne(long ticketId) {
        return ticketRepository.findOne(ticketId);
    }

    public long findByNumberAndExamId(int ticketNumber, long idExam) {
        return ticketRepository.findByNumberAndExamId(ticketNumber, idExam);
    }
}
