package com.g2ssid.ddh_g2ssid_api.resources.equipment;

import com.g2ssid.ddh_g2ssid_api.controller.EquipmentAssignmentController;
import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.EquipmentAssignment;
import com.g2ssid.ddh_g2ssid_api.resources.GenericResourceAssembler;
import org.springframework.stereotype.Component;

/**
 * @Lady Laura Cuizara
 */
@Component
public class EquipmentAssignmentResourceAssembler  extends GenericResourceAssembler<EquipmentAssignment, EquipmentAssignmentResource>{
    public EquipmentAssignmentResourceAssembler(){
        super(EquipmentAssignmentController.class, EquipmentAssignmentResource.class);
    }
}
