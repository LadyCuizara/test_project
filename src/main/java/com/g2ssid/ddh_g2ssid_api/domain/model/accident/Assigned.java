package com.g2ssid.ddh_g2ssid_api.domain.model.accident;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.g2ssid.ddh_g2ssid_api.serialization.AssignedSerializer;
import com.g2ssid.ddh_g2ssid_api.serialization.EnumSerializable;

/**
 * @author Michel Terrazas Mercado
 */
@JsonSerialize(using = AssignedSerializer.class)
public enum  Assigned implements EnumSerializable{

    YES ("si"),
    NOT ("no");

    private String value;

    private Assigned (String value){

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
