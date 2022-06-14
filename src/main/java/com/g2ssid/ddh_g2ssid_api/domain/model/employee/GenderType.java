package com.g2ssid.ddh_g2ssid_api.domain.model.employee;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.g2ssid.ddh_g2ssid_api.serialization.EnumSerializable;
import com.g2ssid.ddh_g2ssid_api.serialization.EnumSerializer;
import com.g2ssid.ddh_g2ssid_api.serialization.GenderTypeSerializer;

/**
 * @author giovanny delgadillo
 */
@JsonSerialize(using = GenderTypeSerializer.class)
public enum GenderType implements EnumSerializable {
    FEMALE("Femenino"),
    MALE("Masculino");

    private String value;

    private GenderType(String value) {
        this.value = value;
    }

    @Override
    public String getKey() {
        return this.name();
    }

    @Override
    public String getValue() {
        return this.value;
    }

    public static GenderType fromString(String text) {
        for (GenderType gender : GenderType.values()) {
            if (gender.getKey().equalsIgnoreCase(text) || gender.value.equalsIgnoreCase(text)) {
                return gender;
            }
        }
        return null;
    }
}
