package com.g2ssid.ddh_g2ssid_api.domain.repository;

import com.g2ssid.ddh_g2ssid_api.domain.model.employee.Employee;
import org.springframework.data.jpa.domain.Specification;

import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.PersistenceContext;
import javax.persistence.StoredProcedureQuery;
import java.util.List;

public class EmployeeRepositoryImpl implements EmployeeRepositoryCustom {

    @PersistenceContext
    private EntityManager em;


    @Override
    public List<Employee> getAllEmployees(Specification<Employee> spec) {
        StoredProcedureQuery spGetAllEmployees =
                em.createNamedStoredProcedureQuery("getAllEmployees");
        return spGetAllEmployees.getResultList();
    }

    @Override
    public Employee getEmployee(long id) {
        StoredProcedureQuery spGetEmployee =
                em.createNamedStoredProcedureQuery("getEmployee");

        spGetEmployee.setParameter("id", id);
        Employee result = (Employee) spGetEmployee.getSingleResult();
        return result;
    }

}
