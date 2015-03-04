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
public class AdminGroupController {
    @Autowired
    private GroupService groupService;

    @RequestMapping(value = "getall", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public List<Group> getGroups() {
        return groupService.findAll();
    }

    @RequestMapping(value = "edit/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public Group editGroup(@PathVariable String id) {
        return groupService.findById(Long.parseLong(id));
    }
}
