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
        List<Schedule> l = scheduleRepository.findByInstructorId(id);
        return l;
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
            theme = "������ �������";
            message = "������������, " + student.getFirstname() + " " + student.getLastname() + ". �������� ���, ��� ��� �������� �������" +
                        " �� ��������, ������� ������ ���� ���� " + deleted.getStartInterval();
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
                    theme = "��� ��������� �������";
                    message = "������������, " + student.getFirstname() + " " + student.getLastname() + ". ���� ��������, ��� ��� ��������� �������" +
                        " �� �������� �� " + start + ". ��� ���������� - " + instructor.getLastname() + " " + instructor.getFirstname() +
                    " " + instructor.getPatronymic() + ".";
                } else {
                    theme = "��������� ���������� �������";
                    message = "������������, " + student.getFirstname() + " " +student.getLastname() + ". �������� ���, ��� �������� ����������" +
                            " ������ ������� �� ��������. ������ ��� �������� " + start + " � ���������� " + end + ". ��� ���������� - " +
                            instructor.getLastname() + " " + instructor.getFirstname() + " " + instructor.getPatronymic() + ".";
                }
                messageService.sendMessage(student.getId(), theme, message, isemail);
            }
            return id;
        }
        return 0;
    }
}
