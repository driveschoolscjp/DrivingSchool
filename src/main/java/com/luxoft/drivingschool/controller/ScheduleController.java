package com.luxoft.drivingschool.controller;

import com.luxoft.drivingschool.model.Schedule;
import com.luxoft.drivingschool.service.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/scheduler")
public class ScheduleController {

    private static final String GETALLAPPOINTMENTS_MAPPING_PATH = "getallappointments/{id}";

    @Autowired
    private ScheduleService scheduleService;

    @RequestMapping(value = GETALLAPPOINTMENTS_MAPPING_PATH, method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public List<Schedule> getAllAppointments(@PathVariable long id) {
        return scheduleService.findAllAppointmentsByInstructorId(id);
    }
}
