package com.luxoft.drivingschool.service;

import com.luxoft.drivingschool.model.Student;
import com.luxoft.drivingschool.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class StudentService {

    @Autowired
    private StudentRepository studentRepository;

    @Transactional
    public Student save(Student student){
        return studentRepository.save(student);
    }

    public List<Student> findAll() {
        return studentRepository.findAll();
    }

    public Student findOne(long id){
        return studentRepository.findOne(id);
    }

    public List<Student> findByGroupId(long id) {
        return studentRepository.findByGroupId(id);
    }

    public Student findByLogin(String login) {
        return studentRepository.findByLogin(login);
    }
}
