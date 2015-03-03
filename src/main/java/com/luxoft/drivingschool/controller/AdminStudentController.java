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
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

@RequestMapping("/admin/student")
@Controller
public class AdminStudentController {

    @Autowired
    StudentService studentService;

    @Autowired
    TeacherService teacherService;

    @Autowired
    GroupService groupService;

    // Поиск
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String showAllStudents(Model model) {

        model.addAttribute("students", studentService.findAll());
        return "admin/student/search";
    }

    // Поиск по параметрам
    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String findStudents(@RequestParam("firstname") String firstname,
                               @RequestParam("lastname") String lastname,
                               @RequestParam("groupId") long groupId,
                               Model model) {
        // TODO сделать метод для поиска по имени/фамилии/группе
        model.addAttribute("students", studentService.findAll());
        return "admin/student/search";
    }

    // Переход на форму сохранения
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String showRegistration(Model model) {

        model.addAttribute("student", new Student());
        model.addAttribute("groups", groupService.findAll());
        model.addAttribute("instructors", teacherService.findAll());

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
    public String show(@RequestParam("id") long id,
                       Model model) {

        model.addAttribute("student", studentService.getOne(id));
        return "admin/student/show";
    }

    // Редактирование одного студента
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(@RequestParam("id") long id,
                       Model model) {

        model.addAttribute("student", studentService.findOne(id));
        model.addAttribute("groups", groupService.findAll());
        model.addAttribute("instructors", teacherService.findAll());

        return "admin/student/edit";
    }
}
