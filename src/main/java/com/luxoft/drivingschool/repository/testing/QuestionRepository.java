package com.luxoft.drivingschool.repository.testing;

import com.luxoft.drivingschool.model.testing.Question;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import sun.security.krb5.internal.Ticket;

import java.util.List;

/**
 * Created by SCJP on 06.03.2015.
 */
public interface QuestionRepository extends JpaRepository<Question, Long> {

    List<Question> findByTicketId(Long ticketId);

    int countByTicketId(long ticketId);
}
