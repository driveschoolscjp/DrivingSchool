package com.luxoft.drivingschool.repository;

import com.luxoft.drivingschool.model.Busy;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BusyRepository extends JpaRepository<Busy, Long> {
}
