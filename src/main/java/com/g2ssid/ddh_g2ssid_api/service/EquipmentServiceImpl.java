package com.g2ssid.ddh_g2ssid_api.service;

import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.Equipment;
import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.EquipmentCategory;
import com.g2ssid.ddh_g2ssid_api.domain.repository.EquipmentCategoryRepository;
import com.g2ssid.ddh_g2ssid_api.domain.repository.EquipmentRepository;
import com.g2ssid.ddh_g2ssid_api.domain.repository.GenericRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Set;

/**
 * @author Nicol Balderrama
 */
@Service
public class EquipmentServiceImpl extends GenericServiceImpl<Equipment> implements EquipmentService{

    @Autowired
    private EquipmentRepository equipmentRepository;
    @Autowired
    private EquipmentCategoryRepository equipmentCategoryRepository;
    @Override
    protected GenericRepository<Equipment> getRepository() {
        return equipmentRepository;
    }

/*
* created by:lady
* */
   /* public List<Equipment> findByCategory(Long categoryId){

        List<Equipment> equipments= equipmentRepository.findByCategory(categoryId);

        return equipments;
    }*/
    public List<Equipment> getEquipmentByCategory(Long categoryId){
        List<Equipment> equipmentList = new ArrayList<>();
        Optional<EquipmentCategory> category = equipmentCategoryRepository.findById(categoryId);
        if(category.isPresent()){
            Set<Equipment> equipmentSet = category.get().getEquipments();
            for (Equipment equipment : equipmentSet){
                    equipmentList.add(equipment);
            }
        }
        return equipmentList;
    }

    @Override
    public List<Equipment> equipmentsAssignmentByEmployee(Long employeeId) {
        return equipmentRepository.equipmentsAssignmentByEmployee(employeeId);
    }

    @Override
    public List<Equipment> equipmentsByCategory(Long categoryId) {
        return equipmentRepository.equipmentsByCategory(categoryId);
    }
}
