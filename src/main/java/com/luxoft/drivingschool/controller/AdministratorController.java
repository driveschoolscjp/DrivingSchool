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

        studentService.save(student);

        return "registrationSuccess";
    }


    @RequestMapping(value = "edit", method = RequestMethod.GET)
    public String editStudent(Model model, Student student) {

        student = studentService.findOne(10L);

        model.addAttribute("student", student);
        model.addAttribute("groups", groupService.findAll());
        model.addAttribute("instructors", teacherService.findAll());

        return "student";
    }
}
