package com.luxoft.drivingschool.controller;

import com.luxoft.drivingschool.model.Message;
import com.luxoft.drivingschool.model.Student;
import com.luxoft.drivingschool.model.enums.UserRoleEnum;
import com.luxoft.drivingschool.service.MessageService;
import com.luxoft.drivingschool.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class MessageController {

    @Autowired
    private MessageService messageService;
    @Autowired
    private StudentService studentService;

    @RequestMapping(value = "/admin/message/send", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.APPLICATION_JSON_VALUE)
    public Map<String, Object> sendMessage(@RequestBody Map<String, Object> map) {
        boolean isGroupMessage = (Boolean)map.get("isGroupMessage");
        String theme = (String)map.get("theme");
        String message = (String)map.get("message");
        Long id = Long.parseLong(map.get("current_id").toString());
        if (isGroupMessage) {
            messageService.sendGroupMessage(id, theme, message);
        } else {
            messageService.sendMessage(id, theme, message);
        }
        Map<String, Object> result = new HashMap<String, Object>();
        return result;
    }

    @RequestMapping(value = "/student/message/newamount", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.APPLICATION_JSON_VALUE)
         public Map<String, Object> amount(@RequestBody Map<String, Object> map) {
        Student student = getCurrentStudent();
        if (student == null) {
            //throw new ServiceException();
            return null;
        }
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("amount", messageService.getNewCount(student.getId()));
        return result;
    }

    @RequestMapping(value = "/student/message/allamount", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.APPLICATION_JSON_VALUE)
    public Map<String, Object> allamount(@RequestBody Map<String, Object> map) {
        Student student = getCurrentStudent();
        if (student == null) {
            //throw new ServiceException();
            return null;
        }
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("amount", messageService.getAllCount(student.getId()));
        return result;
    }

    @RequestMapping(value = "/student/message/getmessages", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE,
        consumes = MediaType.APPLICATION_JSON_VALUE)
    public Map<String, Object> getMessages(@RequestBody Map<String, Object> map) {
        Student student = getCurrentStudent();
        Long message_id = Long.parseLong(map.get("message_id").toString());
        Long rows = Long.parseLong(map.get("rows").toString());
        Map<String, Object> result = new HashMap<String, Object>();
        if ((map.get("back").toString()).equals("true")) {
            result.put("messages", messageService.getMessages(message_id, student.getId(), rows));
        } else {
            result.put("messages", messageService.getMessagesForward(message_id, student.getId(), rows));
        }
        result.put("all", messageService.getAllCount(student.getId()));
        return result;
    }

    @RequestMapping(value = "/student/message/getstartmessages", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.APPLICATION_JSON_VALUE)
    public Map<String, Object> getStartMessages(@RequestBody Map<String, Object> map) {
        Student student = getCurrentStudent();
        Long rows = Long.parseLong(map.get("rows").toString());
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("messages", messageService.getStartMessages(student.getId(), rows));
        result.put("all", messageService.getAllCount(student.getId()));
        return result;
    }

    @RequestMapping(value = "/student/message/getmessage", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.APPLICATION_JSON_VALUE)
    public Message getMessage(@RequestBody Map<String, Object> map) {
        Student student = getCurrentStudent();
        Long message_id = Long.parseLong(map.get("message_id").toString());
        Message message = messageService.getMessage(message_id);
        if (student.getId() != message.getStudent().getId()) {
            //throw new ServiceException();
            return null;
        }
        return message;
    }

    @RequestMapping(value = "/student/message/getmessagesequal", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.APPLICATION_JSON_VALUE)
    public Map<String, Object> getMessagesEqual(@RequestBody Map<String, Object> map) {
        Student student = getCurrentStudent();
        Long message_id = Long.parseLong(map.get("message_id").toString());
        Long rows = Long.parseLong(map.get("rows").toString());
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("messages", messageService.getMessagesEqual(message_id, student.getId(), rows));
        result.put("all", messageService.getAllCount(student.getId()));
        return result;
    }

    @RequestMapping(value = "/student/message/setold", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.APPLICATION_JSON_VALUE)
    public Message setOld(@RequestBody Map<String, Object> map) {
        Student student = getCurrentStudent();
        Long message_id = Long.parseLong(map.get("message_id").toString());
        Message message = messageService.getMessage(message_id);
        if (student.getId() != message.getStudent().getId()) {
            //throw new ServiceException();
            return null;
        }
        return messageService.markMessageAsOld(message_id);
    }

    @RequestMapping(value = "/student/message/deletemessages", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.APPLICATION_JSON_VALUE)
    public Map<String, Object> deleteMessages(@RequestBody List<Long> list) {
        messageService.deleteMessages(list);
        Map<String, Object> map = new HashMap<String, Object>();
        return map;
    }

    private Student getCurrentStudent() {
        Student student = null;
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth.getAuthorities().contains(new SimpleGrantedAuthority(UserRoleEnum.ROLE_STUDENT.name()))) {
            student = studentService.findByLogin(auth.getName());
        }
        return student;
    }
}


