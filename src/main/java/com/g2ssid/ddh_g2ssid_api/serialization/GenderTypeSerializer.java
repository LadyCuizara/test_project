package com.g2ssid.ddh_g2ssid_api.serialization;

import com.g2ssid.ddh_g2ssid_api.domain.model.employee.GenderType;

/**
 * @author giovanny delgadillo
 */
public class GenderTypeSerializer extends EnumSerializer<GenderType> {
    protected GenderTypeSerializer() {
        super(GenderType.class);
    }
}
