package com.luxoft.drivingschool.repository;

import com.luxoft.drivingschool.model.Group;
import org.joda.time.LocalDate;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface GroupRepository extends JpaRepository<Group, Long> {
    List<Group> findByTeacherId(long teacherId);

    List<Group> findByStartDateAfter(LocalDate date);
}
