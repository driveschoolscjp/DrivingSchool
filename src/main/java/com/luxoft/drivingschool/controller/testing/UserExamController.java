package com.luxoft.drivingschool.controller.testing;

import com.luxoft.drivingschool.model.testing.Answer;
import com.luxoft.drivingschool.model.testing.Exam;
import com.luxoft.drivingschool.model.testing.Question;
import com.luxoft.drivingschool.service.testing.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import javax.xml.ws.spi.http.HttpContext;
import java.util.List;

/**
 * Created by Svetlana Lawrentyeva on 08.03.15.
 */

@RequestMapping("/testing")
@Controller
public class UserExamController {

    private static final String SEARCH_EXAM_MAPPING_PATH = "/search";
    private static final String EXAMS_ATTRIBUTE = "exams";
    private static final String VIEW_SEARCH_EXAM_PATH = "/user/testing/search";
    private static final String ID_EXAM = "idExam";
    private static final String MODE_ATTRIBUTE = "typeMode";
    private static final String START_EXAM_MAPPING_PATH = "/start";
    private static final String TICKET_QUANTITY = "ticketQuantity";
    private static final String THEMES = "themes";
    private static final String START_BY_TICKET = "/startTicket?idTicket=";
    private static final String RANDOM_QUESTION = "/randomQuestion?i=";
    private static final String THEME_QUESTIONS = "/theme?id=";
    private static final String EXAM_ATTRIBUTE = "exam";
    private static final String QUESTION_PATH = "/question";
    private static final String ASK_QUESTION_VIEW = "/user/testing/askQuestion";
    private static final String ANSWER_PATH = "/answer";
    private static final String ID = "id";
    private static final String TRUE_PATH = "/true";
    private static final String REDIRECT_NEXT_QUESTION = "redirect:question";
    private static final String REDIRECT_TRUE_ANSWER = "redirect:true";

    @Autowired
    private ExamService examService;
    @Autowired
    private TicketService ticketService;
    @Autowired
    private ThemeService themeService;
    @Autowired
    private QuestionService questionService;
    @Autowired
    private AnswerService answerService;

    //переход на форму выбора режима
    @RequestMapping(value = SEARCH_EXAM_MAPPING_PATH, method = RequestMethod.GET)
    public String searchMode(@RequestParam(ID_EXAM) long idExam, Model model) {
        model.addAttribute(EXAMS_ATTRIBUTE, examService.findAll());
        model.addAttribute(EXAM_ATTRIBUTE, examService.findOne(idExam));
        model.addAttribute(TICKET_QUANTITY, ticketService.countByExamId(idExam));
        model.addAttribute(THEMES, themeService.findAll());
        return VIEW_SEARCH_EXAM_PATH;
    }

    //Показ вопроса
    @RequestMapping(value = QUESTION_PATH, method = RequestMethod.GET)
    public String showQuestion(Model model, HttpSession session){
        long questionId= (long) session.getAttribute("questionId");
        Question question = questionService.findOne(questionId);
        List<Answer> answers = answerService.findByQuestionId(questionId);
        model.addAttribute("question", question);
        model.addAttribute("answers", answers);
        model.addAttribute("showAnswer", false);
        return ASK_QUESTION_VIEW;
    }
    //Проверка ответа
    @RequestMapping(value = ANSWER_PATH, method = RequestMethod.GET)
    public String checkQuestion(@RequestParam(ID) long idAnswer, Model model, HttpSession session){
        Answer answer = answerService.findOne(idAnswer);
        if(answer.isTrue()){
            // TO_DO RECORD TO USER STORY
            session.setAttribute("questionId", 1+(long)(session.getAttribute("sessionId")));
            return REDIRECT_NEXT_QUESTION;
        } else {
            return REDIRECT_TRUE_ANSWER;
        }
    }
    //Показ правильного ответа
    @RequestMapping(value = TRUE_PATH, method = RequestMethod.GET)
    public String showAnswer(Model model, HttpSession session){
        long questionId= (long) session.getAttribute("questionId");
        Question question = questionService.findOne(questionId);
        List<Answer> answers = answerService.findByQuestionId(questionId);
        model.addAttribute("question", question);
        model.addAttribute("answers", answers);
        model.addAttribute("showAnswer", true);
        return ASK_QUESTION_VIEW;
    }
}
