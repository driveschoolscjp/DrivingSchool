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
    public List<Schedule> findAllAppointmentsByTeacherId(long teacher_id) {
        return scheduleRepository.findAllByTeacherId(teacher_id);
    }
}
