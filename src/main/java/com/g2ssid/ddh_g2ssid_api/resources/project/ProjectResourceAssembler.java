package com.g2ssid.ddh_g2ssid_api.resources.project;

import com.g2ssid.ddh_g2ssid_api.controller.ProjectController;
import com.g2ssid.ddh_g2ssid_api.domain.model.department.Department;
import com.g2ssid.ddh_g2ssid_api.domain.model.project.Project;
import com.g2ssid.ddh_g2ssid_api.resources.GenericResourceAssembler;
import org.springframework.stereotype.Component;

/**
 * @author Julio Quispe
 */
@Component
public class ProjectResourceAssembler extends GenericResourceAssembler<Project, ProjectResource> {

    public ProjectResourceAssembler() {
        super(ProjectController.class, ProjectResource.class);
    }
}
