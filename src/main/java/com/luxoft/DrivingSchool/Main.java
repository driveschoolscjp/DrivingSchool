package com.luxoft.DrivingSchool;

import com.luxoft.DrivingSchool.DAO.CarDAO;
import com.luxoft.DrivingSchool.DAO.GroupDAO;
import com.luxoft.DrivingSchool.DAO.StudentDAO;
import com.luxoft.DrivingSchool.DAO.TeacherDAO;
import com.luxoft.DrivingSchool.model.*;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.util.GregorianCalendar;

public class Main {


    public static void main(String[] args) {

        ApplicationContext context = new AnnotationConfigApplicationContext(com.luxoft.DrivingSchool.configuration.RootConfig.class);

        Teacher gena = new Teacher();
        gena.setFirstname("Gena");
        gena.setEmail("ge@na.com");
        gena.setGender(Gender.MALE);

        Teacher sasha = new Teacher();
        sasha.setFirstname("sasha");
        sasha.setGender(Gender.FEMALE);
        sasha.setEmail("sa@sha.com");

        Group group1 = new Group();
        group1.setName("First group");
        GregorianCalendar date = new GregorianCalendar();
        group1.setStartDate(date.getTime());
        date.add(GregorianCalendar.MONTH, 3);
        group1.setFinishDate(date.getTime());
        group1.setTeacher(gena);

        Student vasya = new Student();
        vasya.setFirstname("Vasiliy");
        vasya.setLastname("Pupkin");
        vasya.setPatronymic("Viktorovich");
        vasya.setRideNumber(25);
        vasya.setGroup(group1);
        vasya.setInstructor(sasha);

        Car lambo = new Car();
        lambo.setInstructor(sasha);
        lambo.setBrand("Lamborgini");
        lambo.setModel("Diablo");
        lambo.setEngineSize(8.5f);
        lambo.setPricePerHour(750.5f);
        lambo.setTransmission(Transmission.MANUAL);
        lambo.setInstructor(sasha);

        TeacherDAO teacherDAO = context.getBean(TeacherDAO.class);
        GroupDAO groupDAO = context.getBean(GroupDAO.class);
        StudentDAO studentDAO = context.getBean(StudentDAO.class);
        CarDAO carDAO = context.getBean(CarDAO.class);

        teacherDAO.save(gena);
        teacherDAO.save(sasha);
        groupDAO.save(group1);
        vasya = studentDAO.save(vasya);
        carDAO.save(lambo);

        Student vasyaTest = studentDAO.findByFirstname("Vasiliy");
        System.out.println(vasya.equals(vasyaTest));

    }
}
