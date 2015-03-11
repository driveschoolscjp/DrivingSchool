package com.luxoft.drivingschool.service;

import com.luxoft.drivingschool.model.Group;
import com.luxoft.drivingschool.repository.GroupRepository;
import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class GroupService {

    @Autowired
    private GroupRepository groupRepository;

    public Group findOne(long id) {
        return groupRepository.findOne(id);
    }

    public List<Group> findAll(){
        return groupRepository.findAll();
    }

    public Group findById(long id) {
        return groupRepository.getOne(id);
    }

    @Transactional
    public Group save(Group group){
        return groupRepository.save(group);
    }

    public List<Group> findByTeacherId(long id) {
        return groupRepository.findByTeacherId(id);
    }

    public List<Group> findFutureGroups() {
        return groupRepository.findByStartDateAfter(new LocalDate());
    }
}
