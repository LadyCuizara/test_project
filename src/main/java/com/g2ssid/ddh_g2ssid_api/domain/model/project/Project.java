package com.g2ssid.ddh_g2ssid_api.domain.model.project;

import com.g2ssid.ddh_g2ssid_api.domain.model.base.BaseEntityAudit;
import com.g2ssid.ddh_g2ssid_api.domain.model.department.Department;


import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.Set;

/**
 * @author Julio Quispe 
 */
@Entity
@Table(name = "project")
public class Project extends BaseEntityAudit {

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String description;

    @Column(nullable = false)
    private String place;

    @Enumerated(value = EnumType.STRING)
    @Column(length = 16)
    private ProjectStatusType statusProject;

    @ManyToMany(
            cascade=CascadeType.DETACH, fetch=FetchType.LAZY) //delete user and user_role, not delete role
    @JoinTable(name = "project_department",
            joinColumns = { @JoinColumn(name = "project_id", referencedColumnName = "id",  nullable = false) },
            inverseJoinColumns = { @JoinColumn(name = "department_id", referencedColumnName = "id",  nullable = false)
            })
    private Set<Department> departments;

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

    public Set<Department> getDepartments() {
        return departments;
    }

    public void setDepartments(Set<Department> departments) {
        this.departments = departments;
    }

    public void merge(Project newProject) {

        if (newProject.getName() != null) {
            this.setName(newProject.getName());
        }
        if (newProject.getDescription() != null) {
            this.setDescription(newProject.getDescription());
        }
        if (newProject.getPlace() != null) {
            this.setPlace(newProject.getPlace());
        }
        if (newProject.getStatusProject() != null) {
            this.setStatusProject(newProject.getStatusProject());
        }
    }
}
