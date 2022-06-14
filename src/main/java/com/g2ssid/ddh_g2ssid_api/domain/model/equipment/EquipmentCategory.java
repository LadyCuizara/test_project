package com.g2ssid.ddh_g2ssid_api.domain.model.equipment;

import com.g2ssid.ddh_g2ssid_api.domain.model.base.BaseEntityAudit;

import javax.persistence.*;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author Nicol Balderrama
 */
@Entity
@Table(name = "equipment_category")
public class EquipmentCategory extends BaseEntityAudit {

    private String name;
    private String description;

    @OneToMany(
            cascade = CascadeType.ALL,
            fetch = FetchType.LAZY,
            mappedBy = "category")
    private Set<Equipment> equipments;

    @Column
    @ElementCollection(targetClass=String.class)
    private List<String> resistantTo;
    @Column
    @ElementCollection(targetClass=String.class)
    private List<String> characteristic;
    @Column
    @ElementCollection(targetClass=String.class)
    private List<String> protectTo;

    @Enumerated(value = EnumType.STRING)
    @Column(length = 15)
    private EquipmentType equipmentType;

    private String imagePath;

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

    public EquipmentType getEquipmentType() {
        return equipmentType;
    }

    public void setEquipmentType(EquipmentType equipmentType) {
        this.equipmentType = equipmentType;
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

    public void setProtectTo(List<String> protecTo) {
        this.protectTo = protecTo;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String image) {
        this.imagePath = image;
    }

    public Set<Equipment> getEquipments() {
        if (equipments == null) {
            equipments = new HashSet<>();
        }
        return equipments;
    }

    public void setEquipments(Set<Equipment> equipments) {
        this.equipments = equipments;
    }

    public void merge(EquipmentCategory newEquipmentCategory) {
        if(newEquipmentCategory.getName() != null) {
            this.setName(newEquipmentCategory.getName());
        }
        if (newEquipmentCategory.getDescription() != null) {
            this.setDescription(newEquipmentCategory.getDescription());
        }
        if (newEquipmentCategory.getCharacteristic() != null) {
            this.setCharacteristic(newEquipmentCategory.getCharacteristic());
        }
        if (newEquipmentCategory.getEquipmentType() != null) {
            this.setEquipmentType(newEquipmentCategory.getEquipmentType());
        }
        if (newEquipmentCategory.getResistantTo() != null) {
            this.setResistantTo(newEquipmentCategory.getResistantTo());
        }
        if (newEquipmentCategory.getProtectTo() != null) {
            this.setProtectTo(newEquipmentCategory.getProtectTo());
        }
        if (newEquipmentCategory.getImagePath() != null) {
            this.setImagePath(newEquipmentCategory.getImagePath());
        }
    }
}
