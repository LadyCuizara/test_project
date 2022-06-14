package com.g2ssid.ddh_g2ssid_api.service;

import com.g2ssid.ddh_g2ssid_api.domain.model.employee.Employee;
import org.springframework.data.jpa.domain.Specification;

import java.io.InputStream;
import java.util.List;

/**
 * @author giovanny delgadillo
 */
public interface EmployeeService extends GenericService<Employee> {
    void savePicture(Long id, InputStream inputStream);

}
