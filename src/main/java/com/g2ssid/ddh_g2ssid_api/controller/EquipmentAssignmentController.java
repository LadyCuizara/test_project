package com.g2ssid.ddh_g2ssid_api.controller;

import com.g2ssid.ddh_g2ssid_api.domain.model.employee.Employee;
import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.Equipment;
import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.EquipmentAssignment;
import com.g2ssid.ddh_g2ssid_api.exceptions.NotFoundException;
import com.g2ssid.ddh_g2ssid_api.report.specification.EquipmentAssignmentSpécification;
import com.g2ssid.ddh_g2ssid_api.report.specification.generic.SearchCriteria;
import com.g2ssid.ddh_g2ssid_api.report.specification.generic.SpecificationBuilder;
import com.g2ssid.ddh_g2ssid_api.resources.equipment.EquipmentAssignmentResource;
import com.g2ssid.ddh_g2ssid_api.resources.equipment.EquipmentAssignmentResourceAssembler;
import com.g2ssid.ddh_g2ssid_api.service.EmployeeService;
import com.g2ssid.ddh_g2ssid_api.service.EquipmentAssignmentService;
import com.g2ssid.ddh_g2ssid_api.service.EquipmentCategoryService;
import com.g2ssid.ddh_g2ssid_api.service.EquipmentService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

/**
 * @author Lady Laura Cuizara
 */
@Api(value = "EquipmentAssignment", description = "EquipmentAssignment Rest API")
@RestController
@RequestMapping("/equipment-assignment")
public class EquipmentAssignmentController {
    @Autowired
    private EquipmentAssignmentService service;

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private EquipmentService equipmentService;

    private EquipmentCategoryService categoryService;

    @Autowired
    private EquipmentAssignmentResourceAssembler assembler;

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<List<EquipmentAssignmentResource>> findAll(
        @RequestParam(value=SearchCriteria.SEARCH_PARAM_NAME, required = false) String search){
        SpecificationBuilder<EquipmentAssignment> builder = new SpecificationBuilder();
        Specification<EquipmentAssignment> specification = builder.build(search, EquipmentAssignmentSpécification.class);

            List<EquipmentAssignmentResource> equipmentAssignmentResourceList= new ArrayList<>();
        for (EquipmentAssignment equipmentAssignment: service.findAll()){
            equipmentAssignmentResourceList.add(assembler.toResource(equipmentAssignment));
        }
        return new ResponseEntity(equipmentAssignmentResourceList, HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.POST
    )
    public  ResponseEntity<EquipmentAssignmentResource> addEquipmentAssignment(@RequestBody EquipmentAssignmentResource resource){
        EquipmentAssignment equipmentAssignment= resource.toEntity();
        Employee employee=employeeService.findById(resource.getEmployeeId());
        if (employee == null){
            throw  new NotFoundException(Employee.class.getTypeName() + "id:"+ resource.getEmployeeId() + "Not Found");
        }
        Equipment equipment=equipmentService.findById(resource.getEquipmentId());
        if (equipment == null){
            throw  new NotFoundException(Equipment.class.getTypeName() + "id:"+ resource.getEquipmentId() + "Not Found");
        }else{
            equipment.setAvailable(false);
        }
        equipmentAssignment.setEmployee(employee);
        equipmentAssignment.setActive(true);
        equipmentAssignment.setEquipment(equipment);

        EquipmentAssignment savedEquipmentAssignment= service.save(equipmentAssignment);
        return new ResponseEntity(assembler.toResource(savedEquipmentAssignment), HttpStatus.OK);
    }
    @RequestMapping(
            method = RequestMethod.PUT,
            value = "/{id}"
    )
    public ResponseEntity<EquipmentAssignment> returnEquipment(@PathVariable Long id, @RequestBody EquipmentAssignmentResource resource) {
        List<EquipmentAssignment>  assignments = service.assingmentByEquipment(id);
        Equipment equipment = equipmentService.findById(id);
        EquipmentAssignment savedAssignment=assignments.get(0);
        if (savedAssignment ==null) {
            throw new NotFoundException("El equipo no tiene asignaciones");
        }
        //savedAssignment.merge(resource.toEntity());
        savedAssignment.setObservation(resource.getObservation());
        savedAssignment.setActive(false);
        equipment.setAvailable(true);
        //savedAssignment.setEndDate(new Date());
        Equipment equipmentUpdate=equipmentService.save(equipment);
        EquipmentAssignment returnAssignment=service.save(savedAssignment);

        return new ResponseEntity(assembler.toResource(returnAssignment), HttpStatus.OK);
    }
}
