package com.g2ssid.ddh_g2ssid_api.report.specification;

import com.g2ssid.ddh_g2ssid_api.domain.model.employee.GenderType;
import com.g2ssid.ddh_g2ssid_api.domain.model.project.Project;
import com.g2ssid.ddh_g2ssid_api.domain.model.project.ProjectStatusType;
import com.g2ssid.ddh_g2ssid_api.report.specification.generic.GenericSpecification;
import com.g2ssid.ddh_g2ssid_api.report.specification.generic.SearchCriteria;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

/**
 * @author Julio Quispe
 * @param <Project>
 */
public class ProjectSpecification<Project> extends GenericSpecification<Project> {

    public ProjectSpecification(SearchCriteria criteria) {
        super(criteria);
    }

    @Override
    protected Predicate enumToPredicateRoot(Root<Project> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
        Predicate predicate = null;
        if (root.get(criteria.getField()).getJavaType() == ProjectStatusType.class) {
            try {
                predicate = criteriaBuilder.equal(root.get(criteria.getField()), ProjectStatusType.valueOf(criteria.getValue()));
            } catch (IllegalArgumentException e) {
                predicate = criteriaBuilder.equal(root.get(criteria.getField()), ProjectStatusType.fromString(criteria.getValue()));
            }
        }
        return predicate;
    }
}
