package com.g2ssid.ddh_g2ssid_api.domain.model.accident;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.g2ssid.ddh_g2ssid_api.serialization.EnumSerializable;
import com.g2ssid.ddh_g2ssid_api.serialization.FrecuencySerializer;

/**
 * @author Michel Terrazas Mercado
 */
@JsonSerialize(using = FrecuencySerializer.class)
public enum  Frecuency implements EnumSerializable{

    YES ("si"),
    NOT ("no");


    private String value;

    private Frecuency (String value){

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
