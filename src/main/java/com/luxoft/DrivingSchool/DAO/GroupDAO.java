package com.luxoft.DrivingSchool.DAO;

import com.luxoft.DrivingSchool.model.Group;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface GroupDAO extends JpaRepository<Group, Long> {

    List<Group> findByName(String name);
}
