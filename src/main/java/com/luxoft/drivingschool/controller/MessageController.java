package com.luxoft.drivingschool.controller;

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
        Student student = null;
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth.getAuthorities().contains(new SimpleGrantedAuthority(UserRoleEnum.ROLE_STUDENT.name()))) {
            student = studentService.findByLogin(auth.getName());
        }
        if (student == null) {
            //throw new ServiceException();
            return null;
        }
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("amount", messageService.getNewCount(student.getId()));
        return result;
    }
}
