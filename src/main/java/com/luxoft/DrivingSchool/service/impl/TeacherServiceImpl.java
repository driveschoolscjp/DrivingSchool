package com.luxoft.DrivingSchool.service.impl;

import com.luxoft.DrivingSchool.model.Teacher;
import com.luxoft.DrivingSchool.service.TeacherService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Aleksei Chumakov on 28.02.2015.
 */
@Service("teacherService")
@Transactional
public class TeacherServiceImpl extends BaseServiceImpl<Teacher> implements TeacherService {
}
