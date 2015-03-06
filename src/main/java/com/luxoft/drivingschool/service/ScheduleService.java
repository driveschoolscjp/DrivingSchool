package com.luxoft.drivingschool.service;

import com.luxoft.drivingschool.model.Schedule;
import com.luxoft.drivingschool.repository.ScheduleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class ScheduleService {
    @Autowired
    private ScheduleRepository scheduleRepository;

    public List<Schedule> findAllAppointmentsByInstructorId(long id) {
        return scheduleRepository.findAllByInstructorIdAndStudentIdNotNull(id);
    }

    public List<Schedule> findFreeTimeByInstructorId(long id) {
        return scheduleRepository.findAllByInstructorIdAndStudentIdIsNull(id);
    }
}
