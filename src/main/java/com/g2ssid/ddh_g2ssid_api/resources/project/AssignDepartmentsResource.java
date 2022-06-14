package com.g2ssid.ddh_g2ssid_api.resources.project;

import java.util.List;

/**
 * @author Julio Quispe
 */
public class AssignDepartmentsResource {
    List<Long> listDepartments;

    public List<Long> getListDepartments() {
        return listDepartments;
    }

    public void setListDepartments(List<Long> listDepartments) {
        this.listDepartments = listDepartments;
    }
}
