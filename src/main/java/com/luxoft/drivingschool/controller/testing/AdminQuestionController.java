package com.luxoft.drivingschool.controller.testing;


import com.luxoft.drivingschool.model.testing.Answer;
import com.luxoft.drivingschool.model.testing.Exam;
import com.luxoft.drivingschool.model.testing.Question;
import com.luxoft.drivingschool.model.testing.Ticket;
import com.luxoft.drivingschool.service.testing.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Collections;
import java.util.List;

@RequestMapping("/admin/testing/question")
@Controller
public class AdminQuestionController {

    private static final String VIEW_SEARCH_PATH = "admin/testing/question/search";
    private static final String VIEW_SHOW_PATH = "admin/testing/question/show";
    private static final String VIEW_EDIT_PATH = "admin/testing/question/edit";
    private static final String VIEW_EDIT_ANSWER_PATH = "admin/testing/question/edit_answer";
    private static final String REDIRECT_SHOW_TO_ID_PATH = "redirect:show?id=";
    private static final String REDIRECT_ADD_ANSWER = "redirect:addAnswer?id=";

    private static final String SEARCH_MAPPING_PATH="/search";
    private static final String ADD_MAPPING_PATH="/add";
    private static final String SAVE_MAPPING_PATH="/save";
    private static final String SAVE_ANSWER_MAPPING_PATH="/saveAnswer";
    private static final String SHOW_MAPPING_PATH="/show";
    private static final String EDIT_MAPPING_PATH="/edit";
    private static final String ADD_ANSWER_MAPPING_PATH = "/addAnswer";
    private static final String EDIT_ANSWER_MAPPING_PATH = "/editAnswer";

    private static final String QUESTIONS_ATTRIBUTE="questions";
    private static final String QUESTION_ATTRIBUTE="question";
    private static final String TICKET_ATTRIBUTE="ticket";

    private static final String ID_REQUEST_PARAM="id";
    private static final String TICKET_REQUEST_PARAM="ticket";
    private static final String NUMBERS_ATTRIBUTE = "numbers";
    private static final String NUMBER_ATTRIBUTE = "number";
    private static final String THEMES_ATTRIBUTE = "themes";
    private static final String MORE_QUESTIONS_ATTRIBUTE = "moreQuestions";
    private static final String ANSWERS_ATTRIBUTE = "answers";
    private static final String ANSWER_ATTRIBUTE = "answer";
    private static final String THEME_ATTRIBUTE = "theme";

    @Autowired
    private QuestionService questionService;
    @Autowired
    private TicketService ticketService;
    @Autowired
    private ExamService examService;
    @Autowired
    private ThemeService themeService;
    @Autowired
    private AnswerService answerService;

    @RequestMapping(value = SEARCH_MAPPING_PATH, method = RequestMethod.GET)
    public String showQuestionsByTicket(@RequestParam(ID_REQUEST_PARAM) long ticketId, Model model) {

        Ticket ticket = ticketService.findOne(ticketId);
        Exam exam = examService.findOne(ticket.getExam().getId());
        model.addAttribute(TICKET_ATTRIBUTE, ticket);
        model.addAttribute(MORE_QUESTIONS_ATTRIBUTE, questionService.lastNumber(ticketId) < exam.getQuestionPerTicketQuantity());
        List<Question> questions = questionService.findByTicketId(ticket.getId());
        Collections.sort(questions);
        model.addAttribute(QUESTIONS_ATTRIBUTE, questions);
        return VIEW_SEARCH_PATH;
    }

    // Переход на форму сохранения
    @RequestMapping(value = ADD_MAPPING_PATH, method = RequestMethod.GET)
    public String showRegistration(Model model, @RequestParam(ID_REQUEST_PARAM) int ticketId) {

        Question question = new Question();
        question.setNumber(questionService.lastNumber(ticketId)+1);
        question.setTicket(ticketService.findOne(ticketId));                   //почему-то не сохраняет через форму
        model.addAttribute(QUESTION_ATTRIBUTE, question);
        model.addAttribute(THEMES_ATTRIBUTE, themeService.findAll());

        return VIEW_EDIT_PATH;
    }

    // Сохранение вопроса и переход на форму добавления ответа
    @RequestMapping(value = SAVE_MAPPING_PATH, method = RequestMethod.POST)
        public String saveQuestion(@ModelAttribute(QUESTION_ATTRIBUTE) Question question) {
//        question.setTicket(ticketService.findOne(ticketId));
        question = questionService.save(question);
        return "edit?id=" + question.getId(); // На страничку просмотра
    }

    // Добавление ответа
    @RequestMapping(value = ADD_ANSWER_MAPPING_PATH, method = RequestMethod.GET)
    public String addAnswer(@RequestParam(ID_REQUEST_PARAM) long questionId, Model model) {

        Answer answer = new Answer();
        Question question = questionService.findOne(questionId);
        answer.setQuestion(question);
        List<Answer> answers = answerService.findByQuestionId(question.getId());
        answers.add(answer);
        model.addAttribute(ANSWER_ATTRIBUTE, answer);
        model.addAttribute(ANSWERS_ATTRIBUTE, answers);
        model.addAttribute(QUESTION_ATTRIBUTE, question);

        return VIEW_EDIT_ANSWER_PATH;
    }

    // Сохранение ответа и переход на форму просмотра
    @RequestMapping(value = SAVE_ANSWER_MAPPING_PATH, method = RequestMethod.POST)
    public String processRegistrationQuestion(@ModelAttribute(ANSWER_ATTRIBUTE) Answer answer,
                                              @RequestParam("questionId") long questionId) {
        answer.setQuestion(questionService.findOne(questionId));
        answer = answerService.save(answer);
        if(answer.getCorrect()) {
            List<Answer> answers = answerService.findByQuestionId(questionId);
            for (Answer a : answers) {
                if (!a.getId().equals(answer.getId())) {
                    a.setCorrect(false);
                    answerService.save(a);
                }
            }
        }
        return "redirect:edit?id=" + questionId; // На страничку просмотра
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
        model.addAttribute(ANSWERS_ATTRIBUTE, answerService.findByQuestionId(id));
        model.addAttribute(THEMES_ATTRIBUTE, themeService.findAll());
        model.addAttribute(QUESTION_ATTRIBUTE, question);

        return VIEW_EDIT_PATH;
    }

    // Редактирование ответа
    @RequestMapping(value = EDIT_ANSWER_MAPPING_PATH, method = RequestMethod.GET)
    public String editAnswer(@RequestParam(ID_REQUEST_PARAM) long answerId, Model model) {

        Answer answer = answerService.findOne(answerId);
        Question question = answer.getQuestion();
        model.addAttribute(ANSWER_ATTRIBUTE, answer);
        model.addAttribute(ANSWERS_ATTRIBUTE, answerService.findByQuestionId(question.getId()));
        model.addAttribute(QUESTION_ATTRIBUTE, question);

        return VIEW_EDIT_ANSWER_PATH;
    }
}
