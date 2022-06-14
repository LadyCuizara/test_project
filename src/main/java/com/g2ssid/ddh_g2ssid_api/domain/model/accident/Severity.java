package com.g2ssid.ddh_g2ssid_api.domain.model.accident;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.g2ssid.ddh_g2ssid_api.serialization.EnumSerializable;
import com.g2ssid.ddh_g2ssid_api.serialization.SeveritySerializer;

/**
 * @author Michel Terrazas Mercado
 */
@JsonSerialize(using = SeveritySerializer.class)
public enum  Severity implements EnumSerializable{

    SEVERE("grave"),
    MODERATE("moderada"),
    MILD("leve");

    private String value;

    private Severity (String value){

        this.value = value;
    }

    public void setValue(String value) {
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
}
