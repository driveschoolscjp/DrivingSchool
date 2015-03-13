package com.luxoft.drivingschool.repository;

import com.luxoft.drivingschool.model.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface MessageRepository extends JpaRepository<Message, Long> {
    @Query("select count(m) from Message m where m.student.id = ?1 and m.old = false")
    public Integer getCountOfNewMessages(Long id);
}
