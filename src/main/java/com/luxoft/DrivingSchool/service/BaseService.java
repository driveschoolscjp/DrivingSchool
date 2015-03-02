package com.luxoft.drivingschool.service;

import java.util.List;

/**
 * Created by Aleksei Chumakov on 28.02.2015.
 */
public interface BaseService<T> {
    T create(T object);
    void delete(long id);
    T update(T object);
    List<T> getAll();
}
