package com.luxoft.drivingschool.controller;

import com.luxoft.drivingschool.model.Group;
import com.luxoft.drivingschool.service.GroupService;
import com.luxoft.drivingschool.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/admin/group")
@Controller
public class AdminGroupController {

    @Autowired
    TeacherService teacherService;

    @Autowired
    GroupService groupService;

    // Поиск
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String showAllGroups(Model model) {

        model.addAttribute("groups", groupService.findAll());
        model.addAttribute("teachers", teacherService.findAll());
        return "/admin/group/search";
    }

    // Поиск по параметрам
    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String findGroups(@RequestParam("id") long teacherId, Model model) {

        model.addAttribute("groups", groupService.findByTeacherId(teacherId));
        model.addAttribute("teachers", teacherService.findAll());
        return "/admin/group/search";
    }

    // Переход на форму сохранения
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String showRegistration(Model model) {

        model.addAttribute("group", new Group());
        model.addAttribute("teachers", teacherService.findAll());

        return "admin/group/edit";
    }

    // Сохранение и переход на форму просмотра
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String processRegistration(@ModelAttribute("group") Group group) {

        group = groupService.save(group);
        return "redirect:show?id=" + group.getId(); // На страничку просмотра
    }

    // Показ одной группы
    @RequestMapping(value = "/show", method = RequestMethod.GET)
    public String show(@RequestParam("id") long id, Model model) {

        model.addAttribute("group", groupService.findOne(id));
        return "admin/group/show";
    }

    // Редактирование одной группы
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(@RequestParam("id") long id, Model model) {

        model.addAttribute("group", groupService.findOne(id));
        model.addAttribute("teachers", teacherService.findAll());

        return "admin/group/edit";
    }
}
