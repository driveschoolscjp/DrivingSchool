package com.luxoft.drivingschool.repository;

import com.luxoft.drivingschool.model.Schedule;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ScheduleRepository extends JpaRepository<Schedule, Long> {
    List<Schedule> findAllByTeacherIdAndStudentIdNotNull(long id);
    List<Schedule> findAllByTeacherIdAndStudentIdIsNull(long id);
}
