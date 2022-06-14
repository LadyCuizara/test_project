package com.g2ssid.ddh_g2ssid_api.resources.equipment;

import com.g2ssid.ddh_g2ssid_api.controller.EquipmentCategoryController;
import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.EquipmentCategory;
import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.EquipmentType;
import com.g2ssid.ddh_g2ssid_api.resources.GenericResource;

import java.util.List;

import static org.springframework.hateoas.mvc.ControllerLinkBuilder.linkTo;
import static org.springframework.hateoas.mvc.ControllerLinkBuilder.methodOn;

/**
 * @author giovanny delgadillo
 */
public class EquipmentCategoryResource extends GenericResource<EquipmentCategory> {

    private String name;
    private String description;
    private String imagePath;
    private List<String> resistantTo;
    private List<String> characteristic;
    private List<String> protectTo;
    private EquipmentType equipmentType;
    private Integer total;

    @Override
    public EquipmentCategory toEntity() {
        EquipmentCategory entity = new EquipmentCategory();
        entity.setName(getName());
        entity.setDescription(getDescription());
        entity.setCharacteristic(getCharacteristic());
        entity.setEquipmentType(getEquipmentType());
        entity.setResistantTo(getResistantTo());
        entity.setProtectTo(getProtectTo());
        entity.setImagePath(getImagePath());
        return entity;
    }

    @Override
    public void updateFromEntity(EquipmentCategory entity) {
        setName(entity.getName());
        setDescription(entity.getDescription());
        setCharacteristic(entity.getCharacteristic());
        setEquipmentType(entity.getEquipmentType());
        setResistantTo(entity.getResistantTo());
        setProtectTo(entity.getProtectTo());
        setImagePath(entity.getImagePath());
        setTotalEquipments(entity.getEquipments().size());
    }

    @Override
    public void addLinks() {
        add(linkTo(methodOn(EquipmentCategoryController.class).findById(getResourceId())).slash("equipments").withRel("equipments"));
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public List<String> getResistantTo() {
        return resistantTo;
    }

    public void setResistantTo(List<String> resistantTo) {
        this.resistantTo = resistantTo;
    }

    public List<String> getCharacteristic() {
        return characteristic;
    }

    public void setCharacteristic(List<String> characteristic) {
        this.characteristic = characteristic;
    }

    public List<String> getProtectTo() {
        return protectTo;
    }

    public void setProtectTo(List<String> protectTo) {
        this.protectTo = protectTo;
    }

    public EquipmentType getEquipmentType() {
        return equipmentType;
    }

    public void setEquipmentType(EquipmentType equipmentType) {
        this.equipmentType = equipmentType;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotalEquipments(Integer total) {
        this.total = total;
    }
}
