package com.luxoft.drivingschool.service.impl;

import com.luxoft.drivingschool.model.Schedule;
import com.luxoft.drivingschool.service.ScheduleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Aleksei Chumakov on 28.02.2015.
 */
@Service("scheduleService")
@Transactional
public class ScheduleServiceImpl extends BaseServiceImpl<Schedule> implements ScheduleService {
}
