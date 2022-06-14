package com.g2ssid.ddh_g2ssid_api.report.specification;

import com.g2ssid.ddh_g2ssid_api.domain.model.employee.GenderType;
import com.g2ssid.ddh_g2ssid_api.report.specification.generic.GenericSpecification;
import com.g2ssid.ddh_g2ssid_api.report.specification.generic.SearchCriteria;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

/**
 * @author giovanny delgadillo
 */
public class EmployeeSpecification<Employee> extends GenericSpecification<Employee> {

    public EmployeeSpecification(SearchCriteria criteria) {
        super(criteria);
    }

    @Override
    protected Predicate enumToPredicateRoot(Root<Employee> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
        Predicate predicate = null;
        if (root.get(criteria.getField()).getJavaType() == GenderType.class) {
            // have the option to filter enum by Enum name (MALE) and Enum value ("Masculino")
            try {
                // lets try with the Enum Name first
                predicate = criteriaBuilder.equal(root.get(criteria.getField()), GenderType.valueOf(criteria.getValue()));
            } catch (IllegalArgumentException e) {
                // lets try using the Enum values
                predicate = criteriaBuilder.equal(root.get(criteria.getField()), GenderType.fromString(criteria.getValue()));
            }
        }
        return predicate;
    }
}
