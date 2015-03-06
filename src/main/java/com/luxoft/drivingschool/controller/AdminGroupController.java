package com.luxoft.drivingschool.controller;

import com.luxoft.drivingschool.controller.editor.LocalDateEditor;
import com.luxoft.drivingschool.model.Group;
import com.luxoft.drivingschool.service.GroupService;
import com.luxoft.drivingschool.service.TeacherService;
import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/admin/group")
@Controller
public class AdminGroupController {

    private static final String VIEW_SEARCH_PATH = "/admin/group/search";
    private static final String VIEW_SHOW_PATH = "admin/group/show";
    private static final String VIEW_EDIT_PATH = "admin/group/edit";
    private static final String REDIRECT_SHOW_TO_ID_PATH = "redirect:show?id=";

    private static final String SEARCH_MAPPING_PATH = "/search";
    private static final String ADD_MAPPING_PATH = "/add";
    private static final String SAVE_MAPPING_PATH = "/save";
    private static final String SHOW_MAPPING_PATH = "/show";
    private static final String EDIT_MAPPING_PATH = "/edit";

    private static final String TEACHERS_ATTRIBUTE = "teachers";
    private static final String GROUPS_ATTRIBUTE = "groups";
    private static final String GROUP_ATTRIBUTE = "group";

    private static final String ID_REQUEST_PARAM = "id";

    @Autowired
    TeacherService teacherService;

    @Autowired
    GroupService groupService;

    // Поиск
    @RequestMapping(value = SEARCH_MAPPING_PATH, method = RequestMethod.GET)
    public String showAllGroups(Model model) {

        model.addAttribute(GROUPS_ATTRIBUTE, groupService.findAll());
        model.addAttribute(TEACHERS_ATTRIBUTE, teacherService.findAll());
        return VIEW_SEARCH_PATH;
    }

    // Поиск по параметрам
    @RequestMapping(value = SEARCH_MAPPING_PATH, method = RequestMethod.POST)
    public String findGroups(@RequestParam(ID_REQUEST_PARAM) long teacherId, Model model) {

        model.addAttribute(GROUPS_ATTRIBUTE, groupService.findByTeacherId(teacherId));
        model.addAttribute(TEACHERS_ATTRIBUTE, teacherService.findAll());
        return VIEW_SEARCH_PATH;
    }

    // Переход на форму сохранения
    @RequestMapping(value = ADD_MAPPING_PATH, method = RequestMethod.GET)
    public String showRegistration(Model model) {

        model.addAttribute(GROUP_ATTRIBUTE, new Group());
        model.addAttribute(TEACHERS_ATTRIBUTE, teacherService.findAll());

        return VIEW_EDIT_PATH;
    }

    // Сохранение и переход на форму просмотра
    @RequestMapping(value = SAVE_MAPPING_PATH, method = RequestMethod.POST)
    public String processRegistration(@ModelAttribute(GROUP_ATTRIBUTE) Group group) {

        group = groupService.save(group);
        return REDIRECT_SHOW_TO_ID_PATH + group.getId(); // На страничку просмотра
    }

    // Показ одной группы
    @RequestMapping(value = SHOW_MAPPING_PATH, method = RequestMethod.GET)
    public String show(@RequestParam(ID_REQUEST_PARAM) long id, Model model) {

        model.addAttribute(GROUP_ATTRIBUTE, groupService.findOne(id));
        return VIEW_SHOW_PATH;
    }

    // Редактирование одной группы
    @RequestMapping(value = EDIT_MAPPING_PATH, method = RequestMethod.GET)
    public String edit(@RequestParam(ID_REQUEST_PARAM) long id, Model model) {

        model.addAttribute(GROUP_ATTRIBUTE, groupService.findOne(id));
        model.addAttribute(TEACHERS_ATTRIBUTE, teacherService.findAll());

        return VIEW_EDIT_PATH;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(LocalDate.class, new LocalDateEditor());
    }
}
