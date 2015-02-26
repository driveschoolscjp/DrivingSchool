package com.luxoft.DrivingSchool.DAO;

import com.luxoft.DrivingSchool.model.Group;

import java.util.List;

public interface GroupDAO extends GenericDAO<Group> {

    List<Group> findByName(String name);
}
