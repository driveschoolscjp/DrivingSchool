package com.luxoft.drivingschool.service.impl;

import com.luxoft.drivingschool.model.Group;
import com.luxoft.drivingschool.service.GroupService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Aleksei Chumakov on 28.02.2015.
 */
@Service("groupService")
@Transactional
public class GroupServiceImpl extends BaseServiceImpl<Group> implements GroupService {
}
