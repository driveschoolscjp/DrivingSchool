package com.luxoft.drivingschool.service;

import com.luxoft.drivingschool.model.Group;
import com.luxoft.drivingschool.repository.GroupRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class GroupService {
    @Autowired
    GroupRepository groupRepository;

    @Transactional
    public List<Group> findAllByTeacherIdAndGroupId(long teacher_id, long group_id) {
        return groupRepository.findAllByTeacherIdAndGroupId(teacher_id, group_id);
    }
}
