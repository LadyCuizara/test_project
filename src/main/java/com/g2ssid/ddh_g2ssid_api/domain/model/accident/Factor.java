package com.g2ssid.ddh_g2ssid_api.domain.model.accident;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.g2ssid.ddh_g2ssid_api.serialization.EnumSerializable;
import com.g2ssid.ddh_g2ssid_api.serialization.FactorSerializer;

/**
 * @author Michel Terrazas Mercado
 */

@JsonSerialize(using = FactorSerializer.class)
public enum  Factor implements EnumSerializable{

    FLOOR ("piso"),
    WALL ("paredes"),
    ROOF ("techo"),
    STAIR ("escalera"),
    RAMP ("rampas"),
    GATEWAYS ("pasarelas"),
    DOOR ("aberturas, puertas, portones"),
    COLUMN ("columnas"),
    WINDOWS ("ventanas"),
    PIPES ("tubos de ventilacion");

    private String value;

    private Factor (String value){

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
