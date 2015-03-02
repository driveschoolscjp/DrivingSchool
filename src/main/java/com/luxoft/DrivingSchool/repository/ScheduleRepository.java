package com.luxoft.drivingschool.repository;

import com.luxoft.drivingschool.model.Schedule;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Aleksei Chumakov on 28.02.2015.
 */
public interface ScheduleRepository extends JpaRepository<Schedule, Long> {
}
