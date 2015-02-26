package com.luxoft.DrivingSchool.DAO;

import com.luxoft.DrivingSchool.model.Group;
import com.luxoft.DrivingSchool.model.Student;

import java.util.List;

public interface StudentDAO extends GenericDAO<Student> {

    List<Student> findByName(String name);

    List<Student> findByGroup(Group group);
}
