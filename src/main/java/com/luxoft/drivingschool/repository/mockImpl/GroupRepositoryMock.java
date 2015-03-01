package com.luxoft.drivingschool.repository.mockImpl;

import com.luxoft.drivingschool.model.Group;
import com.luxoft.drivingschool.model.Teacher;
import com.luxoft.drivingschool.repository.GroupRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Svetlana Lawrentyeva on 01.03.15.
 */

@Service("groupRepository")
public class GroupRepositoryMock {

    Group group;
    List<Group>groups = new ArrayList<>();
    @Autowired TeacherRepositoryMock teacherRepository;

    @PostConstruct
    public void init(){
        group = initGroup("group1", new Date(2015, 02, 01), new Date(2015, 04, 01), teacherRepository.findOne(1L));
        groups.add(group);
    }

    private Group initGroup(String name, Date date_start, Date date_fin, Teacher teacher){
        Group g = new Group();
        g.setName(name);
        g.setStartDate(date_start);
        g.setFinishDate(date_fin);
        g.setTeacher(teacher);

        return g;
    }

    public Group findOne(Long aLong) {
        return group;
    }



    public List<Group> findByFirstname(String firstname) {
        return groups;
    }
}
