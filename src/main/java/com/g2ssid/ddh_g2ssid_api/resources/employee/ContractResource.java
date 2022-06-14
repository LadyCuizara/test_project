package com.g2ssid.ddh_g2ssid_api.resources.employee;

import com.g2ssid.ddh_g2ssid_api.controller.EmployeeController;
import com.g2ssid.ddh_g2ssid_api.controller.PositionController;
import com.g2ssid.ddh_g2ssid_api.domain.model.position.Contract;
import com.g2ssid.ddh_g2ssid_api.domain.model.position.EmployeeType;
import com.g2ssid.ddh_g2ssid_api.resources.GenericResource;

import java.math.BigDecimal;
import java.util.Date;

import static org.springframework.hateoas.mvc.ControllerLinkBuilder.linkTo;
import static org.springframework.hateoas.mvc.ControllerLinkBuilder.methodOn;

/**
 * @author giovanny delgadillo
 */
public class ContractResource extends GenericResource<Contract> {

    private Long employeeId;
    private Long positionId;
    private Long projectId;
    private Date initDate;
    private Date endDate;
    private EmployeeType employeeType;
    private BigDecimal salary;
    private String employee;
    private String position;
    private String project;

    public String getEmployee() {
        return employee;
    }

    public void setEmployee(String employee) {
        this.employee = employee;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public Long getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Long employeeId) {
        this.employeeId = employeeId;
    }

    public Long getProjectId() {
        return projectId;
    }

    public void setProjectId(Long projectId) {
        this.projectId = projectId;
    }

    public String getProject() {
        return project;
    }

    public void setProject(String project) {
        this.project = project;
    }

    public Long getPositionId() {
        return positionId;
    }

    public void setPositionId(Long positionId) {
        this.positionId = positionId;
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

    @Override
    public Contract toEntity() {
        Contract contract = new Contract();
        contract.setInitDate(getInitDate());
        contract.setSalary(getSalary());
        contract.setEndDate(getEndDate());
        contract.setEmployeeType(getEmployeeType());
        return contract;
    }

    @Override
    public void updateFromEntity(Contract contract) {
        setEmployeeId(contract.getEmployee().getId());
        setPositionId(contract.getPosition().getId());
        setProjectId(contract.getProject().getId());
        setEmployeeType(contract.getEmployeeType());
        setInitDate(contract.getInitDate());
        setEndDate(contract.getEndDate());
        setSalary(contract.getSalary());
        setEmployee(contract.getEmployee().getFirstName()+" "+ contract.getEmployee().getLastName());
        setPosition(contract.getPosition().getName());
        setProject(contract.getProject().getName());
    }

    @Override
    public void addLinks() {
        add(linkTo(methodOn(PositionController.class).findById(getPositionId())).withRel("position"));
        add(linkTo(methodOn(EmployeeController.class).findById(getEmployeeId())).withRel("employee"));
    }
}
