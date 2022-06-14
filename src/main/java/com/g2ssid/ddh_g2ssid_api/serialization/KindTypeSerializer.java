package com.g2ssid.ddh_g2ssid_api.serialization;

import com.g2ssid.ddh_g2ssid_api.domain.model.accident.KindType;

/**
 * @author Michel Terrazas Mercdo
 */
public class KindTypeSerializer extends EnumSerializer<KindType>{
    protected KindTypeSerializer() {
        super(KindType.class);
    }
}
