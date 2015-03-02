package com.luxoft.drivingschool.repository;

import com.luxoft.drivingschool.model.Group;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Aleksei Chumakov on 28.02.2015.
 */
public interface GroupRepository extends JpaRepository<Group, Long> {
}