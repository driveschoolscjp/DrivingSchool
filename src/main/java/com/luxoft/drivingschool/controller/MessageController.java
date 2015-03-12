package com.luxoft.drivingschool.controller;

import com.luxoft.drivingschool.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/admin/message")
public class MessageController {

    @Autowired
    private MessageService messageService;

    @RequestMapping(value = "send", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.APPLICATION_JSON_VALUE)
    public void sendMessage(@RequestBody Map<String, Object> map) {
        boolean isGroupMessage = (Boolean)map.get("isGroupMessage");
        String theme = (String)map.get("theme");
        String message = (String)map.get("message");
        Long sid = (Long)map.get("student_id");
        if (isGroupMessage) {
            messageService.sendGroupMessage(theme, message);
        } else {
            messageService.sendMessage(sid, theme, message);
        }
    }
}
