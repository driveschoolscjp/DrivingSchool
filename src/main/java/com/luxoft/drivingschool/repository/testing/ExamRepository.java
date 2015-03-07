package com.luxoft.drivingschool.repository.testing;

import com.luxoft.drivingschool.model.testing.Exam;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Svetlana Lawrentyeva on 07.03.15.
 */
public interface ExamRepository extends JpaRepository<Exam, Long> {
}
