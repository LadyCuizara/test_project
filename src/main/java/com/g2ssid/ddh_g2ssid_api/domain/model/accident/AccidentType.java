package com.g2ssid.ddh_g2ssid_api.domain.model.accident;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.g2ssid.ddh_g2ssid_api.serialization.AccidentTypeSerializer;
import com.g2ssid.ddh_g2ssid_api.serialization.EnumSerializable;

/**
 * @author Michel Terrazas Mercado
 *
 */

@JsonSerialize(using = AccidentTypeSerializer.class)
public enum  AccidentType implements EnumSerializable{

    PERSONAL ("personal"),
    DAMAGE ("daños a la propiedad"),
    ENVIRONMENTAL ("Medio ambiental"),
    FATALITY ("fatalidad");

    private String value;

    private AccidentType (String value){

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
