package com.luxoft.drivingschool.service;

import com.luxoft.drivingschool.model.Student;
import com.luxoft.drivingschool.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentService {
    @Autowired
    private StudentRepository studentRepository;

    public Student save(Student student){
        return studentRepository.save(student);
    }
}
