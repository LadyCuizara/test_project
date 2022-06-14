package com.g2ssid.ddh_g2ssid_api.resources.equipment;

import com.g2ssid.ddh_g2ssid_api.controller.EquipmentCategoryController;
import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.Equipment;
import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.EquipmentType;
import com.g2ssid.ddh_g2ssid_api.resources.GenericResource;

import java.util.Date;

import static org.springframework.hateoas.mvc.ControllerLinkBuilder.linkTo;
import static org.springframework.hateoas.mvc.ControllerLinkBuilder.methodOn;

/**
 * @author giovanny delgadillo
 */
public class EquipmentResource extends GenericResource<Equipment> {

    private String code;
    private Date acquisitionDate;
    private String state;
    private Long categoryId;
    private Boolean available;
    private EquipmentType type;

    @Override
    public Equipment toEntity() {
        Equipment entity = new Equipment();
        entity.setCode(getCode());
        entity.setAcquisitionDate(getAcquisitionDate());
        entity.setState(getState());
        return entity;
    }

    @Override
    public void updateFromEntity(Equipment entity) {
        setCode(entity.getCode());
        setAcquisitionDate(entity.getAcquisitionDate());
        setState(entity.getState());
        setCategoryId(entity.getCategory().getId());
        updateType(entity.getCategory().getEquipmentType());
    }

    @Override
    public void addLinks() {
        add(linkTo(methodOn(EquipmentCategoryController.class).findById(getCategoryId())).withRel("equipment-category"));
    }

    public Boolean getAvailable() {
        return available;
    }

    public void setAvailable(Boolean available) {
        this.available = available;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Date getAcquisitionDate() {
        return acquisitionDate;
    }

    public void setAcquisitionDate(Date acquisitionDate) {
        this.acquisitionDate = acquisitionDate;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long category_id) {
        this.categoryId = category_id;
    }

    public EquipmentType getType() {
        return type;
    }

    public void updateType(EquipmentType type) {
        this.type = type;
    }
}
