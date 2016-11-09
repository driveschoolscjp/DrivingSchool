package com.luxoft.drivingschool.repository;

import com.luxoft.drivingschool.model.Schedule;
import org.joda.time.LocalDateTime;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ScheduleRepository extends JpaRepository<Schedule, Long> {
    List<Schedule> findByInstructorIdAndStudentIdNotNull(long id);

    List<Schedule> findByInstructorIdAndStudentIdIsNull(long id);

    List<Schedule> findByInstructorIdAndStudentIdNotNullAndStartIntervalBetween(
            long id, LocalDateTime startDate, LocalDateTime finishDate);

    List<Schedule> findByInstructorId(long id);

    @Query("select s from Schedule s where s.instructor.id = ?1 and " +
            "((s.startInterval >= ?2 and s.startInterval < ?3) or " +
            "(s.finishInterval > ?2 and s.finishInterval <= ?3) or " +
            "(s.startInterval < ?2 and s.finishInterval > ?3))")
    List<Schedule> findIntersectByInstructorIdAndInterval(long id, LocalDateTime begin, LocalDateTime end);

    @Query("select s from Schedule s where s.instructor.id = ?1 and " +
            "((s.startInterval >= ?2 and s.startInterval < ?3) or " +
            "(s.finishInterval > ?2 and s.finishInterval <= ?3) or" +
            "(s.startInterval < ?2 and s.finishInterval > ?3))" +
            " and s.id <> ?4")
    List<Schedule> findIntersectByInstructorIdAndIntervalExcludeEvent(
            long teacherId, LocalDateTime start, LocalDateTime end, long eventId);
}
