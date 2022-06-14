package com.g2ssid.ddh_g2ssid_api.domain.model.equipment;
import com.g2ssid.ddh_g2ssid_api.domain.model.base.BaseEntityAudit;
import com.g2ssid.ddh_g2ssid_api.domain.model.employee.Employee;
import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "equipment_assignment")
public class EquipmentAssignment extends BaseEntityAudit {
    @ManyToOne
    @JoinColumn(name="employee_id", nullable = false)

    private Employee employee;
    @ManyToOne
    @JoinColumn(name="equipment_id", nullable=false)
    private Equipment equipment;

    @Column(nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date initDate;

    @Temporal(TemporalType.TIMESTAMP)
    private Date endDate;

    @Column(nullable = false)
    private Boolean active ;

    private String observation;


    public String getObservation() {
        return observation;
    }

    public void setObservation(String observation) {
        this.observation = observation;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Equipment getEquipment() {
        return equipment;
    }

    public void setEquipment(Equipment equipment) {
        this.equipment = equipment;
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
    public void merge(EquipmentAssignment newContract) {

        if (newContract.getEndDate() != null) {
            this.setEndDate(newContract.getEndDate());
        }
        if (newContract.getInitDate() != null) {
            this.setInitDate(newContract.getInitDate());
        }
        if (newContract.getActive() != null) {
            this.setActive(newContract.getActive());
        }
    }
}
