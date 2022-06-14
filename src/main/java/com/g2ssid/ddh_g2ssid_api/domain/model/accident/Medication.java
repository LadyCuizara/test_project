package com.g2ssid.ddh_g2ssid_api.domain.model.accident;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.g2ssid.ddh_g2ssid_api.serialization.EnumSerializable;
import com.g2ssid.ddh_g2ssid_api.serialization.MedicationSerializer;

/**
 * @author Michel Terrazas Mercado
 */
@JsonSerialize(using = MedicationSerializer.class)
public enum  Medication implements EnumSerializable{

    WITH ("con tiempo perdido"),
    WITHOUT ("sin tiempo perdido");

    private String value;

    private Medication (String value){

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
