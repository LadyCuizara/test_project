package com.g2ssid.ddh_g2ssid_api.domain.model.accident;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.g2ssid.ddh_g2ssid_api.serialization.EnumSerializable;
import com.g2ssid.ddh_g2ssid_api.serialization.KindTypeSerializer;

/**
 * @author Michel Terrazas Mercado
 */
@JsonSerialize(using = KindTypeSerializer.class)
public enum  KindType implements EnumSerializable {

    SCORINGS (" escoriaciones"),
    STINGIN ("herida punzante"),
    CUTTING ("herida cortante"),
    BRUISE ("herida contusa"),
    TISSUELOSS ("perdida de tejido"),
    CONTUSION ("contusion"),
    LUXATION ("luxacion"),
    FRACTURE ("fractura"),
    AMPUTATION ("amputacion"),
    BURN ("quemadura"),
    EYE ("cuerpo extraño en el ojo"),
    ENUCLEATION ("enucleacion");

    private String value;

    private KindType (String value){

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
