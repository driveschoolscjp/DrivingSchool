package com.luxoft.DrivingSchool.repository;

import com.luxoft.DrivingSchool.model.Group;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface GroupRepository extends JpaRepository<Group, Long> {

    List<Group> findByName(String name);
}
