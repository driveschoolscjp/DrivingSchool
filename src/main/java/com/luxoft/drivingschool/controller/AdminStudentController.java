package com.luxoft.drivingschool.controller;

import com.luxoft.drivingschool.model.Car;
import com.luxoft.drivingschool.model.Registration;
import com.luxoft.drivingschool.model.Student;
import com.luxoft.drivingschool.model.Teacher;
import com.luxoft.drivingschool.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@RequestMapping("/admin/student")
@Controller
public class AdminStudentController {

    @Autowired
    StudentService studentService;

    @Autowired
    TeacherService teacherService;

    @Autowired
    GroupService groupService;


    @Autowired
    private RegistrationService registrationService;

    // Поиск
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String showAllStudents(Model model) {

        model.addAttribute("students", studentService.findAll());
        model.addAttribute("groups", groupService.findAll());
        return "/admin/student/search";
    }

    // Поиск по параметрам
    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String findStudents(@RequestParam("id") long groupId, Model model) {

        model.addAttribute("students", studentService.findByGroupId(groupId));
        model.addAttribute("groups", groupService.findAll());
        return "/admin/student/search";
    }

    // Переход на форму сохранения
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String showRegistration(Model model) {

        model.addAttribute("student", new Student());
        model.addAttribute("groups", groupService.findAll());
        model.addAttribute("instructors", teacherService.findByCarIsNotNull());

        return "admin/student/edit";
    }

    // Сохранение и переход на форму просмотра
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String processRegistration(@ModelAttribute("student") Student student) {

        student = studentService.save(student);
        return "redirect:show?id=" + student.getId(); // На страничку просмотра
    }

    // Показ одного студента
    @RequestMapping(value = "/show", method = RequestMethod.GET)
    public String show(@RequestParam("id") long id, Model model) {

        model.addAttribute("student", studentService.findOne(id));
        return "admin/student/show";
    }

    // Редактирование одного студента
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(@RequestParam("id") long id, Model model) {

        model.addAttribute("student", studentService.findOne(id));
        model.addAttribute("groups", groupService.findAll());
        model.addAttribute("instructors", teacherService.findByCarIsNotNull());

        return "admin/student/edit";
    }

    // Переход на форму сохранения
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String showFilledRegistration(@RequestParam("id") long id, Model model) {


        Registration registration = registrationService.findOne(id);

        Student student = new Student();
        student.setInstructor(registration.getCar().getInstructor());
        student.setFirstname(registration.getFirstname());
        student.setLastname(registration.getLastname());
        student.setPatronymic(registration.getPatronymic());
        student.setEmail(registration.getEmail());
        student.setTel(registration.getTel());

        model.addAttribute("student", student);
        model.addAttribute("instructors", teacherService.findByCarIsNotNull());
        model.addAttribute("groups", groupService.findAll());

//переход на станицу регистрации студента
        return "admin/student/edit";
    }
}
