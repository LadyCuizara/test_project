package com.g2ssid.ddh_g2ssid_api.service;

import com.g2ssid.ddh_g2ssid_api.domain.model.employee.Employee;
import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.Equipment;
import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.EquipmentCategory;
import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.EquipmentControlDaily;
import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.EquipmentIncomplete;
import com.g2ssid.ddh_g2ssid_api.domain.repository.*;
import com.g2ssid.ddh_g2ssid_api.resources.equipment.EquipmentControlDailyResource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class EquipmentControlDailyServiceImpl extends GenericServiceImpl<EquipmentControlDaily> implements EquipmentControlDailyService {

    @Autowired
    private EmployeeRepository employeeRepository;
    @Autowired
    private EquipmentControlDailyRepository equipmentControlDailyRepository;
    @Autowired
    private EquipmentIncompleteRepository equipmentIncompleteRepository;
    @Autowired
    private EquipmentRepository equipmentRepository;
    @Override
    protected GenericRepository<EquipmentControlDaily> getRepository() {
        return equipmentControlDailyRepository;
    }


    public EquipmentControlDaily registerUseDailyEquipment(Long employeeId, EquipmentControlDailyResource equipmentControlDailyResource) {
        Optional<Employee> employeeOptional = employeeRepository.findById(employeeId);
        if(employeeOptional.isPresent()) {
            EquipmentControlDaily equipmentControlDaily = equipmentControlDailyResource.toEntity();
            equipmentControlDaily.setEmployee(employeeOptional.get());
            if(!CollectionUtils.isEmpty(equipmentControlDailyResource.getEquipmentsIncompleteIdList())) {
                equipmentControlDaily.setCompleteEquipments(false);
                EquipmentControlDaily equipmentControlDailyNew =  equipmentControlDailyRepository.save(equipmentControlDaily);
                registerEquipmentIncomplete(equipmentControlDailyNew, equipmentControlDailyResource.getEquipmentsIncompleteIdList());
            }
            return equipmentControlDailyRepository.save(equipmentControlDaily);
        }
        return null;
    }

    private void registerEquipmentIncomplete(EquipmentControlDaily equipmentControlDailyNew, List<Long> equipmentsIncompleteIds) {
        if(!CollectionUtils.isEmpty(equipmentsIncompleteIds)) {
            for(Long equipmentId : equipmentsIncompleteIds) {
                Optional<Equipment> equipmentOptional = equipmentRepository.findById(equipmentId);
                if(equipmentOptional.isPresent()) {
                    EquipmentIncomplete equipmentIncomplete = new EquipmentIncomplete(equipmentOptional.get(), equipmentControlDailyNew, equipmentControlDailyNew.getDateDay());
                    equipmentIncompleteRepository.save(equipmentIncomplete);
                }
            }
        }
    }
}
