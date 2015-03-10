package com.luxoft.drivingschool.repository.testing;

import com.luxoft.drivingschool.model.testing.Ticket;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by Svetlana Lawrentyeva on 07.03.15.
 */
public interface TicketRepository extends JpaRepository<Ticket, Long> {
    Integer countByExamId(long examId);
    List<Ticket> findByExamId(long examId);

    long findByNumberAndExamId(int ticketNumber, long idExam);
}
