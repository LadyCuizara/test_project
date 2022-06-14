package com.g2ssid.ddh_g2ssid_api.domain.model.equipment;

import com.g2ssid.ddh_g2ssid_api.domain.model.base.BaseEntityAudit;
import com.g2ssid.ddh_g2ssid_api.domain.model.employee.Employee;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "equipment_incomplete")
public class EquipmentIncomplete extends BaseEntityAudit {

    @ManyToOne
    @JoinColumn(name="equipment_id", nullable=false)
    private Equipment equipment;

    @ManyToOne
    @JoinColumn(name="equipment_control_daily_id", nullable=false)
    private EquipmentControlDaily equipmentControlDaily;
    private Date registerDate;

    public EquipmentIncomplete(Equipment equipment, EquipmentControlDaily equipmentControlDaily, Date registerDate) {
        this.equipment = equipment;
        this.equipmentControlDaily = equipmentControlDaily;
        this.registerDate = registerDate;
    }

    public EquipmentIncomplete() { }

    public Equipment getEquipment() {
        return equipment;
    }

    public void setEquipment(Equipment equipment) {
        this.equipment = equipment;
    }

    public EquipmentControlDaily getEquipmentControlDaily() {
        return equipmentControlDaily;
    }

    public void setEquipmentControlDaily(EquipmentControlDaily equipmentControlDaily) {
        this.equipmentControlDaily = equipmentControlDaily;
    }

    public Date getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(Date registerDate) {
        this.registerDate = registerDate;
    }
}
