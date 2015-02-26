package com.luxoft.DrivingSchool.DAO;

import com.luxoft.DrivingSchool.model.Available;

import java.util.Date;
import java.util.List;

public interface AvailableDAO extends GenericDAO<Available> {

    List<Available> findByTeacherAndDay(String teacher, Date day);
}
