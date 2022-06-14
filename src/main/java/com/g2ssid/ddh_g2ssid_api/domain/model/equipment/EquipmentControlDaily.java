package com.g2ssid.ddh_g2ssid_api.domain.model.equipment;

import com.g2ssid.ddh_g2ssid_api.domain.model.base.BaseEntityAudit;
import com.g2ssid.ddh_g2ssid_api.domain.model.employee.Employee;
import com.g2ssid.ddh_g2ssid_api.domain.model.position.Contract;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

/**
 * @author Julio Quispe
 */
@Entity
@Table(name= "equipment_control_daily")
public class EquipmentControlDaily extends BaseEntityAudit {

    @ManyToOne
    @JoinColumn(name="employee_id", nullable=false)
    private Employee employee;

    @OneToMany(
            cascade = CascadeType.ALL,
            fetch = FetchType.LAZY,
            mappedBy = "equipmentControlDaily")
    private Set<EquipmentIncomplete> equipmentsIncompletes;

    @Column(nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateDay;
    private boolean completeEquipments;

    public EquipmentControlDaily() { }

    public EquipmentControlDaily(Employee employee, Date dateDay, boolean completeEquipments) {
        this.employee = employee;
        this.dateDay = dateDay;
        this.completeEquipments = completeEquipments;
    }

    public Date getDateDay() {
        return dateDay;
    }

    public void setDateDay(Date dateDay) {
        this.dateDay = dateDay;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public boolean isCompleteEquipments() {
        return completeEquipments;
    }

    public void setCompleteEquipments(boolean completeEquipments) {
        this.completeEquipments = completeEquipments;
    }

    public Set<EquipmentIncomplete> getEquipmentsIncompletes() {
        return equipmentsIncompletes;
    }

    public void setEquipmentsIncompletes(Set<EquipmentIncomplete> equipmentsIncompletes) {
        this.equipmentsIncompletes = equipmentsIncompletes;
    }
}
