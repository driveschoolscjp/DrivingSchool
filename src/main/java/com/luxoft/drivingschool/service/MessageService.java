package com.luxoft.drivingschool.service;

import com.luxoft.drivingschool.model.Message;
import com.luxoft.drivingschool.model.Student;
import com.luxoft.drivingschool.repository.MessageRepository;
import com.luxoft.drivingschool.repository.StudentRepository;
import org.joda.time.LocalDateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class MessageService {
    @Autowired
    private MessageRepository messageRepository;
    @Autowired
    private StudentRepository studentRepository;

    @Transactional
    public void sendMessage(Long sid, String theme, String message) {
        Message entity = new Message();
        entity.setDateTime(new LocalDateTime());
        entity.setMessage(message);
        entity.setTheme(theme);
        Student student = studentRepository.findOne(sid);
        entity.setStudent(student);
        messageRepository.saveAndFlush(entity);
    }

    public void sendGroupMessage(String theme, String message) {

    }
}
