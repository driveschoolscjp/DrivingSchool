package com.luxoft.DrivingSchool.DAO.impl;

import com.luxoft.DrivingSchool.DAO.GenericDAO;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

public abstract class GenericDAOImpl<T> implements GenericDAO<T> {

    Class<T> clazz;

    protected void setClazz(Class<T> clazz) {
        this.clazz = clazz;
    }

    @PersistenceContext
    private EntityManager entityManager;

    protected EntityManager getEntityManager() {
        return entityManager;
    }

    @Override
    public T findOne(long id) {
        return entityManager.find(clazz, id);
    }

    @Override
    public List<T> findAll() {
        return entityManager.createQuery("from " + clazz.getName()).getResultList();
    }

    @Override
    public T saveOrUpdate(T entity) {
        return entityManager.merge(entity);
    }

    @Override
    public void delete(T entity) {
        entityManager.remove(entity);
    }
}
