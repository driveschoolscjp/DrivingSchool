package com.luxoft.drivingschool.service.impl;

import com.luxoft.drivingschool.model.Student;
import com.luxoft.drivingschool.repository.StudentRepository;
import com.luxoft.drivingschool.service.StudentService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Aleksei Chumakov on 28.02.2015.
 */
@Service("studentService")
@Transactional
public class StudentServiceImpl extends BaseServiceImpl<Student> implements StudentService {
    public Student findByLogin(String login) {
        return ((StudentRepository)getRepository()).findByLogin(login);
    }
}
