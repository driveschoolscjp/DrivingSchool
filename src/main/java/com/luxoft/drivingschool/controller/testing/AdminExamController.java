package com.luxoft.drivingschool.controller.testing;

import com.luxoft.drivingschool.model.testing.Exam;
import com.luxoft.drivingschool.service.testing.ExamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Svetlana Lawrentyeva on 07.03.15.
 */


@RequestMapping("/admin/testing/exam")
@Controller
public class AdminExamController {
    private static final String VIEW_SEARCH_PATH = "admin/testing/exam/search";
    private static final String VIEW_EDIT_PATH = "admin/testing/exam/edit";
    private static final String REDIRECT_SEARCH = "redirect:search";

    private static final String SEARCH_MAPPING_PATH="/search";
    private static final String ADD_MAPPING_PATH="/add";
    private static final String SAVE_MAPPING_PATH="/save";

    private static final String EXAMS_ATTRIBUTE="exams";
    private static final String EXAM_ATTRIBUTE="exam";

    @Autowired
    ExamService examService;

    @RequestMapping(value = SEARCH_MAPPING_PATH, method = RequestMethod.GET)
    public String showAllExams(Model model) {
        model.addAttribute(EXAMS_ATTRIBUTE, examService.findAll());
        return VIEW_SEARCH_PATH;
    }

    // Переход на форму сохранения
    @RequestMapping(value = ADD_MAPPING_PATH, method = RequestMethod.GET)
    public String showRegistration(Model model) {

        model.addAttribute(EXAM_ATTRIBUTE, new Exam());
        return VIEW_EDIT_PATH;
    }

    // Сохранение и переход на форму просмотра
    @RequestMapping(value = SAVE_MAPPING_PATH, method = RequestMethod.POST)
    public String processRegistration(@ModelAttribute(EXAM_ATTRIBUTE) Exam exam) {
        exam = examService.save(exam);
        return REDIRECT_SEARCH; // На страничку поиска
    }
}
