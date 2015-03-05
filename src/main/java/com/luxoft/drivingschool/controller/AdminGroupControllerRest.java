package com.luxoft.drivingschool.controller;

import com.luxoft.drivingschool.model.Group;
import com.luxoft.drivingschool.service.GroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/admin/group")
public class AdminGroupControllerRest {

    private static final String GETALL_ATTRIBUTE="getall";
    private static final String EDIT_ID_JSON__ATTRIBUTE="edit/{id}";

    @Autowired
    private GroupService groupService;

    @RequestMapping(value = GETALL_ATTRIBUTE, method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public List<Group> getGroups() {
        return groupService.findAll();
    }

    @RequestMapping(value = EDIT_ID_JSON__ATTRIBUTE, method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public Group editGroup(@PathVariable String id) {
        return groupService.findById(Long.parseLong(id));
    }
}
