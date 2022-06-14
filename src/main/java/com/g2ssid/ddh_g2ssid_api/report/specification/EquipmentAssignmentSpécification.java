package com.g2ssid.ddh_g2ssid_api.report.specification;

import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.EquipmentAssignment;
import com.g2ssid.ddh_g2ssid_api.report.specification.generic.GenericSpecification;
import com.g2ssid.ddh_g2ssid_api.report.specification.generic.SearchCriteria;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

public class EquipmentAssignmentSpécification extends GenericSpecification<EquipmentAssignment> {
    public EquipmentAssignmentSpécification(SearchCriteria criteria) {super(criteria);}

    @Override
    protected Predicate enumToPredicateRoot(Root<EquipmentAssignment> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
        return null;
    }
}
