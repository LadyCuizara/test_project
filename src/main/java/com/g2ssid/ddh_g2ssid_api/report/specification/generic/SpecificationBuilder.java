package com.g2ssid.ddh_g2ssid_api.report.specification.generic;

import org.springframework.data.jpa.domain.Specification;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author giovanny delgadillo
 */
public class SpecificationBuilder<T> {

   public Specification<T> build(String query, Class<? extends GenericSpecification> specification) {
        List<SearchCriteria> criterias = SearchCriteria.parse(query);

        if (criterias.size() == 0) {
            return null;
        }

        List<Specification<T>> specs = new ArrayList<>();
       try {

           for (SearchCriteria criteria : criterias) {
               if (criteria.getField() == null || criteria.getField().isEmpty()) {
                   continue;
               }
                GenericSpecification<T> instance;
                Constructor specConstructor = specification.getConstructor(SearchCriteria.class);
                instance = (GenericSpecification) specConstructor.newInstance(criteria);
                //instance.criteria =  criteria;
                specs.add(instance);
            }
       } catch (InstantiationException e) {
           // TODO logs all these exceptions.
           e.printStackTrace();
       } catch (IllegalAccessException e) {
           e.printStackTrace();
       } catch (NoSuchMethodException e) {
           e.printStackTrace();
       } catch (InvocationTargetException e) {
           e.printStackTrace();
       }

       Specification<T> result = specs.get(0);
       for (int i = 1; i < specs.size(); i++) {
           result = Specification.where(result).and(specs.get(i));
       }
       return result;
   }
}
