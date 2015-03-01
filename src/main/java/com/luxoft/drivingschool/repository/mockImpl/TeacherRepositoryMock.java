package com.luxoft.drivingschool.repository.mockImpl;

import com.luxoft.drivingschool.model.Gender;
import com.luxoft.drivingschool.model.Student;
import com.luxoft.drivingschool.model.Teacher;
import com.luxoft.drivingschool.repository.TeacherRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Svetlana Lawrentyeva on 01.03.15.
 */

@Service("teacherRepository")
public abstract class TeacherRepositoryMock {

    Teacher teacher;
    List<Teacher>teachers = new ArrayList<>();

    @PostConstruct
    public void init(){
        teacher = initTeacher("teacher@teacher.ua", "firstName_teacher", "lastName_teacher", "patronymic_teacher",
                111, "passport_teacher", Gender.MALE, new Date());
        teachers.add(teacher);
    }

    private Teacher initTeacher(String email, String firstName, String lastName, String patronymic, int inn,
                                String passport, Gender gender, Date birthDay){
        Teacher t = new Teacher();

        t.setEmail(email);
        t.setFirstname(firstName);
        t.setLastname(lastName);
        t.setPatronymic(patronymic);
        t.setInn(inn);
        t.setPassport(passport);
        t.setGender(gender);
        t.setBirthday(birthDay);

        return t;
    }

    public Teacher findOne(Long aLong) {
        return  teacher;
    }


    public List<Teacher> findByFirstname(String firstname) {
        return teachers;
    }

}
