package com.luxoft.drivingschool.controller;

import com.luxoft.drivingschool.model.Gender;
import com.luxoft.drivingschool.model.Group;
import com.luxoft.drivingschool.model.Student;
import com.luxoft.drivingschool.model.Teacher;
import com.luxoft.drivingschool.repository.GroupRepository;
import com.luxoft.drivingschool.repository.StudentRepository;
import com.luxoft.drivingschool.repository.mockImpl.GroupRepositoryMock;
import com.luxoft.drivingschool.repository.mockImpl.StudentRepositoryMock;
import com.luxoft.drivingschool.repository.mockImpl.TeacherRepositoryMock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by SCJP on 26.02.2015.
 */
@Controller
public class AdministratorController {

    @Autowired private StudentRepositoryMock studentRepository;
    @Autowired private TeacherRepositoryMock teacherRepository;
    @Autowired GroupRepositoryMock groupRepository;

    @RequestMapping(value = "add", method = RequestMethod.GET)
    public String viewRegistration(Map<String, Object> model) {
        Student studentForm = new Student();
        Teacher instructorForm = new Teacher();
        Group groupForm = new Group();
        Gender genderForm = Gender.FEMALE;

        List<Teacher> instructorsForm =  teacherRepository.findByFirstname("k");
        List<Group> groupsForm = groupRepository.findByFirstname("l");
        List<Gender> gendersForm = new ArrayList<>();
        gendersForm.add(Gender.FEMALE);
        gendersForm.add(Gender.MALE);

        model.put("studentForm", studentForm);
//        model.put("instructorForm", instructorForm);
//        model.put("groupForm", groupForm);
//        model.put("genderForm", genderForm);

        return "student";
    }

    @RequestMapping(value = "add", method = RequestMethod.POST)
    public String processRegistration(@ModelAttribute("studentForm") Student student,
                                      @ModelAttribute("instructorForm") Teacher instructorForm,
                                      @ModelAttribute("groupForm") Group groupForm,
                                      @ModelAttribute("genderForm") Gender genderForm) {


        student.setInstructor(instructorForm);
        student.setGroup(groupForm);
        student.setGender(genderForm);

        studentRepository.save(student);

        // for testing purpose:
        System.out.println("id: " + student.getId());
        System.out.println("login: " + student.getLogin());
        System.out.println("password: " + student.getPassword());
        System.out.println("email: " + student.getEmail());
        System.out.println("Name: " + student.getFirstname());
        System.out.println("Surname: " + student.getLastname());
        System.out.println("Patronymic: " + student.getPatronymic());
        System.out.println("INN: " + student.getInn().toString());
        System.out.println("Passport: " + student.getPassport());
        System.out.println("Number of ride: " + student.getRideNumber());
        System.out.println("Instructor: " + student.getInstructor().toString());
        System.out.println("Group: " + student.getGroup().toString());
        System.out.println("Gender: " + student.getGender().toString());
        System.out.println("Birthday: " + student.getBirthday().toString());

        return "registrationSuccess";
    }
}
