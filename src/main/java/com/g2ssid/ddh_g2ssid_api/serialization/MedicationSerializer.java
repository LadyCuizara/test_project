package com.g2ssid.ddh_g2ssid_api.serialization;

import com.g2ssid.ddh_g2ssid_api.domain.model.accident.Medication;

/**
 * @author Michel Terrazas Mercado
 */
public class MedicationSerializer  extends EnumSerializer<Medication>{
    protected MedicationSerializer() {
        super(Medication.class);
    }
}
