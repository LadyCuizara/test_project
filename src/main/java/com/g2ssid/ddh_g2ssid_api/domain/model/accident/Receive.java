package com.g2ssid.ddh_g2ssid_api.domain.model.accident;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.g2ssid.ddh_g2ssid_api.serialization.EnumSerializable;
import com.g2ssid.ddh_g2ssid_api.serialization.ReceiveSerializer;

/**
 * @author Michel Terrazas Mercado
 */
@JsonSerialize(using = ReceiveSerializer.class)
public enum  Receive implements EnumSerializable{

    FIRSTAID ("primeros auxilios"),
    TREATMENT ("tratamiento medico, fue llevado al hospital");

    private String value;

    private Receive (String value){

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
