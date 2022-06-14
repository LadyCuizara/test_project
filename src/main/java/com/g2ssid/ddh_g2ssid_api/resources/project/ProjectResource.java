package com.g2ssid.ddh_g2ssid_api.resources.project;

import com.g2ssid.ddh_g2ssid_api.domain.model.department.Department;
import com.g2ssid.ddh_g2ssid_api.domain.model.project.Project;
import com.g2ssid.ddh_g2ssid_api.domain.model.project.ProjectStatusType;
import com.g2ssid.ddh_g2ssid_api.resources.GenericResource;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;

/**
 * @author Julio Quispe
 */
public class ProjectResource extends GenericResource<Project> {

    private String name;
    private String description;
    private String place;
    private ProjectStatusType statusProject;



    @Override
    public Project toEntity() {
        Project project = new Project();
        project.setName(getName());
        project.setDescription(getDescription());
        project.setPlace(getPlace());
        project.setStatusProject(getStatusProject());
        return project;
    }

    @Override
    public void updateFromEntity(Project project) {
        setName(project.getName());
        setDescription(project.getDescription());
        setPlace(project.getPlace());
        setStatusProject(project.getStatusProject());
    }

    @Override
    public void addLinks() {

    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public ProjectStatusType getStatusProject() {
        return statusProject;
    }

    public void setStatusProject(ProjectStatusType statusProject) {
        this.statusProject = statusProject;
    }
}

