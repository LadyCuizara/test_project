package com.g2ssid.ddh_g2ssid_api.resources.equipment;

import com.g2ssid.ddh_g2ssid_api.controller.EquipmentController;
import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.Equipment;
import com.g2ssid.ddh_g2ssid_api.resources.GenericResourceAssembler;
import org.springframework.stereotype.Component;

/**
 * @author giovanny delgadillo
 */
@Component
public class EquipmentResourceAssembler extends GenericResourceAssembler<Equipment, EquipmentResource> {

    public EquipmentResourceAssembler() {
        super(EquipmentController.class, EquipmentResource.class);
    }
}
