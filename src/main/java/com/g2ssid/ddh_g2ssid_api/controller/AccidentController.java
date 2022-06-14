package com.g2ssid.ddh_g2ssid_api.controller;

import com.g2ssid.ddh_g2ssid_api.domain.model.accident.Accident;
import com.g2ssid.ddh_g2ssid_api.domain.model.employee.Employee;
import com.g2ssid.ddh_g2ssid_api.domain.model.position.Contract;
import com.g2ssid.ddh_g2ssid_api.domain.model.position.Position;
import com.g2ssid.ddh_g2ssid_api.exceptions.NotFoundException;
import com.g2ssid.ddh_g2ssid_api.resources.accident.AccidentResource;
import com.g2ssid.ddh_g2ssid_api.resources.accident.AccidentResourceAssembler;
import com.g2ssid.ddh_g2ssid_api.resources.employee.ContractResource;
import com.g2ssid.ddh_g2ssid_api.resources.employee.ContractResourceAssembler;
import com.g2ssid.ddh_g2ssid_api.service.*;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.ArrayList;
import java.util.List;

/**
 * @autor Michel Terrazas Mercado
 */
@Api(value = "Accident", description = "Accident Rest API")
@RestController
@RequestMapping("/accidents")
public class AccidentController {
    @Autowired
    private AccidentServiceImpl service;


    @Autowired
    private AccidentResourceAssembler assembler;

    @Autowired
    private EmployeeService employeeService;
/*
    @Autowired
    private PositionService positionService;

    @Autowired
    private ContractResourceAssembler assembler2;
*/

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<List<AccidentResource>> findAll() {
        List<AccidentResource> accidentResourceList = new ArrayList<>();
        for (Accident accident : service.findAll()) {
            accidentResourceList.add(assembler.toResource(accident));
        }
        return new ResponseEntity(accidentResourceList, HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.GET,
            value = "/{id}"
    )
    public ResponseEntity<AccidentResource> findById(@PathVariable Long id) {
        Accident accident = service.findById(id);
        if (accident == null ) {
            throw new NotFoundException(Accident.class.getTypeName() + " id:" + id + " Not Found");
        }
        return new ResponseEntity(assembler.toResource(accident), HttpStatus.OK);
    }


    @RequestMapping(
            method = RequestMethod.POST
    )
    public ResponseEntity<AccidentResource> addAccident(@RequestBody AccidentResource accidentResource) {
        Accident accident = accidentResource.toEntity();
        Employee employee = employeeService.findById(accidentResource.getEmployeeId());
        if (employee == null) {
            throw new NotFoundException(Employee.class.getTypeName() + " id:" + accidentResource.getEmployeeId() + " Not Found");
        }
        accident.setEmployee(employee);
        Accident savedAccident = service.save(accident);
        return new ResponseEntity(assembler.toResource(savedAccident), HttpStatus.OK);
    }


    @RequestMapping(
            method = RequestMethod.PUT,
            value = "/{id}"
    )
    public ResponseEntity<AccidentResource> updateAccident(@PathVariable Long id, @RequestBody AccidentResource resource) {
        Accident savedAccident = service.findById(id);
        if (savedAccident == null) {
            throw new NotFoundException(Contract.class.getTypeName() + " id:" + id + " Not Found");
        }
        savedAccident.merge(resource.toEntity());
        Accident updatedAccident = service.update(savedAccident);
        return new ResponseEntity(assembler.toResource(updatedAccident), HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.DELETE,
            value = "/{id}"
    )
    public void deleteAccident(@PathVariable Long id) {
        service.delete(id);
    }

}


