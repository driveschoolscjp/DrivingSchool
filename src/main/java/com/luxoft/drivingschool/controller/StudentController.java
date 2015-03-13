package com.luxoft.drivingschool.controller;

import com.luxoft.drivingschool.model.Student;
import com.luxoft.drivingschool.service.RoadsignService;
import com.luxoft.drivingschool.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    StudentService studentService;
    @Autowired
    RoadsignService roadsignService;

    @RequestMapping(value = "/news", method = RequestMethod.GET)
    public String news() {
        return "/student/news";
    }

    @RequestMapping(value = "/mygroup", method = RequestMethod.GET)
    public String mygroup(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Student student = studentService.findByLogin(auth.getName());

        model.addAttribute("me", student);
        model.addAttribute("students", studentService.findByGroupId(student.getGroup().getId()));

        return "/student/mygroup";
    }

    @RequestMapping(value = "/roadsigns", method = RequestMethod.GET)
    public String roadsigns(Model model) {

        model.addAttribute("roadsigns", roadsignService.findRandomRoadsigns());
        return "/student/roadsigns";
    }
}
