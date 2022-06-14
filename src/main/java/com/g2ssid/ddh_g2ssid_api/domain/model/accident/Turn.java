package com.g2ssid.ddh_g2ssid_api.domain.model.accident;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.g2ssid.ddh_g2ssid_api.serialization.EnumSerializable;
import com.g2ssid.ddh_g2ssid_api.serialization.TurnSerializer;

/**
 * @author Michel Terrazas Mercado
 */
@JsonSerialize(using = TurnSerializer.class)
public enum  Turn implements EnumSerializable {

    MORNING("mañana"),
    AFTERNOON("tarde"),
    NIGHT("noche");

    private String value;

    private Turn (String value){

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
