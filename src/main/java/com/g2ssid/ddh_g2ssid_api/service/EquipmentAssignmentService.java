package com.g2ssid.ddh_g2ssid_api.service;

import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.EquipmentAssignment;

import java.util.List;

/**
 * @author Lady Laura Cuizara
 */
public interface EquipmentAssignmentService extends  GenericService<EquipmentAssignment>{

    public List<EquipmentAssignment> assingmentByEquipment(Long equipmentId);

}
