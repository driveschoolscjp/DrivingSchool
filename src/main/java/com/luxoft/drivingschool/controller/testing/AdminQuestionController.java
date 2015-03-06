package com.luxoft.drivingschool.controller.testing;


import com.luxoft.drivingschool.model.testing.Question;
import com.luxoft.drivingschool.service.testing.QuestionService;
import com.luxoft.drivingschool.service.testing.ThemeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@RequestMapping("/admin/question")
@Controller
public class AdminQuestionController {

    private static final String VIEW_SEARCH_PATH = "admin/question/search";
    private static final String VIEW_SHOW_PATH = "admin/question/show";
    private static final String VIEW_EDIT_PATH = "admin/question/edit";
    private static final String REDIRECT_SHOW_TO_ID_PATH = "redirect:show?id=";

    private static final String SEARCH_MAPPING_PATH="/search";
    private static final String ADD_MAPPING_PATH="/add";
    private static final String SAVE_MAPPING_PATH="/save";
    private static final String SHOW_MAPPING_PATH="/show";
    private static final String EDIT_MAPPING_PATH="/edit";

    private static final String QUESTIONS_ATTRIBUTE="questions";
    private static final String QUESTION_ATTRIBUTE="question";

    private static final String ID_REQUEST_PARAM="id";
    private static final String TICKET_REQUEST_PARAM="ticket";
    private static final String NUMBERS_ATTRIBUTE = "numbers";
    private static final String NUMBER_ATTRIBUTE = "number";
    private static final String THEMES_ATTRIBUTE = "themes";

    @Autowired
    private QuestionService questionService;

    @Autowired
    private ThemeService themeService;

    @RequestMapping(value = SEARCH_MAPPING_PATH, method = RequestMethod.GET)
    public String showAllQuestions(Model model) {

        model.addAttribute(QUESTIONS_ATTRIBUTE, questionService.findAll());
        return VIEW_SEARCH_PATH;
    }

    // Переход на форму сохранения
    @RequestMapping(value = ADD_MAPPING_PATH, method = RequestMethod.GET)
    public String showRegistration(Model model, @RequestParam(TICKET_REQUEST_PARAM) int ticket) {

        Question question = new Question();
        question.setTicket(ticket);
        question.setNumber((int) (questionService.countByTicket(ticket) + 1));
        model.addAttribute(THEMES_ATTRIBUTE, themeService.findAll());
        model.addAttribute(QUESTION_ATTRIBUTE, question);

        return VIEW_EDIT_PATH;
    }

    // Сохранение и переход на форму просмотра
    @RequestMapping(value = SAVE_MAPPING_PATH, method = RequestMethod.POST)
    public String processRegistration(@ModelAttribute(QUESTION_ATTRIBUTE) Question question) {
        question = questionService.save(question);
        return REDIRECT_SHOW_TO_ID_PATH + question.getId(); // На страничку просмотра
    }

    // Показ одного вопроса
    @RequestMapping(value = SHOW_MAPPING_PATH, method = RequestMethod.GET)
    public String show(@RequestParam(ID_REQUEST_PARAM) long id, Model model) {

        model.addAttribute(QUESTION_ATTRIBUTE, questionService.findOne(id));
        return VIEW_SHOW_PATH;
    }

    // Редактирование одного вопроса
    @RequestMapping(value = EDIT_MAPPING_PATH, method = RequestMethod.GET)
    public String edit(@RequestParam(ID_REQUEST_PARAM) long id, Model model) {

        Question question = questionService.findOne(id);
        question.setTicket(question.getTicket());
        question.setNumber((int) (questionService.countByTicket(question.getTicket()) + 1));
        model.addAttribute(THEMES_ATTRIBUTE, themeService.findAll());
        model.addAttribute(QUESTION_ATTRIBUTE, question);

        return VIEW_EDIT_PATH;
    }
}
