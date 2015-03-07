package com.luxoft.drivingschool.controller.testing;

import com.luxoft.drivingschool.model.testing.Exam;
import com.luxoft.drivingschool.model.testing.Ticket;
import com.luxoft.drivingschool.service.testing.ExamService;
import com.luxoft.drivingschool.service.testing.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by Svetlana Lawrentyeva on 07.03.15.
 */
@RequestMapping("/admin/testing/ticket")
@Controller
public class AdminTicketController {
    private static final String VIEW_SEARCH_PATH = "admin/testing/ticket/search";
    private static final String VIEW_SHOW_PATH = "admin/testing/ticket/show";
    private static final String VIEW_QUESTION_SEARCH_PATH = "admin/testing/question/search?id=";
    private static final String REDIRECT_SHOW_TO_ID_PATH = "redirect:show?id=";

    private static final String SEARCH_MAPPING_PATH="/search";
    private static final String ADD_MAPPING_PATH="/add";
    private static final String SAVE_MAPPING_PATH="/save";
    private static final String SHOW_MAPPING_PATH="/show";
    private static final String EDIT_MAPPING_PATH="/edit";

    private static final String TICKETS_ATTRIBUTE="tickets";
    private static final String TICKET_ATTRIBUTE="ticket";

    private static final String ID_REQUEST_PARAM="id";
    private static final String EXAM_ATTRIBUTE = "exam";
    private static final String MORE_TICKETS_ATTRIBUTE = "moreTickets";

    @Autowired
    private TicketService ticketService;
    @Autowired
    private ExamService examService;

    @RequestMapping(value = SEARCH_MAPPING_PATH, method = RequestMethod.GET)
    public String showTicketsByExam(@RequestParam(ID_REQUEST_PARAM) long examId, Model model) {

        Exam exam = examService.findOne(examId);
        model.addAttribute(EXAM_ATTRIBUTE, exam);
        model.addAttribute(MORE_TICKETS_ATTRIBUTE, ticketService.lastNumber(examId)<exam.getTicketQuantity());
        model.addAttribute(TICKETS_ATTRIBUTE, ticketService.findByExamId(examId));
        return VIEW_SEARCH_PATH;
    }

    // Переход на форму просмотра вопросов
    @RequestMapping(value = ADD_MAPPING_PATH, method = RequestMethod.GET)
    public String showRegistration(@RequestParam(ID_REQUEST_PARAM) long examId, Model model) {

        Ticket ticket = new Ticket();
        ticket.setNumber(ticketService.lastNumber(examId)+1);
        ticket.setExam(examService.findOne(examId));
        ticket = ticketService.save(ticket);
        model.addAttribute(TICKET_ATTRIBUTE, ticket);
        ticket = ticketService.save(ticket);
        return VIEW_QUESTION_SEARCH_PATH+ticket.getId();
    }

    // Сохранение и переход на форму просмотра
    @RequestMapping(value = SAVE_MAPPING_PATH, method = RequestMethod.POST)
    public String processRegistration(@ModelAttribute(TICKET_ATTRIBUTE) Ticket ticket) {
        ticket = ticketService.save(ticket);
        return REDIRECT_SHOW_TO_ID_PATH + ticket.getId(); // На страничку просмотра
    }
}
