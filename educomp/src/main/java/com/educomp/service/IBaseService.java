package com.educomp.service;

import java.util.List;

import org.springframework.data.domain.Page;

public interface IBaseService <T> {
    // read - one

    T findOne(final String id);

    // read - all

    List<T> findAll();
    
    Page<T> findPaginated(int page, int size);
    
    // write

    T create(final T entity);

    T update(final T entity);

    void delete(final T entity);

    void deleteById(final String id);

}
