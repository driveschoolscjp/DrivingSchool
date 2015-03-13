package com.luxoft.drivingschool.repository;


import com.luxoft.drivingschool.model.Roadsign;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Set;

public interface RoadsignRepository extends JpaRepository<Roadsign, Long> {

    List<Roadsign> findByIdIn(Set<Long> setId);
}
