package com.g2ssid.ddh_g2ssid_api.service;

import org.springframework.data.jpa.domain.Specification;

import java.util.List;

/**
 * @author giovanny delgadillo
 */
public interface GenericService<T> {

    List<T> findAll();

    List<T> findAll(Specification<T> specification);

    T findById(Long id);

    T save(T model);

    void deleteById(Long id);
}
