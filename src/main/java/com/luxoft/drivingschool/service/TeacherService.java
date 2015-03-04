package com.luxoft.drivingschool.service;

import com.luxoft.drivingschool.model.Teacher;
import com.luxoft.drivingschool.repository.TeacherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class TeacherService {

    @Autowired
    private TeacherRepository teacherRepository;

    public Teacher findOne(Long id){
        return teacherRepository.findOne(id);
    }

    public List<Teacher> findAll(){
       return teacherRepository.findAll();
    }

    public Teacher save(Teacher teacher) {
        return teacherRepository.save(teacher);
    }

    public List<Teacher> findByCarNotNull(){
        return teacherRepository.findByCarNotNull();
    }

    public List<Teacher> findByCarNull(){
        return teacherRepository.findByCarNull();
    }
}
