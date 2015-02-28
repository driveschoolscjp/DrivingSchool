package com.luxoft.DrivingSchool.service.impl;

import com.luxoft.DrivingSchool.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.AbstractPersistable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by Aleksei Chumakov on 28.02.2015.
 */
public abstract class BaseServiceImpl<T extends AbstractPersistable<Long>> implements BaseService<T> {
    @Autowired
    private JpaRepository<T, Long> repository;

    public T create(T object) {
        return repository.saveAndFlush(object);
    }

    public void delete(long id) {
        repository.delete(id);
    }

    public T update(T object) {
        return repository.saveAndFlush(object);
    }

    public List<T> getAll() {
        return repository.findAll();
    }
}
