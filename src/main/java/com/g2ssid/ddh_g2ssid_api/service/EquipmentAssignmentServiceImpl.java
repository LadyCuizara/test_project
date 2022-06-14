package com.g2ssid.ddh_g2ssid_api.service;

import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.EquipmentAssignment;
import com.g2ssid.ddh_g2ssid_api.domain.repository.EquipmentAssignmentRepository;
import com.g2ssid.ddh_g2ssid_api.domain.repository.GenericRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Lady Laura Cuizara
 */
@Service
public class EquipmentAssignmentServiceImpl extends GenericServiceImpl<EquipmentAssignment> implements EquipmentAssignmentService {
    @Autowired
    private EquipmentAssignmentRepository equipmentAssignmentRepository;
    @Override
    protected GenericRepository<EquipmentAssignment> getRepository(){return equipmentAssignmentRepository;}
    @Override
    public List<EquipmentAssignment> assingmentByEquipment(Long equipmentId){
        return equipmentAssignmentRepository.assingmentByEquipment(equipmentId);
    }

}
