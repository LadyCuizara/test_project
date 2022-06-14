package com.g2ssid.ddh_g2ssid_api.report.specification;

import com.g2ssid.ddh_g2ssid_api.domain.model.employee.GenderType;
import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.EquipmentCategory;
import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.EquipmentType;
import com.g2ssid.ddh_g2ssid_api.report.specification.generic.GenericSpecification;
import com.g2ssid.ddh_g2ssid_api.report.specification.generic.SearchCriteria;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

/**
 * @author giovanny delgadillo
 */
public class EquipmentCategorySpecification extends GenericSpecification<EquipmentCategory> {

    public EquipmentCategorySpecification(SearchCriteria criteria) {
        super(criteria);
    }

    @Override
    protected Predicate enumToPredicateRoot(Root<EquipmentCategory> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
        Predicate predicate = null;
        if (root.get(criteria.getField()).getJavaType() == EquipmentType.class) {
            try {
                predicate = criteriaBuilder.equal(root.get(criteria.getField()), EquipmentType.valueOf(criteria.getValue()));
            } catch (IllegalArgumentException e) {
                predicate = criteriaBuilder.equal(root.get(criteria.getField()), EquipmentType.fromString(criteria.getValue()));
            }
        }
        return predicate;
    }
}
