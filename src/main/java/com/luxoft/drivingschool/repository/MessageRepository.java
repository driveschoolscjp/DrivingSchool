package com.luxoft.drivingschool.repository;

import com.luxoft.drivingschool.model.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface MessageRepository extends JpaRepository<Message, Long> {
    @Query("select count(m) from Message m where m.student.id = ?1 and m.old = false")
    Long getCountOfNewMessages(Long id);

    List<Message> findByStudentId(Long id);

    List<Message> findFirst10MessageByStudentIdAndIdLessThanOrderByDateTimeDesc(Long student_id, Long message_id);

    List<Message> findFirst10MessageByStudentIdAndIdGreaterThanOrderByDateTimeAsc(Long student_id, Long message_id);

    List<Message> findFirst10MessageByStudentIdAndIdLessThanEqualOrderByDateTimeDesc(Long student_id, Long message_id);

    List<Message> findFirst10MessageByStudentIdOrderByDateTimeDesc(Long student_id);

    Long countByStudentId(Long id);
}
