package com.luxoft.DrivingSchool.repository;

import com.luxoft.DrivingSchool.model.Busy;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BusyRepository extends JpaRepository<Busy, Long> {
}
