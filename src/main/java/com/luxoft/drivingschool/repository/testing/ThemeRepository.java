package com.luxoft.drivingschool.repository.testing;

import com.luxoft.drivingschool.model.testing.Theme;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by SCJP on 06.03.2015.
 */
public interface ThemeRepository extends JpaRepository<Theme, Long> {
}
