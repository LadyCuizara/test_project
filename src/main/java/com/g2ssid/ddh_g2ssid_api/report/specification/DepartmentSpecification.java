package com.g2ssid.ddh_g2ssid_api.report.specification;

import com.g2ssid.ddh_g2ssid_api.report.specification.generic.GenericSpecification;
import com.g2ssid.ddh_g2ssid_api.report.specification.generic.SearchCriteria;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

public class DepartmentSpecification <Department> extends GenericSpecification<Department> {

    public DepartmentSpecification(SearchCriteria criteria) {
        super(criteria);
    }

    @Override
    protected Predicate enumToPredicateRoot(Root<Department> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
        return null;
    }
}
