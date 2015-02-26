package com.luxoft.DrivingSchool.DAO;

import java.util.List;

public interface GenericDAO<T> {

    T findOne(long id);

    List<T> findAll();

    T saveOrUpdate(final T entity);

    void delete(final T entity);
}
