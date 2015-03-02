package com.luxoft.drivingschool.service;

import com.luxoft.drivingschool.model.Schedule;
import com.luxoft.drivingschool.repository.ScheduleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public class ScheduleService {
    @Autowired
    private ScheduleRepository scheduleRepository;

    @Transactional
    public List<Schedule> findAllAppointmentsByTeacherId(long id) {
        return scheduleRepository.findAllByTeacherIdAndStudentIdNotNull(id);
    }

    @Transactional
    public List<Schedule> findFreeTimeByTeacherId(long id) {
        return scheduleRepository.findAllByTeacherIdAndStudentIdIsNull(id);
    }
}
