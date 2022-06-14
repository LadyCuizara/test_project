package com.g2ssid.ddh_g2ssid_api.resources.project;

import com.g2ssid.ddh_g2ssid_api.controller.ContractController;
import com.g2ssid.ddh_g2ssid_api.controller.ProjectController;
import com.g2ssid.ddh_g2ssid_api.domain.model.department.Department;
import com.g2ssid.ddh_g2ssid_api.domain.model.position.Contract;
import com.g2ssid.ddh_g2ssid_api.domain.model.project.Project;
import com.g2ssid.ddh_g2ssid_api.resources.GenericResourceAssembler;
import com.g2ssid.ddh_g2ssid_api.resources.employee.ContractResource;
import org.springframework.stereotype.Component;

/**
 * @author Julio Quispe
 */
@Component
public class DepartmentResourceAssembler extends GenericResourceAssembler<Department, DepartmentResource> {

    public DepartmentResourceAssembler() {
        super(ProjectController.class, DepartmentResource.class);
    }
}
