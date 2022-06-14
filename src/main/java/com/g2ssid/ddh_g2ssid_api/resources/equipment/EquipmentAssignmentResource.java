package com.g2ssid.ddh_g2ssid_api.resources.equipment;

import com.g2ssid.ddh_g2ssid_api.controller.EmployeeController;
import com.g2ssid.ddh_g2ssid_api.controller.EquipmentController;
import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.EquipmentAssignment;
import com.g2ssid.ddh_g2ssid_api.resources.GenericResource;

import java.util.Date;
import static org.springframework.hateoas.mvc.ControllerLinkBuilder.linkTo;
import static org.springframework.hateoas.mvc.ControllerLinkBuilder.methodOn;
/**
 * @author Lady Laura Cuizara
 */
public class EquipmentAssignmentResource extends GenericResource<EquipmentAssignment> {
    private Long employeeId;
    private Long equipmentId;
    private Date initDate;
    private Date endDate;
    private Boolean active;
    private String observation;

    public Long getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Long employeeId) {
        this.employeeId = employeeId;
    }

    public Long getEquipmentId() {
        return equipmentId;
    }

    public void setEquipmentId(Long equipmentId) {
        this.equipmentId = equipmentId;
    }

    public Date getInitDate() {
        return initDate;
    }

    public void setInitDate(Date initDate) {
        this.initDate = initDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    public String getObservation() {
        return observation;
    }

    public void setObservation(String observation) {
        this.observation = observation;
    }

    @Override
    public EquipmentAssignment toEntity() {
        EquipmentAssignment equipmentAssignment= new EquipmentAssignment();
        equipmentAssignment.setInitDate(getInitDate());
        equipmentAssignment.setEndDate(getEndDate());
        equipmentAssignment.setActive(getActive());
        equipmentAssignment.setObservation(getObservation());
        return equipmentAssignment;
    }

    @Override
    public void updateFromEntity(EquipmentAssignment entity) {
        setEmployeeId(entity.getEmployee().getId());
        setEquipmentId(entity.getEquipment().getId());
        setInitDate(entity.getInitDate());
        setEndDate(entity.getEndDate());
        setActive(entity.getActive());
        setObservation(entity.getObservation());
    }

    @Override
    public void addLinks() {
        add(linkTo(methodOn(EquipmentController.class).findById(getEquipmentId())).withRel("equipment"));
        add(linkTo(methodOn(EmployeeController.class).findById(getEmployeeId())).withRel("employee"));

    }

}
