package com.luxoft.drivingschool.controller;

import com.luxoft.drivingschool.model.Student;
import com.luxoft.drivingschool.model.Teacher;
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

@RequestMapping("/admin/teacher")
@Controller
public class AdminTeacherController {

    @Autowired
    StudentService studentService;

    @Autowired
    TeacherService teacherService;

    @Autowired
    GroupService groupService;

    // Поиск
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String showAllTeachers(Model model) {

        model.addAttribute("teachers", teacherService.findAll());
        return "admin/teacher/search";
    }

    // Поиск по параметрам
    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String findTeachers(@RequestParam("firstname") String firstname,
                               @RequestParam("lastname") String lastname,
                               @RequestParam("groupId") long groupId,
                               Model model) {
        // TODO сделать метод для поиска по имени/фамилии/группе
        model.addAttribute("teachers", teacherService.findAll());
        return "admin/teacher/search";
    }

    // Переход на форму сохранения
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String showRegistration(Model model) {

        model.addAttribute("teacher", new Teacher());

        return "admin/teacher/edit";
    }

    // Сохранение и переход на форму просмотра
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String processRegistration(@ModelAttribute("teacher") Teacher teacher) {
        teacher = teacherService.save(teacher);
        return "redirect:show?id=" + teacher.getId(); // На страничку просмотра
    }

    // Показ одного студента
    @RequestMapping(value = "/show", method = RequestMethod.GET)
    public String show(@RequestParam("id") long id,
                       Model model) {

        model.addAttribute("teacher", teacherService.findOne(id));
        return "admin/teacher/show";
    }

    // Редактирование одного учителя
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(@RequestParam("id") long id,
                       Model model) {

        model.addAttribute("teacher", teacherService.findOne(id));

        return "admin/teacher/edit";
    }
}
