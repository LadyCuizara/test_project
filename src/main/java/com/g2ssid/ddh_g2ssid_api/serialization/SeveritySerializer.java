package com.g2ssid.ddh_g2ssid_api.serialization;

import com.g2ssid.ddh_g2ssid_api.domain.model.accident.Severity;

/**
 * @author Michel Terrazas Mercado
 */

public class SeveritySerializer  extends EnumSerializer<Severity>{
    protected SeveritySerializer() {
        super(Severity.class);
    }
}
