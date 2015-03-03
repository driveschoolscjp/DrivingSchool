package com.luxoft.drivingschool.controller;

import com.luxoft.drivingschool.model.Student;
import com.luxoft.drivingschool.service.GroupService;
import com.luxoft.drivingschool.service.StudentService;
import com.luxoft.drivingschool.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by SCJP on 26.02.2015.
 */
@Controller
public class AdministratorController {

    @Autowired
    StudentService studentService;

    @Autowired
    TeacherService teacherService;

    @Autowired
    GroupService groupService;

    @RequestMapping(value = "add", method = RequestMethod.GET)
    public String viewRegistration(Model model) {

        model.addAttribute("student", new Student());
        model.addAttribute("groups", groupService.findAll());
        model.addAttribute("instructors", teacherService.findAll());

        return "student";
    }

    @RequestMapping(value = "add", method = RequestMethod.POST)
    public String processRegistration(@ModelAttribute("student") Student student) {

//        long groupId = commandForm.getGroup();
//        long teacherId = commandForm.getTeacher();

//        student.setGender(genderForm);

        studentService.save(student);

//        for testing purpose:
//        System.out.println("id: " + student.getId());
//        System.out.println("login: " + student.getLogin());
//        System.out.println("password: " + student.getPassword());
//        System.out.println("email: " + student.getEmail());
//        System.out.println("Name: " + student.getFirstname());
//        System.out.println("Surname: " + student.getLastname());
//        System.out.println("Patronymic: " + student.getPatronymic());
//        System.out.println("INN: " + student.getInn());
//        System.out.println("Passport: " + student.getPassport());
//        System.out.println("Number of ride: " + student.getRideNumber());
//        System.out.println("Instructor: " + student.getInstructor().toString());
//        System.out.println("Group: " + student.getGroup().toString());
//        System.out.println("Gender: " + student.getGender().toString());
//        System.out.println("Birthday: " + student.getBirthday().toString());

        return "registrationSuccess";
    }
}
