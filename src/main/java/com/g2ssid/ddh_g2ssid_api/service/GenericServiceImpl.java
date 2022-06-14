package com.g2ssid.ddh_g2ssid_api.service;

import com.g2ssid.ddh_g2ssid_api.domain.repository.GenericRepository;
import com.g2ssid.ddh_g2ssid_api.exceptions.NotFoundException;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static com.sun.org.apache.bcel.internal.Repository.getRepository;

/**
 * @author giovanny delgadillo
 */
@Service
public abstract class GenericServiceImpl<T> implements GenericService<T> {
    @Override
    public List<T> findAll() {
        List<T> results = new ArrayList<>();
        getRepository().findAll().forEach(results::add);
        return results;
    }

    @Override
    public List<T> findAll(Specification<T> spec) {
        List<T> results = new ArrayList<>();
        getRepository().findAll(spec).forEach(results::add);
        return results;
    }

    @Override
    public T findById(Long id) {
        Optional<T> optional = getRepository().findById(id);
        if (!optional.isPresent()) {
            String typeName = (((ParameterizedType) getClass()
                    .getGenericSuperclass()).getActualTypeArguments()[0]).getTypeName();
            typeName = typeName.substring(typeName.lastIndexOf(".") + 1);
            throw new NotFoundException(typeName + " id:" + id + " Not Found");
        }
        return optional.get();
    }

    @Override
    public T save(T model) {
        return getRepository().save(model);
    }

    @Override
    public void deleteById(Long id) {
        getRepository().deleteById(id);
    }

    protected abstract GenericRepository<T> getRepository();
}
