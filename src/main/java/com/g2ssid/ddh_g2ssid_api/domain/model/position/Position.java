package com.g2ssid.ddh_g2ssid_api.domain.model.position;

import com.g2ssid.ddh_g2ssid_api.domain.model.base.BaseEntityAudit;
import com.g2ssid.ddh_g2ssid_api.domain.model.department.Department;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * @author giovanny delgadillo
 */
@Entity
@Table(name = "position")
public class Position extends BaseEntityAudit {

    private String name;
    private String description;

    @OneToMany(mappedBy = "position", fetch = FetchType.EAGER, cascade = {CascadeType.ALL})
    private Set<Contract> contracts = new HashSet<>();

    @ManyToMany(mappedBy  = "positions")
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

    public Set<Contract> getContracts() {
        return contracts;
    }

    public void setContracts(Set<Contract> contracts) {
        this.contracts = contracts;
    }

    public void merge(Position newPosition) {
        if(newPosition.getName() != null) {
            this.setName(newPosition.getName());
        }
        if (newPosition.getDescription() != null) {
            this.setDescription(getDescription());
        }
    }

    public Set<Department> getDepartments() {
        return departments;
    }

    public void setDepartments(Set<Department> departments) {
        this.departments = departments;
    }
}
