package com.g2ssid.ddh_g2ssid_api.resources.employee;

import com.g2ssid.ddh_g2ssid_api.controller.EmployeeController;
import com.g2ssid.ddh_g2ssid_api.domain.model.employee.Employee;
import com.g2ssid.ddh_g2ssid_api.resources.GenericResourceAssembler;
import org.springframework.stereotype.Component;

/**
 * @author giovanny delgadillo
 */
@Component
public class EmployeeResourceAssembler extends GenericResourceAssembler<Employee, EmployeeResource> {

    public EmployeeResourceAssembler() {
        super(EmployeeController.class, EmployeeResource.class);
    }
}
