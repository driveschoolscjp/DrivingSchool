package com.luxoft.DrivingSchool;

import com.luxoft.DrivingSchool.configuration.RootConfig;
import com.luxoft.DrivingSchool.model.Schedule;
import com.luxoft.DrivingSchool.model.Student;
import com.luxoft.DrivingSchool.model.Teacher;
import com.luxoft.DrivingSchool.model.enums.Gender;
import com.luxoft.DrivingSchool.service.BaseService;
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
        student.setName("Мирон");
        student.setGender(Gender.MALE);
        studentService.create(student);

        BaseService teacherService = (BaseService)context.getBean("teacherService");
        Teacher teacher = new Teacher();
        teacher.setName("Тичер");
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