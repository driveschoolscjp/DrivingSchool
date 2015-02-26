package com.luxoft.DrivingSchool.DAO;

import org.springframework.data.domain.Persistable;

import java.util.List;

public interface GenericDAO<T extends Persistable<Long>> {

    T findOne(long id);

    List<T> findAll();

    T saveOrUpdate(final T entity);

    void delete(final T entity);
}
