package com.luxoft.drivingschool.service.impl;

import com.luxoft.drivingschool.model.Teacher;
import com.luxoft.drivingschool.repository.TeacherRepository;
import com.luxoft.drivingschool.service.TeacherService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Aleksei Chumakov on 28.02.2015.
 */
@Service("teacherService")
@Transactional
public class TeacherServiceImpl extends BaseServiceImpl<Teacher> implements TeacherService {
    public Teacher findByLogin(String login) {
        return ((TeacherRepository)getRepository()).findByLogin(login);
    }
}
