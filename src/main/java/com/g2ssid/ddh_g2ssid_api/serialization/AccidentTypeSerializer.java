package com.g2ssid.ddh_g2ssid_api.serialization;

import com.g2ssid.ddh_g2ssid_api.domain.model.accident.AccidentType;

/**
 * @author Michel Terrazas Mercado
 */

public class AccidentTypeSerializer extends EnumSerializer<AccidentType> {
    protected AccidentTypeSerializer() {
        super(AccidentType.class);
    }
}
