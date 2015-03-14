package com.luxoft.drivingschool.service;

import com.luxoft.drivingschool.model.Message;
import com.luxoft.drivingschool.model.Student;
import com.luxoft.drivingschool.repository.MessageRepository;
import com.luxoft.drivingschool.repository.StudentRepository;
import org.joda.time.LocalDateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

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
        entity.setId(0L);
        entity.setOld(false);
        messageRepository.saveAndFlush(entity);
    }

    @Transactional
    public void sendGroupMessage(Long gid, String theme, String message) {
        List<Message> entitites = new ArrayList<Message>();
        List<Student> students = studentRepository.findByGroupId(gid);
        for (Student student: students) {
            Message entity = new Message();
            entity.setDateTime(new LocalDateTime());
            entity.setMessage(message);
            entity.setTheme(theme);
            entity.setId(0L);
            entity.setOld(false);
            entity.setStudent(student);
            entitites.add(entity);
        }
        messageRepository.save(entitites);
    }

    public List<Message> getMessages(Long message_id, Long student_id, Long rows) {
        return messageRepository.findFirst10MessageByStudentIdAndIdGreaterThanOrderByDateTimeDesc(student_id, message_id);
    }

    public Message getMessage(Long message_id) {
        return messageRepository.findOne(message_id);
    }

    @Transactional
    public Message markMessageAsOld(Long message_id) {
        Message message =  messageRepository.findOne(message_id);
        message.setOld(true);
        return messageRepository.saveAndFlush(message);
    }

    public Long getNewCount(Long id) {
        return messageRepository.getCountOfNewMessages(id);
    }

    public Long getAllCount(Long id) {
        return messageRepository.countByStudentId(id);
    }

}
