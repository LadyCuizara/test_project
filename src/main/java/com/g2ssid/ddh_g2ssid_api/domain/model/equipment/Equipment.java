package com.g2ssid.ddh_g2ssid_api.domain.model.equipment;

import com.g2ssid.ddh_g2ssid_api.domain.model.base.BaseEntityAudit;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

/**
 * @author Nicol Balderrama
 */
@Entity
@Table(name = "equipment")
public class Equipment extends BaseEntityAudit {
    private String code;
    private Date acquisitionDate;
    private String state;
    private Boolean available;
    @ManyToOne
    @JoinColumn(name = "category_id", nullable = false)
    private EquipmentCategory category;

    @OneToMany(
            cascade = CascadeType.ALL,
            fetch = FetchType.LAZY,
            mappedBy = "equipment")
    private Set<EquipmentAssignment> equipmentAssignments;

    @OneToMany(
            cascade = CascadeType.ALL,
            fetch = FetchType.LAZY,
            mappedBy = "equipment")
    private Set<EquipmentIncomplete> equipmentsIncompletes;

    @Column(columnDefinition = "boolean default true")
    public Boolean getAvailable() {
        return available;
    }

    public void setAvailable(Boolean available) {
        this.available = available;
    }

    public Set<EquipmentAssignment> getEquipmentAssignments() {
        return equipmentAssignments;
    }

    public void setEquipmentAssignments(Set<EquipmentAssignment> equipmentAssignments) {
        this.equipmentAssignments = equipmentAssignments;
    }

    public EquipmentCategory getCategory() {
        return category;
    }

    public void setCategory(EquipmentCategory category) {
        this.category = category;
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

    public void merge(Equipment newEquipment) {
        if (newEquipment.getCode() != null) {
            this.setCode(newEquipment.getCode());
        }
        if (newEquipment.getState() != null) {
            this.setState(newEquipment.getState());
        }
        if (newEquipment.getAcquisitionDate() != null) {
            this.setAcquisitionDate(newEquipment.getAcquisitionDate());
        }
        if (newEquipment.getCategory() != null) {
            this.setCategory(newEquipment.getCategory());
        }
        if (newEquipment.getAvailable() != null){
            this.setAvailable(newEquipment.getAvailable());
        }
    }

    public Set<EquipmentIncomplete> getEquipmentsIncompletes() {
        return equipmentsIncompletes;
    }

    public void setEquipmentsIncompletes(Set<EquipmentIncomplete> equipmentsIncompletes) {
        this.equipmentsIncompletes = equipmentsIncompletes;
    }
}
