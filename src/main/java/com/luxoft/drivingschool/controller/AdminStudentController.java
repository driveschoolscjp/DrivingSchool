package com.luxoft.drivingschool.controller;

import com.luxoft.drivingschool.controller.editor.LocalDateEditor;
import com.luxoft.drivingschool.model.Student;
import com.luxoft.drivingschool.service.GroupService;
import com.luxoft.drivingschool.service.StudentService;
import com.luxoft.drivingschool.service.TeacherService;
import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;



@RequestMapping("/admin/student")
@Controller
public class AdminStudentController {

    private static final String VIEW_SEARCH_PATH = "/admin/student/search";
    private static final String VIEW_SHOW_PATH = "admin/student/show";
    private static final String VIEW_EDIT_PATH = "admin/student/edit";
    private static final String REDIRECT_SHOW_TO_ID_PATH = "redirect:show?id=";

    private static final String SEARCH_MAPPING_PATH = "/search";
    private static final String ADD_MAPPING_PATH = "/add";
    private static final String SAVE_MAPPING_PATH = "/save";
    private static final String SHOW_MAPPING_PATH = "/show";
    private static final String EDIT_MAPPING_PATH = "/edit";

    private static final String STUDENT_ATTRIBUTE = "student";
    private static final String STUDENTS_ATTRIBUTE = "students";
    private static final String INSTRUCTORS_ATTRIBUTE = "instructors";
    private static final String GROUPS_ATTRIBUTE = "groups";

    private static final String ID_REQUEST_PARAM = "id";

    @Autowired
    StudentService studentService;

    @Autowired
    TeacherService teacherService;

    @Autowired
    GroupService groupService;

    // Поиск
    @RequestMapping(value = SEARCH_MAPPING_PATH, method = RequestMethod.GET)
    public String showAllStudents(Model model) {

        model.addAttribute(STUDENTS_ATTRIBUTE, studentService.findAll());
        model.addAttribute(GROUPS_ATTRIBUTE, groupService.findAll());
        return VIEW_SEARCH_PATH;
    }

    // Поиск по параметрам
    @RequestMapping(value = SEARCH_MAPPING_PATH, method = RequestMethod.POST)
    public String findStudents(@RequestParam(ID_REQUEST_PARAM) long groupId, Model model) {

        model.addAttribute(STUDENTS_ATTRIBUTE, studentService.findByGroupId(groupId));
        model.addAttribute(GROUPS_ATTRIBUTE, groupService.findAll());
        return VIEW_SEARCH_PATH;
    }

    // Переход на форму сохранения
    @RequestMapping(value = ADD_MAPPING_PATH, method = RequestMethod.GET)
    public String showRegistration(Model model) {

        model.addAttribute(STUDENT_ATTRIBUTE, new Student());
        model.addAttribute(GROUPS_ATTRIBUTE, groupService.findAll());
        model.addAttribute(INSTRUCTORS_ATTRIBUTE, teacherService.findByCarIsNotNull());

        return VIEW_EDIT_PATH;
    }

    // Сохранение и переход на форму просмотра
    @RequestMapping(value = SAVE_MAPPING_PATH, method = RequestMethod.POST)
    public String processRegistration(@ModelAttribute(STUDENT_ATTRIBUTE) Student student) {

        student = studentService.save(student);
        return REDIRECT_SHOW_TO_ID_PATH + student.getId(); // На страничку просмотра
    }

    // Показ одного студента
    @RequestMapping(value = SHOW_MAPPING_PATH, method = RequestMethod.GET)
    public String show(@RequestParam(ID_REQUEST_PARAM) long id, Model model) {

        model.addAttribute(STUDENT_ATTRIBUTE, studentService.findOne(id));
        return VIEW_SHOW_PATH;
    }

    // Редактирование одного студента
    @RequestMapping(value = EDIT_MAPPING_PATH, method = RequestMethod.GET)
    public String edit(@RequestParam(ID_REQUEST_PARAM) long id, Model model) {

        model.addAttribute(STUDENT_ATTRIBUTE, studentService.findOne(id));
        model.addAttribute(GROUPS_ATTRIBUTE, groupService.findAll());
        model.addAttribute(INSTRUCTORS_ATTRIBUTE, teacherService.findByCarIsNotNull());

        return VIEW_EDIT_PATH;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(LocalDate.class, new LocalDateEditor());
    }
}
