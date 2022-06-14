package com.g2ssid.ddh_g2ssid_api.resources.equipment;

import com.g2ssid.ddh_g2ssid_api.controller.EquipmentCategoryController;
import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.EquipmentCategory;
import com.g2ssid.ddh_g2ssid_api.resources.GenericResourceAssembler;
import org.springframework.stereotype.Component;

/**
 * @author giovanny delgadillo
 */
@Component
public class EquipmentCategoryResourceAssembler extends GenericResourceAssembler<EquipmentCategory, EquipmentCategoryResource> {

    public EquipmentCategoryResourceAssembler() {
        super(EquipmentCategoryController.class, EquipmentCategoryResource.class);
    }
}
