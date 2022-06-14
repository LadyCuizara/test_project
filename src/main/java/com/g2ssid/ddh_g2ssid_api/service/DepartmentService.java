package com.g2ssid.ddh_g2ssid_api.service;

import com.g2ssid.ddh_g2ssid_api.domain.model.department.Department;

import java.util.List;

public interface DepartmentService extends GenericService<Department> {

    public List<Department> getDepartmentsByProject(Long projectId);
}
