package com.g2ssid.ddh_g2ssid_api.resources.employee;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.g2ssid.ddh_g2ssid_api.controller.EmployeeController;
import com.g2ssid.ddh_g2ssid_api.domain.model.employee.Employee;
import com.g2ssid.ddh_g2ssid_api.domain.model.employee.GenderType;
import com.g2ssid.ddh_g2ssid_api.resources.GenericResource;
import org.apache.tomcat.util.codec.binary.Base64;

import java.util.Date;

import static org.springframework.hateoas.mvc.ControllerLinkBuilder.linkTo;
import static org.springframework.hateoas.mvc.ControllerLinkBuilder.methodOn;

/**
 * @author giovanny delgadillo
 */
public class EmployeeResource extends GenericResource<Employee> {

    private String firstName;
    private String lastName;
    private Integer ci;
    private Date birthDate;
    private GenderType gender;
    private String picture;
    private Integer phoneNumber;
    private String email;
    private String address;

    @JsonIgnore
    private void setImageBase64(Employee employee) {
        if (employee.getPicture() != null) {
            byte[] bytes = new byte[employee.getPicture().length];
            for (int i = 0; i < employee.getPicture().length; i++) {
                bytes[i] = employee.getPicture()[i];
            }
            String imageStr = Base64.encodeBase64String(bytes);
            this.setPicture(imageStr);
        }
    }
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

    public GenderType getGender() {
        return gender;
    }

    public void setGender(GenderType gender) {
        this.gender = gender;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public Employee toEntity() {
        Employee employee = new Employee();
        employee.setFirstName(getFirstName());
        employee.setLastName(getLastName());
        employee.setGender(getGender());
        employee.setEmail(getEmail());
        employee.setCi(getCi());
        employee.setBirthDate(getBirthDate());
        employee.setAddress(getAddress());
        employee.setPhoneNumber(getPhoneNumber());
        return employee;
    }

    @Override
    public void updateFromEntity(Employee entity) {
        setAddress(entity.getAddress());
        setBirthDate(entity.getBirthDate());
        setCi(entity.getCi());
        setEmail(entity.getEmail());
        setFirstName(entity.getFirstName());
        setLastName(entity.getLastName());
        setGender(entity.getGender());
        setPhoneNumber(entity.getPhoneNumber());
        setImageBase64(entity);
    }

    @Override
    public void addLinks() {
        add(linkTo(methodOn(EmployeeController.class).findById(getResourceId())).slash("contracts").withRel("contracts"));
    }
}
