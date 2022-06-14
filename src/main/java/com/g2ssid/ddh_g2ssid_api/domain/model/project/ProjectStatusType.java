package com.g2ssid.ddh_g2ssid_api.domain.model.project;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.g2ssid.ddh_g2ssid_api.domain.model.employee.GenderType;
import com.g2ssid.ddh_g2ssid_api.serialization.EnumSerializable;
import com.g2ssid.ddh_g2ssid_api.serialization.GenderTypeSerializer;
import com.g2ssid.ddh_g2ssid_api.serialization.ProjectStatusTypeSerializer;

/**
 * @author Julio Quispe
 */
@JsonSerialize(using = ProjectStatusTypeSerializer.class)
public enum ProjectStatusType implements EnumSerializable {
    CREATED("Creado"),
    STARTED("Iniciado"),
    COMPLETED("Completado"),
    CANCELLED("Cancelado"),
    ONHOLD("Pausado");

    private String value;

    private ProjectStatusType(String value) {
        this.value = value;
    }

    @Override
    public String getKey() {
        return this.name();
    }

    @Override
    public String getValue() {
        return value;
    }

    public static ProjectStatusType fromString(String text) {
        for (ProjectStatusType projectState : ProjectStatusType.values()) {
            if (projectState.getKey().equalsIgnoreCase(text) || projectState.value.equalsIgnoreCase(text)) {
                return projectState;
            }
        }
        return null;
    }
}
