package com.g2ssid.ddh_g2ssid_api.serialization;

import com.g2ssid.ddh_g2ssid_api.domain.model.accident.Frecuency;
/**
 * @autor Michel Terrazas Mercado
 */

public class FrecuencySerializer extends EnumSerializer<Frecuency>{
    protected FrecuencySerializer() {
        super(Frecuency.class);
    }
}
