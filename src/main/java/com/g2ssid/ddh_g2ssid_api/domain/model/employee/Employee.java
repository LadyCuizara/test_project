package com.g2ssid.ddh_g2ssid_api.domain.model.employee;

import com.g2ssid.ddh_g2ssid_api.domain.model.accident.Accident;
import com.g2ssid.ddh_g2ssid_api.domain.model.base.BaseEntityAudit;
import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.EquipmentAssignment;
import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.EquipmentControlDaily;
import com.g2ssid.ddh_g2ssid_api.domain.model.position.Contract;

import lombok.Data;
import javax.persistence.*;
import java.util.Date;
import java.util.Set;

/**
 * @author giovanny delgadillo
 */
@Entity
@Table(name = "employee")
@Data
@NamedStoredProcedureQueries({
        @NamedStoredProcedureQuery(name = "getAllEmployees",
                procedureName = "get_all_employees",
                resultClasses = Employee.class),
        @NamedStoredProcedureQuery(name = "getEmployee",
                procedureName = "SP_get_employee",
                resultClasses = Employee.class)
})
public class Employee extends BaseEntityAudit {

    @OneToMany(
            cascade = CascadeType.ALL,
            fetch = FetchType.LAZY,
            mappedBy = "employee")
    private Set<Contract> contracts;
    @OneToMany(
            cascade = CascadeType.ALL,
            fetch = FetchType.LAZY,
            mappedBy = "employee")
    private Set<EquipmentAssignment> equipmentAssignments;

    @OneToMany(
            cascade = CascadeType.ALL,
            fetch = FetchType.LAZY,
            mappedBy = "employee")
    private Set<EquipmentControlDaily> equipmentControlDailies;

    @OneToMany(
            cascade = CascadeType.ALL,
            fetch = FetchType.LAZY,
            mappedBy = "employee")
    private Set<Accident> accidents;

    @Column(nullable = false)
    private String firstName;

    @Column(nullable = false)
    private String lastName;

    @Column(nullable = false)
    private Integer ci;

    @Column(nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date birthDate;

    @Enumerated(value = EnumType.STRING)
    @Column(length = 10)
    private GenderType gender;

    @Lob
    private Byte[] picture;

    private Integer phoneNumber;

    private String email;

    private String address;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Integer getCi() {
        return ci;
    }

    public void setCi(Integer ci) {
        this.ci = ci;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public Byte[] getPicture() {
        return picture;
    }

    public void setPicture(Byte[] picture) {
        this.picture = picture;
    }

    public Integer getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(Integer phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public GenderType getGender() {
        return gender;
    }

    public void setGender(GenderType gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Set<Contract> getContracts() {
        return contracts;
    }

    public void setContracts(Set<Contract> contracts) {
        this.contracts = contracts;
    }

    public Set<EquipmentAssignment> getEquipmentAssignments() {
        return equipmentAssignments;
    }

    public void setEquipmentAssignments(Set<EquipmentAssignment> equipmentAssignments) {
        this.equipmentAssignments = equipmentAssignments;
    }

    public Set<Accident> getAccidents() {
        return accidents;
    }

    public void setAccidents(Set<Accident> accidents) {
        this.accidents = accidents;
    }

    public void merge(Employee newEmployee) {
        if(newEmployee.getAddress() != null) {
            this.setAddress(newEmployee.getAddress());
        }
        if (newEmployee.getBirthDate() != null) {
            this.setBirthDate(newEmployee.getBirthDate());
        }
        if (newEmployee.getCi() != null) {
            this.setCi(newEmployee.getCi());
        }
        if (newEmployee.getEmail() != null) {
            this.setEmail(newEmployee.getEmail());
        }
        if (newEmployee.getFirstName() != null) {
            this.setFirstName(newEmployee.getFirstName());
        }
        if (newEmployee.getLastName() != null) {
            this.setLastName(newEmployee.getLastName());
        }
        if (newEmployee.getGender() != null) {
            this.setGender(newEmployee.getGender());
        }
        if(newEmployee.getPhoneNumber() != null) {
            this.setPhoneNumber(newEmployee.getPhoneNumber());
        }
    }

    public Set<EquipmentControlDaily> getEquipmentControlDailies() {
        return equipmentControlDailies;
    }

    public void setEquipmentControlDailies(Set<EquipmentControlDaily> equipmentControlDailies) {
        this.equipmentControlDailies = equipmentControlDailies;
    }
}
