package com.g2ssid.ddh_g2ssid_api.report.specification;

import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.Equipment;
import com.g2ssid.ddh_g2ssid_api.report.specification.generic.GenericSpecification;
import com.g2ssid.ddh_g2ssid_api.report.specification.generic.SearchCriteria;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

/**
 * @author giovanny delgadillo
 */
public class EquipmentSpecification extends GenericSpecification<Equipment> {

    public EquipmentSpecification(SearchCriteria criteria) {
        super(criteria);
    }

    @Override
    protected Predicate enumToPredicateRoot(Root<Equipment> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
        return null;
    }
}
