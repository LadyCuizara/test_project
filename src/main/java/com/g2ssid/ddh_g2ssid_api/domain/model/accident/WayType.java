package com.g2ssid.ddh_g2ssid_api.domain.model.accident;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.g2ssid.ddh_g2ssid_api.serialization.EnumSerializable;
import com.g2ssid.ddh_g2ssid_api.serialization.WayTypeSerializer;

/**
 * @author Michel Terrazas Mercado
 */
@JsonSerialize(using = WayTypeSerializer.class)
public enum  WayType implements EnumSerializable{

    LEVEL ("caida de nivel"),
    HIGHT ("caida de altura"),
    WATER ("caida al agua"),
   COLLAPSE ("derrumbe o desplome de instalacion"),
   OBJECT ("caida de objetos"),
   STEP ("pisada sobre objetos"),
   SHOCK ("choque contra objetos"),
   HIT ("golpe por objeto excepto caida"),
   CATCH("aprisionamiento o atrapamiento"),
   EFFORT("esfuerzo fisico excesivo o falsos movimientos"),
   COLD("exposicion al frio"),
   HOT("exposicion al calor");

    private String value;

    private WayType (String value){

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
