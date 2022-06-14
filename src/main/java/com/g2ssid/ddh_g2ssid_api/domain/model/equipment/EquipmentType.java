package com.g2ssid.ddh_g2ssid_api.domain.model.equipment;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.g2ssid.ddh_g2ssid_api.serialization.EnumSerializable;

/**
 * @author Nicol Balderrama
 */
@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum EquipmentType implements EnumSerializable {
    SAFETY("Seguridad"),
    OPERATIONAL("Operacional");

    private String value;

    private EquipmentType(String value) {
        this.value = value;
    }

    @Override
    public String getKey() {
        return this.name();
    }

    @Override
    public String getValue() {
        return value;
    }

    public static EquipmentType fromString(String text) {
        for (EquipmentType type : EquipmentType.values()) {
            if (type.value.equalsIgnoreCase(text)) {
                return type;
            }
        }
        return null;
    }
}
