package com.g2ssid.ddh_g2ssid_api.resources.project;

import com.g2ssid.ddh_g2ssid_api.domain.model.department.Department;
import com.g2ssid.ddh_g2ssid_api.resources.GenericResource;

/**
 * @author Julio Quispe
 */
public class DepartmentResource extends GenericResource<Department> {

    private String name;
    private String description;

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

    @Override
    public Department toEntity() {
        Department department = new Department();
        department.setName(getName());
        department.setDescription(getDescription());
        return department;
    }

    @Override
    public void updateFromEntity(Department department) {
        setName(department.getName());
        setDescription(department.getDescription());
    }

    @Override
    public void addLinks() {

    }
}

