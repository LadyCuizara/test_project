package com.g2ssid.ddh_g2ssid_api.serialization;

import com.g2ssid.ddh_g2ssid_api.domain.model.accident.PartOfBody;

/**
 * @author Michel Terrazas Mercado
 */

public class PartOfBodySerializer extends EnumSerializer<PartOfBody>{
    protected PartOfBodySerializer() {
        super(PartOfBody.class);
    }
}
