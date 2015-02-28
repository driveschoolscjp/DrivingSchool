package com.luxoft.DrivingSchool.service.impl;

import com.luxoft.DrivingSchool.model.Group;
import com.luxoft.DrivingSchool.service.GroupService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Aleksei Chumakov on 28.02.2015.
 */
@Service("groupService")
@Transactional
public class GroupServiceImpl extends BaseServiceImpl<Group> implements GroupService {
}
