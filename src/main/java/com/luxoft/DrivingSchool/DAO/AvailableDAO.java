package com.luxoft.DrivingSchool.DAO;

import com.luxoft.DrivingSchool.model.Available;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AvailableDAO extends JpaRepository<Available, Long> {
}
