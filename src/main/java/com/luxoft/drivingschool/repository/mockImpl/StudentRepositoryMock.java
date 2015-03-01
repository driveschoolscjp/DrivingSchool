package com.luxoft.drivingschool.repository.mockImpl;

import com.luxoft.drivingschool.model.Gender;
import com.luxoft.drivingschool.model.Group;
import com.luxoft.drivingschool.model.Student;
import com.luxoft.drivingschool.model.Teacher;
import com.luxoft.drivingschool.repository.GroupRepository;
import com.luxoft.drivingschool.repository.StudentRepository;
import com.luxoft.drivingschool.repository.TeacherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.swing.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Svetlana Lawrentyeva on 01.03.15.
 */

@Service("studentRepository")
public class StudentRepositoryMock{

    Student student;
    List<Student>students = new ArrayList<>();

    @Autowired TeacherRepositoryMock teacherRepository;
    @Autowired GroupRepositoryMock groupRepository;

    @PostConstruct
    public void init(){
        student = addStudent("student", "student", "student@student.ua", "firstName_student", "lastName_student", "patronymic_student",
                111, "passport_student", 1, teacherRepository.findOne(1L), groupRepository.findOne(1L), Gender.FEMALE,
                new Date(1991, 8, 20));

        students.add(student);
    }

    private Student addStudent(String login, String password, String email, String firstName, String lastName, String patronymic, int inn,
                               String passport, int rideNumber, Teacher instructor, Group group, Gender gender, Date birthDay){
        Student s = new Student();

        s.setLogin(login);
        s.setPassword(password);
        s.setEmail(email);
        s.setFirstname(firstName);
        s.setLastname(lastName);
        s.setPatronymic(patronymic);
        s.setInn(inn);
        s.setPassport(passport);
        s.setRideNumber(rideNumber);
        s.setInstructor(instructor);
        s.setGroup(group);
        s.setGender(gender);
        s.setBirthday(birthDay);

        return s;
    }

    public Student save(Student student){
        students.add(student);
        return student;
    }

    public List<Student> findByFirstname(String firstname) {
        return students;
    }

    public Student findOne(Long aLong) {
        return student;
    }

}
