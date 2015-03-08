package com.luxoft.drivingschool.service;

import com.luxoft.drivingschool.model.Schedule;
import com.luxoft.drivingschool.model.Student;
import com.luxoft.drivingschool.model.Teacher;
import com.luxoft.drivingschool.repository.ScheduleRepository;
import com.luxoft.drivingschool.repository.StudentRepository;
import com.luxoft.drivingschool.repository.TeacherRepository;
import com.luxoft.drivingschool.service.enums.LessonAction;
import org.joda.time.LocalDateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class ScheduleService {
    @Autowired
    private ScheduleRepository scheduleRepository;
    @Autowired
    private TeacherRepository teacherRepository;
    @Autowired
    private StudentRepository studentRepository;

    public List<Schedule> findAllAppointmentsByInstructorId(long id) {
        return scheduleRepository.findByInstructorIdAndStudentIdNotNull(id);
    }

    public List<Schedule> findFreeTimeByInstructorId(long id) {
        return scheduleRepository.findByInstructorIdAndStudentIdIsNull(id);
    }

    public List<Schedule> findInstructorAppointmentsBetween(long id, LocalDateTime startDate, LocalDateTime finishDate) {
        return scheduleRepository.findByInstructorIdAndStudentIdNotNullAndStartIntervalBetween(id, startDate, finishDate);
    }

    @Transactional
    public long lessonAction(long eventId, long teacherId, long studentId, LocalDateTime start, LocalDateTime end, LessonAction action) {
        if (start.getYear() != end.getYear() || start.getDayOfYear() != end.getDayOfYear() || start.isAfter(end)) {
           // throw new ServiceException();
            return 0;
        }
        List<Schedule> intersectList = null;
        if (action == LessonAction.TAKE) {
            intersectList = scheduleRepository.findIntersectByInstructorIdAndInterval(teacherId, start, end);
        } else if (action == LessonAction.CHANGE) {
            intersectList = scheduleRepository.findIntersectByInstructorIdAndIntervalExcludeEvent(teacherId, start, end, eventId);
        } else {
            // throw new ServiceException();
        }
        if (intersectList.size() == 0) {
            Schedule lesson = new Schedule();
            Student student = studentRepository.findOne(studentId);
            Teacher instructor = teacherRepository.findOne(teacherId);
            lesson.setId(eventId);
            lesson.setStudent(student);
            lesson.setInstructor(instructor);
            lesson.setStartInterval(start);
            lesson.setFinishInterval(end);
            return scheduleRepository.saveAndFlush(lesson).getId();
        }
        return 0;
    }
}
