package com.luxoft.DrivingSchool.DAO;

import com.luxoft.DrivingSchool.model.Teacher;

import java.util.List;

public interface TeacherDAO extends GenericDAO<Teacher> {

    List<Teacher> findByName(String name);
}
