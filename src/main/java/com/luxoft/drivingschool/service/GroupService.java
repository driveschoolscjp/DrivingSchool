package com.luxoft.drivingschool.service;

import com.luxoft.drivingschool.model.Group;
import com.luxoft.drivingschool.repository.GroupRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GroupService {

    @Autowired
    GroupRepository groupRepository;

    public List<Group> findByName(String name){
        return groupRepository.findByName(name);
    }

    public List<Group> findAll(){
        return groupRepository.findAll();
    }
}
