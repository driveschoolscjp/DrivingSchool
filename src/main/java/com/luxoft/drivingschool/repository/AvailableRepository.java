package com.luxoft.drivingschool.repository;

import com.luxoft.drivingschool.model.Available;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AvailableRepository extends JpaRepository<Available, Long> {
}
