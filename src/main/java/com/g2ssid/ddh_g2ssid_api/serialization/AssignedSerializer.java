package com.g2ssid.ddh_g2ssid_api.serialization;

import com.g2ssid.ddh_g2ssid_api.domain.model.accident.Assigned;

/**
 * @author Michel Terrazas Mercado
 */

public class AssignedSerializer extends EnumSerializer<Assigned>{
    protected AssignedSerializer() {
        super(Assigned.class);
    }
}
