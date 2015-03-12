package com.luxoft.drivingschool.controller.testing;

import com.luxoft.drivingschool.model.Student;
import com.luxoft.drivingschool.model.enums.UserRoleEnum;
import com.luxoft.drivingschool.model.testing.*;
import com.luxoft.drivingschool.service.StudentService;
import com.luxoft.drivingschool.service.testing.*;
import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 * Created by Svetlana Lawrentyeva on 08.03.15.
 */

@RequestMapping("/testing")
@Controller
public class UserExamController {

    private static final String SEARCH_EXAM_MAPPING_PATH = "/search";
    private static final String EXAMS_ATTRIBUTE = "exams";
    private static final String VIEW_SEARCH_EXAM_PATH = "/user/testing/search";
    private static final String REDIRECT_EXAM_PATH = "redirect:search?idExam=1";
    private static final String ID_EXAM = "idExam";
    private static final String MODE_ATTRIBUTE = "typeMode";
    private static final String START_EXAM_MAPPING_PATH = "/start";
    private static final String TICKET_QUANTITY = "ticketQuantity";
    private static final String THEMES = "themes";
    private static final String RANDOM_QUESTION = "/randomQuestion?i=";
    private static final String THEME_QUESTIONS = "/theme?id=";
    private static final String EXAM_ATTRIBUTE = "exam";
    private static final String QUESTION_PATH = "/question";
    private static final String ASK_QUESTION_VIEW = "/user/testing/askQuestion";
    private static final String ANSWER_PATH = "/answer";
    private static final String ID_ANSWER = "idAnswer";
    private static final String TRUE_PATH = "/true";
    private static final String REDIRECT_NEXT_QUESTION = "redirect:question";
    private static final String REDIRECT_TRUE_ANSWER = "redirect:true";
    private static final String ID_TICKET = "idTicket";
    private static final String TICKETS = "tickets";
    private static final String NUMBER = "number";
    private static final String REDIRECT_SHOW_RESULTS = "redirect:results?idTicket=";
    private static final String RESULTS_PATH = "/results";
    private static final String RESULTS_VIEW = "/user/testing/results";


    @Autowired
    private ExamService examService;
    @Autowired
    private TicketService ticketService;
    @Autowired
    private ResultService resultService;
    @Autowired
    private QuestionService questionService;
    @Autowired
    private AnswerService answerService;
    @Autowired
    private StudentService studentService;

    //переход на форму выбора режима
    @RequestMapping(value = SEARCH_EXAM_MAPPING_PATH, method = RequestMethod.GET)
    public String searchMode(@RequestParam(ID_EXAM) long idExam, Model model, HttpSession session) {

        long idStudent = 0;
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth.getAuthorities().contains(new SimpleGrantedAuthority(UserRoleEnum.ROLE_STUDENT.name()))) {
            Student student = studentService.findByLogin(auth.getName());
            idStudent = student.getId();
        }

        session.setAttribute("idQuestion", -1);
//----------------------------------------------------------------------------------
        Map<Ticket, Integer> resMap = new TreeMap<>();
        Exam exam = examService.findOne(idExam);
        List<Ticket>tickets = ticketService.findByExamId(idExam);
        for(Ticket ticket:tickets){
            int correctAnswers = resultService.countCorrect(idStudent, ticket.getId());
            if(correctAnswers>0) {
                resMap.put(ticket, correctAnswers);
            } else {
                resMap.put(ticket, resultService.countIncorrect(idStudent, ticket.getId())*-1);
            }
        }
        model.addAttribute("resMap", resMap);
        model.addAttribute("passAnswers", exam.getQuestionPerTicketQuantity()-3);
        //----------------------------------------------------------------------------------
        model.addAttribute(EXAMS_ATTRIBUTE, examService.findAll());
        model.addAttribute(EXAM_ATTRIBUTE, examService.findOne(idExam));
        model.addAttribute(TICKET_QUANTITY, ticketService.countByExamId(idExam));
        model.addAttribute(TICKETS, ticketService.findByExamId(idExam));
        return VIEW_SEARCH_EXAM_PATH;
    }

    //Показ вопроса
    @RequestMapping(value = QUESTION_PATH, method = RequestMethod.GET)
    public String showQuestion(@RequestParam(ID_TICKET) long idTicket, Model model, HttpSession session){
        Object iT = session.getAttribute("idTicket");
        if(iT==null){
            session.setAttribute("idTicket", idTicket);
        }
        Object iQ = session.getAttribute("idQuestion");
        long idQuestion;
        if(iQ==null || ((Integer) iQ)==-1){
            idQuestion = questionService.findByTicketIdAndNumber(idTicket, 1).getId();
            session.setAttribute("idQuestion", idQuestion);
        } else {
            idQuestion = Long.parseLong(iQ.toString());
        }
        Question question = questionService.findOne(idQuestion);
        if(question == null){
            return REDIRECT_EXAM_PATH;
        }
        List<Answer> answers = answerService.findByQuestionId(idQuestion);
        model.addAttribute("question", question);
        model.addAttribute("answers", answers);
        model.addAttribute("showAnswer", false);
        return ASK_QUESTION_VIEW;
    }
    //Проверка ответа
    @RequestMapping(value = ANSWER_PATH, method = RequestMethod.GET)
    public String checkQuestion(@RequestParam(ID_ANSWER) long idAnswer, Model model, HttpSession session){
        Answer answer = answerService.findOne(idAnswer);
        long idTicket = answer.getQuestion().getTicket().getId();
        int number = answer.getQuestion().getNumber();
        //TODO get students id
        long idStudent = 0;
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth.getAuthorities().contains(new SimpleGrantedAuthority(UserRoleEnum.ROLE_STUDENT.name()))) {
            Student student = studentService.findByLogin(auth.getName());
            idStudent = student.getId();
        }
        Result result = new Result();
        result.setStudent(studentService.findOne(idStudent));
        result.setAnswer(answerService.findOne(idAnswer));
        result.setDateOf(new LocalDate());
        resultService.save(result);
        if(answer.getCorrect()){
            Question question = answer.getQuestion();
            Exam exam = question.getTicket().getExam();
            if(question.getNumber()>= exam.getQuestionPerTicketQuantity()){
                return REDIRECT_SHOW_RESULTS+idTicket;
            }
            long idQuestion = questionService.findByTicketIdAndNumber(idTicket, ++number).getId();
            session.setAttribute("idQuestion", idQuestion);
                return REDIRECT_NEXT_QUESTION+"?idTicket="+idTicket;
        } else {
            return REDIRECT_TRUE_ANSWER+"?idAnswer="+idAnswer;
        }
    }
    //Показ правильного ответа
    @RequestMapping(value = TRUE_PATH, method = RequestMethod.GET)
    public String showAnswer(@RequestParam(ID_ANSWER) long idAnswer, Model model, HttpSession session){

        Answer answer = answerService.findOne(idAnswer);
        Question question = answer.getQuestion();
        List<Answer> answers = answerService.findByQuestionId(question.getId());
        model.addAttribute("question", question);
        model.addAttribute("answers", answers);
        model.addAttribute("showAnswer", true);
        model.addAttribute("idWrongAnswer", idAnswer);
        long idTicket = answer.getQuestion().getTicket().getId();
        int number = answer.getQuestion().getNumber();
        Exam exam = question.getTicket().getExam();
        long idQuestion=0;
        if(question.getNumber()>= exam.getQuestionPerTicketQuantity()){
            return REDIRECT_SHOW_RESULTS+idTicket;
        } else if(question.getNumber()<exam.getQuestionPerTicketQuantity()) {
            idQuestion = questionService.findByTicketIdAndNumber(idTicket, ++number).getId();
        }
        session.setAttribute("idQuestion", idQuestion);


        return ASK_QUESTION_VIEW;
    }

    //Показ результата
    @RequestMapping(value = RESULTS_PATH, method = RequestMethod.GET)
    public String showResults(@RequestParam(ID_TICKET) long idTicket, Model model){
        long idStudent = 0;
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth.getAuthorities().contains(new SimpleGrantedAuthority(UserRoleEnum.ROLE_STUDENT.name()))) {
            Student student = studentService.findByLogin(auth.getName());
            idStudent = student.getId();
        }
        List<Result> results = resultService.findByStudentId(idStudent, idTicket);
        Map<Question, Answer> resMap = new TreeMap<>();
        Ticket ticket = ticketService.findOne(idTicket);
        Exam exam = ticket.getExam();
        List<Question> questions = questionService.findByTicketId(idTicket);
        for(Question question:questions){
            resMap.put(question, null);
        }
        for(Result res:results){
            resMap.put(res.getAnswer().getQuestion(), (res.getAnswer()));
        }

        model.addAttribute("resMap", resMap);
        model.addAttribute("ticket", ticket);

        return RESULTS_VIEW;
    }
}
