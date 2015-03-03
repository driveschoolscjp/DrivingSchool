package com.luxoft.drivingschool.service;

import com.luxoft.drivingschool.model.Group;
import com.luxoft.drivingschool.repository.GroupRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class GroupService {

    @Autowired
    private GroupRepository groupRepository;

    public List<Group> findByName(String name){
        return groupRepository.findByName(name);
    }

    public List<Group> findAll(){
        return groupRepository.findAll();
    }

}
