package com.g2ssid.ddh_g2ssid_api.controller;

import com.g2ssid.ddh_g2ssid_api.domain.model.employee.Employee;
import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.Equipment;
import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.EquipmentControlDaily;
import com.g2ssid.ddh_g2ssid_api.domain.model.position.Contract;
import com.g2ssid.ddh_g2ssid_api.exceptions.NotFoundException;
import com.g2ssid.ddh_g2ssid_api.report.specification.EmployeeSpecification;
import com.g2ssid.ddh_g2ssid_api.report.specification.generic.SearchCriteria;
import com.g2ssid.ddh_g2ssid_api.report.specification.generic.SpecificationBuilder;
import com.g2ssid.ddh_g2ssid_api.resources.employee.ContractResource;
import com.g2ssid.ddh_g2ssid_api.resources.employee.ContractResourceAssembler;
import com.g2ssid.ddh_g2ssid_api.resources.employee.EmployeeResource;
import com.g2ssid.ddh_g2ssid_api.resources.employee.EmployeeResourceAssembler;
import com.g2ssid.ddh_g2ssid_api.resources.equipment.EquipmentResource;
import com.g2ssid.ddh_g2ssid_api.resources.equipment.EquipmentResourceAssembler;
import com.g2ssid.ddh_g2ssid_api.service.EquipmentService;

import com.g2ssid.ddh_g2ssid_api.resources.equipment.EquipmentControlDailyResource;
import com.g2ssid.ddh_g2ssid_api.resources.equipment.EquipmentControlDailyResourceAssembler;
import com.g2ssid.ddh_g2ssid_api.service.EmployeeService;
import com.g2ssid.ddh_g2ssid_api.service.EmployeeServiceImpl;
import com.g2ssid.ddh_g2ssid_api.service.EquipmentControlDailyService;
import com.g2ssid.ddh_g2ssid_api.service.EquipmentControlDailyServiceImpl;
import com.google.common.net.HttpHeaders;
import io.swagger.annotations.Api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.hateoas.config.EnableHypermediaSupport;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


/**
 * @author giovanny delgadillo
 */

@Api(value = "Employee", description = "Employee Rest API")
@RestController
@EnableHypermediaSupport(type = EnableHypermediaSupport.HypermediaType.HAL)
@RequestMapping("/employees")
public class EmployeeController {

    @Autowired
    private EmployeeServiceImpl service;
    @Autowired
    private EquipmentControlDailyServiceImpl equipmentControlDailyService;
    @Autowired
    private EmployeeResourceAssembler assembler;
    @Autowired
    private ContractResourceAssembler assemblerContract;
    @Autowired
    private EquipmentControlDailyResourceAssembler equipmentControlDailyResourceAssembler;

    @Autowired
    private EquipmentService equipmentService;
    @Autowired
    private EquipmentResourceAssembler equipmentResourceAssembler;


    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<List<EmployeeResource>> findAllEmployees(
            @RequestParam(value = SearchCriteria.SEARCH_PARAM_NAME, required = false) String search) {
        SpecificationBuilder<Employee> builder = new SpecificationBuilder();
        Specification<Employee> specification = builder.build(search, EmployeeSpecification.class);

        List<EmployeeResource> employeeResourceList = new ArrayList<>();
        for (Employee employee : service.getAllEmployees(specification)) {
            employeeResourceList.add(assembler.toResource(employee));
        }
        return new ResponseEntity(employeeResourceList, HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.GET,
            value = "/{id}"
    )
    public ResponseEntity<EmployeeResource> findById(@PathVariable Long id) {
        Employee employee = service.getById(id);
        if (employee == null ) {
            throw new NotFoundException(Employee.class.getTypeName() + " id:" + id + " Not Found");
        }
        return new ResponseEntity(assembler.toResource(employee), HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.POST
    )
    public ResponseEntity<EmployeeResource> addEmployee(@RequestBody EmployeeResource employeeResource) {
        Employee savedEmployee = service.save(employeeResource.toEntity());

        return new ResponseEntity(assembler.toResource(savedEmployee), HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.PUT,
            value = "/{id}"
    )
    public ResponseEntity<EmployeeResource> updateEmployee(@PathVariable Long id, @RequestBody EmployeeResource employeeResource) {
        Employee savedEmployee = service.findById(id);
        if (savedEmployee == null) {
            throw new NotFoundException(Employee.class.getTypeName() + " id:" + id + " Not Found");
        }
        savedEmployee.merge(employeeResource.toEntity());
        Employee updatedEmployee = service.update(savedEmployee);

        return new ResponseEntity(assembler.toResource(updatedEmployee), HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.DELETE,
            value = "/{id}"
    )
    public void deleteEmployee(@PathVariable Long id){
        Employee savedEmployee = service.getById(id);
        if (savedEmployee == null) {
            throw new NotFoundException(Employee.class.getTypeName() + " id:" + id + " Not Found");
        }
        service.delete(id);
    }

    @RequestMapping(
            method = RequestMethod.POST,
            value = "/{id}/pictures",
            headers = HttpHeaders.CONTENT_TYPE,
            consumes = MediaType.MULTIPART_FORM_DATA_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    public ResponseEntity uploadFile(@PathVariable Long id,
                                     @RequestParam("picture") MultipartFile inputFile) {
        Employee savedEmployee = service.findById(id);
        if (savedEmployee == null) {
            throw new NotFoundException(Employee.class.getTypeName() + " id:" + id + " Not Found");
        }
        if (!inputFile.isEmpty()) {
            try {
                service.savePicture(id, inputFile.getInputStream());
            } catch (IOException e) {
                return new ResponseEntity(HttpStatus.BAD_REQUEST);
            }
        } else {
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity(HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.GET,
            value = "/{id}/contracts")
    public ResponseEntity<List<ContractResource>> findAllContract(@PathVariable Long id) {
        Employee employee = service.findById(id);
        if (employee == null ) {
            throw new NotFoundException(Employee.class.getTypeName() + " id:" + id + " Not Found");
        }
        List<ContractResource> contractResourceList = new ArrayList<>();
        for (Contract contract : employee.getContracts()) {
            contractResourceList.add(assemblerContract.toResource(contract));
        }
        return new ResponseEntity(contractResourceList, HttpStatus.OK);
    }
    @RequestMapping(
            method = RequestMethod.GET,
            value = "/{id}/equipment-assignment")
    public ResponseEntity<List<Equipment>> equipmetsAssignment(@PathVariable Long id) {
        Employee employee = service.findById(id);
        List<EquipmentResource> listResult=new ArrayList<>();
        if(employee == null){
            throw new NotFoundException(Employee.class.getTypeName() + " id:" + id + " Not Found");
        }
        List<Equipment> equipmentsAssignment = equipmentService.equipmentsAssignmentByEmployee(employee.getId());
        for (Equipment equipment : equipmentsAssignment){
            listResult.add(equipmentResourceAssembler.toResource(equipment));
        }
        return new ResponseEntity(listResult,HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.POST,
            value = "/{id}/equipments/controlDaily"
    )
    public ResponseEntity<EquipmentControlDailyResource> test(@PathVariable Long id, @RequestBody EquipmentControlDailyResource equipmentControlDailyResource) {
        EquipmentControlDaily equipmentControlDaily = equipmentControlDailyService.registerUseDailyEquipment(id, equipmentControlDailyResource);
        return new ResponseEntity<>(equipmentControlDailyResourceAssembler.toResource(equipmentControlDaily), HttpStatus.OK);
    }
}
