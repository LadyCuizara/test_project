package com.g2ssid.ddh_g2ssid_api.serialization;

import com.g2ssid.ddh_g2ssid_api.domain.model.accident.Receive;

/**
 * @author Michel Terrazas Mercado
 */

public class ReceiveSerializer  extends EnumSerializer<Receive>{
    protected ReceiveSerializer() {
        super(Receive.class);
    }
}
