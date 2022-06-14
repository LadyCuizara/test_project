package com.g2ssid.ddh_g2ssid_api.domain.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.NoRepositoryBean;

/**
 * @author giovanny delgadillo
 */
@NoRepositoryBean
public interface GenericRepository<T> extends CrudRepository<T, Long>, JpaSpecificationExecutor<T> {
}
