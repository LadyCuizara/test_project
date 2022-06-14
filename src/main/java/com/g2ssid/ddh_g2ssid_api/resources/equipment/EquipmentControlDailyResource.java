package com.g2ssid.ddh_g2ssid_api.resources.equipment;

import com.g2ssid.ddh_g2ssid_api.controller.EmployeeController;
import com.g2ssid.ddh_g2ssid_api.controller.EquipmentController;
import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.EquipmentControlDaily;
import com.g2ssid.ddh_g2ssid_api.resources.GenericResource;

import java.util.Date;
import java.util.List;

import static org.springframework.hateoas.mvc.ControllerLinkBuilder.linkTo;
import static org.springframework.hateoas.mvc.ControllerLinkBuilder.methodOn;

/**
 * @author Julio Quispe
 */
public class EquipmentControlDailyResource extends GenericResource<EquipmentControlDaily> {
    private Long employeeId;
    private Date dateDay;
    private boolean completeEquipments;
    private List<Long> equipmentsIncompleteIdList;

    public Date getDateDay() {
        return dateDay;
    }

    public void setDateDay(Date dateDay) {
        this.dateDay = dateDay;
    }

    public Long getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Long employeeId) {
        this.employeeId = employeeId;
    }

    public boolean isCompleteEquipments() {
        return completeEquipments;
    }

    public void setCompleteEquipments(boolean completeEquipments) {
        this.completeEquipments = completeEquipments;
    }

    public List<Long> getEquipmentsIncompleteIdList() {
        return equipmentsIncompleteIdList;
    }

    public void setEquipmentsIncompleteIdList(List<Long> equipmentsIncompleteIdList) {
        this.equipmentsIncompleteIdList = equipmentsIncompleteIdList;
    }

    @Override
    public EquipmentControlDaily toEntity() {
        EquipmentControlDaily equipmentControlDaily= new EquipmentControlDaily();
        equipmentControlDaily.setDateDay(getDateDay());
        equipmentControlDaily.setCompleteEquipments(isCompleteEquipments());
        return equipmentControlDaily;
    }

    @Override
    public void updateFromEntity(EquipmentControlDaily entity) {
        setDateDay(entity.getDateDay());
        setEmployeeId(entity.getEmployee().getId());
        setCompleteEquipments(entity.isCompleteEquipments());
    }

    @Override
    public void addLinks() {
    }


}
