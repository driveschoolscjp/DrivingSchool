package com.luxoft.drivingschool.controller;

import com.luxoft.drivingschool.model.Schedule;
import com.luxoft.drivingschool.model.Student;
import com.luxoft.drivingschool.model.Teacher;
import com.luxoft.drivingschool.service.ScheduleService;
import com.luxoft.drivingschool.service.StudentService;
import com.luxoft.drivingschool.service.TeacherService;
import com.luxoft.drivingschool.service.enums.LessonAction;
import org.joda.time.LocalDateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/scheduler")
public class ScheduleController {
    private static final String GET_ALL_APPOINTMENTS_MAPPING_PATH = "getallappointments/{id}";
    private static final String GET_ALL_SCHEDULES_MAPPING_PATH = "getallschedules/{id}";
    private static final String LESSON_ACTION_MAPPING_PATH = "lesson/action/{action}";
    private static final String GET_ALL_APPOINTMENTS_BETWEEN_MAPPING_PATH = "lesson/between";
    private static final String GET_ALL_APPOINTMENTS_SOME_WEEK_MAPPING_PATH = "lesson/week";
    private static final String GET_ALL_APPOINTMENTS_SOME_MONTH_MAPPING_PATH = "lesson/month";
    private static final String DELETE_INTERVAL_MAPPING_PATH = "lesson/action/delete/{id}";
    private static final String SEARCH_STUDENTS_LIKE_MAPPING_PATH = "search/student/{like}";
    private static final String SEARCH_TEACHERS_LIKE_MAPPING_PATH = "search/teacher/{like}";

    private Map<String, Object> result = new HashMap<String, Object>();

    @Autowired
    private ScheduleService scheduleService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private TeacherService teacherService;

    @RequestMapping(value = DELETE_INTERVAL_MAPPING_PATH, method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public void deleteInterval(@PathVariable long id) {
        scheduleService.deleteIntervalById(id);
    }

    @RequestMapping(value = GET_ALL_APPOINTMENTS_MAPPING_PATH, method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public List<Schedule> getAllAppointments(@PathVariable long id) {
        return scheduleService.findAllSchedulesByInstructorId(id);
    }

    @RequestMapping(value = SEARCH_STUDENTS_LIKE_MAPPING_PATH, method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public List<Student> getStudentsByQuery(@PathVariable String like) {
        return studentService.findAllStudentsLike(like);
    }

    @RequestMapping(value = SEARCH_TEACHERS_LIKE_MAPPING_PATH, method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public List<Teacher> getTeachersByQuery(@PathVariable String like) {
        return teacherService.findAllTeachersLike(like);
    }

    @RequestMapping(value = GET_ALL_SCHEDULES_MAPPING_PATH, method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public List<Schedule> getAllSchedules(@PathVariable long id) {
        return scheduleService.findAllSchedulesByInstructorId(id);
    }

    @RequestMapping(value = GET_ALL_APPOINTMENTS_BETWEEN_MAPPING_PATH, method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public List<Schedule> getAllAppointmentsBetween(@RequestBody Map<String, Object> map) {
        Long iid = new Long(map.get("instructor_id").toString());
        LocalDateTime sd = new LocalDateTime(map.get("start"));
        LocalDateTime ed = new LocalDateTime(map.get("end"));
        return scheduleService.findInstructorAppointmentsBetween(iid, sd, ed);
    }

    @RequestMapping(value = GET_ALL_APPOINTMENTS_SOME_WEEK_MAPPING_PATH, method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public List<Schedule> getAllAppointmentsSomeWeek(@RequestBody Map<String, Object> map) {
        Long iid = new Long(map.get("instructor_id").toString());
        LocalDateTime day = new LocalDateTime(map.get("day"));
        LocalDateTime weekStart = day.dayOfWeek().withMinimumValue();
        LocalDateTime weekEnd = day.dayOfWeek().withMaximumValue();
        return scheduleService.findInstructorAppointmentsBetween(iid, weekStart, weekEnd);
    }

    @RequestMapping(value = GET_ALL_APPOINTMENTS_SOME_MONTH_MAPPING_PATH, method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public List<Schedule> getAllAppointmentsSomeMonth(@RequestBody Map<String, Object> map) {
        Long iid = new Long(map.get("instructor_id").toString());
        LocalDateTime day = new LocalDateTime(map.get("day"));
        LocalDateTime monthStart = day.dayOfMonth().withMinimumValue();
        LocalDateTime monthEnd = day.dayOfMonth().withMaximumValue();
        return scheduleService.findInstructorAppointmentsBetween(iid, monthStart, monthEnd);
    }

    @RequestMapping(value = LESSON_ACTION_MAPPING_PATH, method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public Map<String, Object> lessonAction(@RequestBody Map<String, Object> map, @PathVariable String action) {
        Long eid = new Long(map.get("id").toString());
        Long iid = new Long(map.get("instructor_id").toString());
        if (iid == -1) {
            iid = null;
        }
        Long sid = new Long(map.get("student_id").toString());
        LocalDateTime sd = new LocalDateTime(map.get("start"));
        LocalDateTime ed = new LocalDateTime(map.get("end"));
        long id = 0;
        if (action.equals("take")) {
            id = scheduleService.lessonAction(eid, iid, sid, sd, ed, LessonAction.TAKE);
        } else if (action.equals("move")) {
            id = scheduleService.lessonAction(eid, iid, sid, sd, ed, LessonAction.CHANGE);
        }
        result.put("id", id);
        return result;
    }
}
