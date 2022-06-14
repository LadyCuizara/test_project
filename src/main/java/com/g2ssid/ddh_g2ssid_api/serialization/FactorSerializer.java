package com.g2ssid.ddh_g2ssid_api.serialization;

import com.g2ssid.ddh_g2ssid_api.domain.model.accident.Factor;

/**
 * @author Michel Terrazas Mercado
 */

public class FactorSerializer extends EnumSerializer<Factor>{

    protected FactorSerializer() {
            super(Factor.class);
        }

    }

