package com.g2ssid.ddh_g2ssid_api.domain.model.position;
import com.g2ssid.ddh_g2ssid_api.domain.model.base.BaseEntityAudit;
import com.g2ssid.ddh_g2ssid_api.domain.model.employee.Employee;
import com.g2ssid.ddh_g2ssid_api.domain.model.project.Project;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @author giovanny delgadillo
 */
@Entity
@Table(name = "contract")
public class Contract extends BaseEntityAudit {

    @ManyToOne
    @JoinColumn(name = "employee_id", nullable = false)
    private Employee employee;

    @ManyToOne
    @JoinColumn(name="position_id", nullable=false)
    private Position position;

    @ManyToOne
    @JoinColumn(name="project_id", nullable=false)
    private Project project;

    @Column(nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date initDate;

    @Temporal(TemporalType.TIMESTAMP)
    private Date endDate;

    @Enumerated(value = EnumType.STRING)
    @Column(length = 20)
    private EmployeeType employeeType;

    private BigDecimal salary;

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
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

    public EmployeeType getEmployeeType() {
        return employeeType;
    }

    public void setEmployeeType(EmployeeType employeeType) {
        this.employeeType = employeeType;
    }

    public BigDecimal getSalary() {
        return salary;
    }

    public void setSalary(BigDecimal salary) {
        this.salary = salary;
    }

    public void merge(Contract newContract) {
        if (newContract.getEmployeeType() != null) {
            this.setEmployeeType(newContract.getEmployeeType());
        }
        if (newContract.getEndDate() != null) {
            this.setEndDate(newContract.getEndDate());
        }
        if (newContract.getInitDate() != null) {
            this.setInitDate(newContract.getInitDate());
        }
        if (newContract.getSalary() != null) {
            this.setSalary(newContract.getSalary());
        }
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }
}
