package com.g2ssid.ddh_g2ssid_api.domain.model.position;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.g2ssid.ddh_g2ssid_api.domain.model.employee.Employee;
import com.g2ssid.ddh_g2ssid_api.serialization.EnumSerializable;
import com.g2ssid.ddh_g2ssid_api.serialization.EnumSerializer;

/**
 * @author giovanny delgadillo
 */
@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum EmployeeType implements EnumSerializable {

    FULLTIME("Tiempo Completo"),
    HALFTIME("Medio Tiempo"),
    PARTTIME("Tiempo Parcial");

    private String value;

    private EmployeeType(String value) {
        this.value = value;
    }

    @Override
    public String getKey() {
        return this.name();
    }

    @Override
    public String getValue() { return value; }

    public static EmployeeType fromString(String text) {
        for (EmployeeType employeeType: EmployeeType.values()) {
            if (employeeType.getKey().equalsIgnoreCase(text) || employeeType.value.equalsIgnoreCase(text)) {
                return employeeType;
            }
        }
        return null;
    }
}
