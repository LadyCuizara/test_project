package com.g2ssid.ddh_g2ssid_api.report.specification;

import com.g2ssid.ddh_g2ssid_api.domain.model.employee.GenderType;
import com.g2ssid.ddh_g2ssid_api.domain.model.position.EmployeeType;
import com.g2ssid.ddh_g2ssid_api.report.specification.generic.GenericSpecification;
import com.g2ssid.ddh_g2ssid_api.report.specification.generic.SearchCriteria;
import com.g2ssid.ddh_g2ssid_api.domain.model.position.Contract;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;


public class ContractSpecification extends GenericSpecification<Contract> {

    public ContractSpecification(SearchCriteria criteria) {
        super(criteria);
    }

    @Override
    protected Predicate enumToPredicateRoot(Root<Contract> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
        Predicate predicate = null;
        if (root.get(criteria.getField()).getJavaType() == EmployeeType.class) {
            try {
                // lets try with the Enum Name first
                predicate = criteriaBuilder.equal(root.get(criteria.getField()), EmployeeType.valueOf(criteria.getValue()));
            } catch (IllegalArgumentException e) {
                // lets try using the Enum values
                predicate = criteriaBuilder.equal(root.get(criteria.getField()), EmployeeType.fromString(criteria.getValue()));
            }
        }
        return predicate;
    }

}
