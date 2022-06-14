package com.g2ssid.ddh_g2ssid_api.serialization;

import com.g2ssid.ddh_g2ssid_api.domain.model.accident.Turn;

/**
 * @author Michel Terrazas Mercado
 */

public class TurnSerializer  extends EnumSerializer<Turn>{
    protected TurnSerializer() {
        super(Turn.class);
    }
}
