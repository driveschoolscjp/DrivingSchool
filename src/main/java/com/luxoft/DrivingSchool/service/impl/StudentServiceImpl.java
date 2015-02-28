package com.luxoft.DrivingSchool.service.impl;

import com.luxoft.DrivingSchool.model.Student;
import com.luxoft.DrivingSchool.service.StudentService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Aleksei Chumakov on 28.02.2015.
 */
@Service("studentService")
@Transactional
public class StudentServiceImpl extends BaseServiceImpl<Student> implements StudentService {

}
