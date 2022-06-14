package com.g2ssid.ddh_g2ssid_api.service;

import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.Equipment;

import java.io.InputStream;
import java.util.List;

/**
 * @author Nicol Balderrama
 */
public interface EquipmentService extends GenericService<Equipment> {
    public List<Equipment> equipmentsAssignmentByEmployee(Long employeeId);
    public List<Equipment> equipmentsByCategory(Long employeeId);

}
