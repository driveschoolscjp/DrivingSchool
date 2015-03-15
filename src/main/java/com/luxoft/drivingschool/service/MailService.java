package com.luxoft.drivingschool.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class MailService {
    @Autowired
    private JavaMailSender mailSender;

    private List<SimpleMailMessage> mails;

    @Async
    public void sendMail(String to, String subject, String body) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject(subject);
        message.setText(body);
        mailSender.send(message);
    }

    public void addMail(String to, String subject, String body) {
        if (mails == null) {
            mails = new ArrayList<SimpleMailMessage>();
        }
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject(subject);
        message.setText(body);
        mails.add(message);
    }

    @Async
    public void sendMails() {
        if (mails == null || mails.size() == 0) {
            return;
        }
        SimpleMailMessage[] array = new SimpleMailMessage[mails.size()];
        mailSender.send(mails.toArray(array));
        mails.clear();
    }
}
