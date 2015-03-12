package com.luxoft.drivingschool.repository;

import com.luxoft.drivingschool.model.Message;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MessageRepository extends JpaRepository<Message, Long> {
}
