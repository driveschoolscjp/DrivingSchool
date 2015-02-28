package com.luxoft.DrivingSchool.service;

import com.luxoft.DrivingSchool.repository.GroupRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GroupService {

    @Autowired
    GroupRepository groupRepository;
}
