package com.luxoft.drivingschool;

import com.luxoft.drivingschool.configuration.RootConfig;
import com.luxoft.drivingschool.model.Schedule;
import com.luxoft.drivingschool.model.Student;
import com.luxoft.drivingschool.model.Teacher;
import com.luxoft.drivingschool.model.enums.Gender;
import com.luxoft.drivingschool.service.BaseService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.util.Date;

/**
 * Created by Aleksei Chumakov on 28.02.2015.
 */
public class Main {

    public static void main(String[] args) {
        ApplicationContext context = new AnnotationConfigApplicationContext(RootConfig.class);
        BaseService studentService = (BaseService)context.getBean("studentService");
        Student student = new Student();
        student.setFirstName("Мирон");
        student.setGender(Gender.MALE);
        studentService.create(student);

        BaseService teacherService = (BaseService)context.getBean("teacherService");
        Teacher teacher = new Teacher();
        teacher.setFirstName("Тичер");
        teacher.setGender(Gender.MALE);
        teacherService.create(teacher);

        BaseService bs = (BaseService)context.getBean("scheduleService");
        Schedule b = new Schedule();
        b.setStudent(student);
        b.setTeacher(teacher);
        b.setDay(new Date());
        bs.create(b);
        studentService.delete(20);
        BaseService scheduleService = (BaseService)context.getBean("scheduleService");
        scheduleService.delete(25);
    }

}