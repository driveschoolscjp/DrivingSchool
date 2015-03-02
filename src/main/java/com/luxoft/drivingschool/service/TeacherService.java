package com.luxoft.drivingschool.service;

import com.luxoft.drivingschool.model.Teacher;
import com.luxoft.drivingschool.repository.TeacherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TeacherService {

    @Autowired
    TeacherRepository teacherRepository;

    public Teacher getOne(Long id){
        return teacherRepository.getOne(id);
    }

    public List<Teacher> findAll(){
       return teacherRepository.findAll();
    }
}
