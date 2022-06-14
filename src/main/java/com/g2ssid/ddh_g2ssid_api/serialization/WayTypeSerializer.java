package com.g2ssid.ddh_g2ssid_api.serialization;

import com.g2ssid.ddh_g2ssid_api.domain.model.accident.WayType;

/**
 * @author Michel Terrazas Mercado
 */

public class WayTypeSerializer extends EnumSerializer<WayType>{
    protected WayTypeSerializer() {
        super(WayType.class);
    }
}
