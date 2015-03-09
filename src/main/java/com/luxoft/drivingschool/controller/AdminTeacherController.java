package com.luxoft.drivingschool.controller;

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

    private static final String VIEW_SEARCH_PATH = "/admin/teacher/search";
    private static final String VIEW_SHOW_PATH = "admin/teacher/show";
    private static final String VIEW_EDIT_PATH = "admin/teacher/edit";
    private static final String REDIRECT_SHOW_TO_ID_PATH = "redirect:show?id=";

    private static final String SEARCH_MAPPING_PATH = "/search";
    private static final String ADD_MAPPING_PATH = "/add";
    private static final String SAVE_MAPPING_PATH = "/save";
    private static final String SHOW_MAPPING_PATH = "/show";
    private static final String EDIT_MAPPING_PATH = "/edit";

    private static final String TEACHERS_ATTRIBUTE = "teachers";
    private static final String TEACHER_ATTRIBUTE = "teacher";

    private static final String HAS_CAR_REQUEST_PARAM = "hasCar";
    private static final String ID_REQUEST_PARAM = "id";

    @Autowired
    StudentService studentService;

    @Autowired
    TeacherService teacherService;

    @Autowired
    GroupService groupService;

    // Поиск
    @RequestMapping(value = SEARCH_MAPPING_PATH, method = RequestMethod.GET)
    public String showAllTeachers(Model model) {

        model.addAttribute(TEACHERS_ATTRIBUTE, teacherService.findAll());
        return VIEW_SEARCH_PATH;
    }

    // Поиск по наличию автомобиля
    @RequestMapping(value = SEARCH_MAPPING_PATH, method = RequestMethod.POST)
    public String findTeachers(@RequestParam(HAS_CAR_REQUEST_PARAM) int hasCar,
                               Model model) {
        switch (hasCar){
            case 1:
                model.addAttribute(TEACHERS_ATTRIBUTE, teacherService.findAll());
                break;
            case 2:
                model.addAttribute(TEACHERS_ATTRIBUTE, teacherService.findByCarIsNotNull());
                break;
            case 3:
                model.addAttribute(TEACHERS_ATTRIBUTE, teacherService.findByCarIsNull());
                break;
        }
        model.addAttribute(HAS_CAR_REQUEST_PARAM, hasCar);
        return VIEW_SEARCH_PATH;
    }

    // Переход на форму сохранения
    @RequestMapping(value = ADD_MAPPING_PATH, method = RequestMethod.GET)
    public String showRegistration(Model model) {

        model.addAttribute(TEACHER_ATTRIBUTE, new Teacher());

        return VIEW_EDIT_PATH;
    }

    // Сохранение и переход на форму просмотра
    @RequestMapping(value = SAVE_MAPPING_PATH, method = RequestMethod.POST)
    public String processRegistration(@ModelAttribute(TEACHER_ATTRIBUTE) Teacher teacher) {
        teacher = teacherService.save(teacher);
        return REDIRECT_SHOW_TO_ID_PATH + teacher.getId(); // На страничку просмотра
    }

    // Показ одного преподавателя
    @RequestMapping(value = SHOW_MAPPING_PATH, method = RequestMethod.GET)
    public String show(@RequestParam(ID_REQUEST_PARAM) long id,
                       Model model) {

        model.addAttribute(TEACHER_ATTRIBUTE, teacherService.findOne(id));
        return VIEW_SHOW_PATH;
    }

    // Редактирование одного преподавателя
    @RequestMapping(value = EDIT_MAPPING_PATH, method = RequestMethod.GET)
    public String edit(@RequestParam(ID_REQUEST_PARAM) long id,
                       Model model) {

        model.addAttribute(TEACHER_ATTRIBUTE, teacherService.findOne(id));

        return VIEW_EDIT_PATH;
    }
}
