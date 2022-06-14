package com.g2ssid.ddh_g2ssid_api.report.specification.generic;

import org.springframework.data.jpa.domain.Specification;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @author giovanny delgadillo
 */
public abstract class GenericSpecification<T> implements Specification<T> {

    protected SearchCriteria criteria;

    public GenericSpecification(SearchCriteria criteria) {
        this.criteria = criteria;
    }

    @Override
    public Predicate toPredicate(Root<T> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
        // TODO this method will grow up a lot, maybe will be better separate it in classes, EnumSpecification, DateSpecification, etc.
        // We really need refactor for this xD xD
        if (criteria.getOperator().equalsIgnoreCase(SearchCriteria.GREATER_THAN)) {
            return criteriaBuilder.greaterThanOrEqualTo(
                    root.get(criteria.getField()), criteria.getValue());
        }
        else if (criteria.getOperator().equalsIgnoreCase(SearchCriteria.LESS_THAN)) {
            return criteriaBuilder.lessThanOrEqualTo(
                    root.get(criteria.getField()), criteria.getValue());
        }
        else if (criteria.getOperator().equalsIgnoreCase(SearchCriteria.EQUAL)) {
            if (root.get(criteria.getField()).getJavaType() == String.class) {
                return criteriaBuilder.like(
                        root.get(criteria.getField()), "%" + criteria.getValue() + "%");
            } else if (root.get(criteria.getField()).getJavaType().isEnum()){
                return enumToPredicateRoot(root, criteriaQuery, criteriaBuilder);
            } else if (root.get(criteria.getField()).getJavaType() == Date.class) {
                Calendar cal = Calendar.getInstance();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-dd");
                try {
                    cal.setTime(sdf.parse(criteria.getValue()));
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                Date date = new Date(cal.getTime().getTime());
                return criteriaBuilder.equal(root.get(criteria.getField()), criteriaBuilder.literal(date));
            } else {
                return criteriaBuilder.equal(root.get(criteria.getField()), criteria.getValue());
            }
        } else if (criteria.getOperator().equalsIgnoreCase(SearchCriteria.BETWEEN)) {
            String[] dates = criteria.getValue().split(";");
            if (dates.length < 2) {
                return null;
            }

            Calendar cal1 = Calendar.getInstance();
            Calendar cal2 = Calendar.getInstance();
            SimpleDateFormat sdf = new SimpleDateFormat("yyy-M-dd");
            try {
                cal1.setTime(sdf.parse(dates[0]));
                cal2.setTime(sdf.parse(dates[1]));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            Date date1 = new Date(cal1.getTime().getTime());
            Date date2 = new Date(cal2.getTime().getTime());
            return criteriaBuilder.between(root.get(criteria.getField()), date1, date2);
        }
        return null;
    }
    protected abstract Predicate enumToPredicateRoot(Root<T> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder);
}
