package com.luxoft.drivingschool.service;

import com.luxoft.drivingschool.model.Schedule;
import com.luxoft.drivingschool.model.Student;
import com.luxoft.drivingschool.model.Teacher;
import com.luxoft.drivingschool.model.enums.UserRoleEnum;
import com.luxoft.drivingschool.repository.ScheduleRepository;
import com.luxoft.drivingschool.repository.StudentRepository;
import com.luxoft.drivingschool.repository.TeacherRepository;
import com.luxoft.drivingschool.service.enums.LessonAction;
import org.joda.time.LocalDateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class ScheduleService {

    private final DateTimeFormatter fmt = DateTimeFormat.forPattern("MM/dd/yyyy HH:mm");
    @Autowired
    private ScheduleRepository scheduleRepository;
    @Autowired
    private TeacherRepository teacherRepository;
    @Autowired
    private StudentRepository studentRepository;
    @Autowired
    private MessageService messageService;

    public List<Schedule> findAllAppointmentsByInstructorId(long id) {
        return scheduleRepository.findByInstructorIdAndStudentIdNotNull(id);
    }

    public List<Schedule> findFreeTimeByInstructorId(long id) {
        return scheduleRepository.findByInstructorIdAndStudentIdIsNull(id);
    }

    public List<Schedule> findAllSchedulesByInstructorId(long id) {
        return scheduleRepository.findByInstructorId(id);
    }

    public List<Schedule> findInstructorAppointmentsBetween(long id, LocalDateTime startDate, LocalDateTime finishDate) {
        return scheduleRepository.findByInstructorIdAndStudentIdNotNullAndStartIntervalBetween(id, startDate, finishDate);
    }

    @Transactional
    public void deleteIntervalById(long id, boolean isemail) {
        Schedule deleted = scheduleRepository.findOne(id);
        Student student = deleted.getStudent();
        scheduleRepository.delete(deleted);
        scheduleRepository.flush();

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if ( student != null && auth.getAuthorities().contains(new SimpleGrantedAuthority(UserRoleEnum.ROLE_ADMIN.name()))) {
            String theme;
            String message;
            theme = "Отмена занятия";


            message = "Здравствуйте, " + student.getFirstname() + " " + student.getLastname() + ". Сообщаем Вам об отмене занятия" +
                        " по вождению, которое должно было быть " + (deleted.getStartInterval()).toString(fmt);
            messageService.sendMessage(student.getId(), theme, message, isemail);
        }
    }

    @Transactional
    public long lessonAction(long eventId, long teacherId, Long studentId, LocalDateTime start, LocalDateTime end,
                             LessonAction action, boolean isemail) {
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
            Student student = null;
            if (studentId != null) {
                 student = studentRepository.findOne(studentId);
            }
            Teacher instructor = teacherRepository.findOne(teacherId);
            lesson.setId(eventId);
            lesson.setStudent(student);
            lesson.setInstructor(instructor);
            lesson.setStartInterval(start);
            lesson.setFinishInterval(end);
            long id = scheduleRepository.saveAndFlush(lesson).getId();
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            if (student != null && auth.getAuthorities().contains(new SimpleGrantedAuthority(UserRoleEnum.ROLE_ADMIN.name()))) {
                String theme;
                String message;
                if (action == LessonAction.TAKE) {
                    theme = "Вам назначено занятие";
                    message = "Здравствуйте, " + student.getFirstname() + " " + student.getLastname() + ". Рады сообщеть, что Вам назначено занятие" +
                        " по вождению на " + start.toString(fmt) + ". Ваш инструктор - " + instructor.getLastname() + " " + instructor.getFirstname() +
                    " " + instructor.getPatronymic() + ".";
                } else {
                    theme = "Изменение расписания";
                    message = "Здравствуйте, " + student.getFirstname() + " " +student.getLastname() + ". Сообщаем Вам, что перенесено" +
                            " ваше занятие по вождению. Теперь оно начнется " + start.toString(fmt) + " и закончится " + end.toString(fmt) + ". Ваш инструктор - " +
                            instructor.getLastname() + " " + instructor.getFirstname() + " " + instructor.getPatronymic() + ".";
                }
                messageService.sendMessage(student.getId(), theme, message, isemail);
            }
            return id;
        }
        return 0;
    }
}
