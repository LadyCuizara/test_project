package com.g2ssid.ddh_g2ssid_api.resources.equipment;

import java.util.List;

/**
 * @author Julio Quispe
 */
public class EquipmentControlDailyListResource {
    List<Long> listEquipments;

    public List<Long> getListEquipments() {
        return listEquipments;
    }

    public void setListEquipments(List<Long> listEquipments) {
        this.listEquipments = listEquipments;
    }
}
