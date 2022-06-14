package com.g2ssid.ddh_g2ssid_api.domain.model.department;

import com.g2ssid.ddh_g2ssid_api.domain.model.base.BaseEntityAudit;
import com.g2ssid.ddh_g2ssid_api.domain.model.position.Position;
import com.g2ssid.ddh_g2ssid_api.domain.model.project.Project;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

/**
 * @author Judith Delgadillo
 */

@Entity
@Table(name ="department")
public class Department extends BaseEntityAudit {

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String description;

    @ManyToMany(mappedBy  = "departments")
    private Set<Project> projects;

    @ManyToMany(
            cascade=CascadeType.DETACH, fetch=FetchType.LAZY)
    @JoinTable(name = "department_position",
            joinColumns = { @JoinColumn(name = "department_id", referencedColumnName = "id",  nullable = false) },
            inverseJoinColumns = { @JoinColumn(name = "position_id", referencedColumnName = "id",  nullable = false)
            })
    private Set<Position> positions;

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

    public void merge(Department newDepartment) {
        if(newDepartment.getName() != null) {
            this.setName(newDepartment.getName());
        }
        if(newDepartment.getDescription() != null) {
            this.setDescription(newDepartment.getDescription());
        }
    }

    public Set<Project> getProjects() {
        return projects;
    }

    public void setProjects(Set<Project> projects) {
        this.projects = projects;
    }

    public Set<Position> getPositions() {
        return positions;
    }

    public void setPositions(Set<Position> positions) {
        this.positions = positions;
    }
}
