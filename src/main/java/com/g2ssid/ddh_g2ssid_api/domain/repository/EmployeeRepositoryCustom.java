package com.g2ssid.ddh_g2ssid_api.domain.repository;

import com.g2ssid.ddh_g2ssid_api.domain.model.employee.Employee;
import org.springframework.data.jpa.domain.Specification;

import java.util.List;

/**
 * @author giovanny delgadillo
 */
public interface EmployeeRepositoryCustom {
    List<Employee> getAllEmployees(Specification<Employee> spec);
    Employee getEmployee(long id);
}
