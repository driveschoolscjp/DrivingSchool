package com.luxoft.DrivingSchool.DAO;

import com.luxoft.DrivingSchool.model.Busy;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BusyDAO extends JpaRepository<Busy, Long> {
}
