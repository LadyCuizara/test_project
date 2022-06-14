package com.g2ssid.ddh_g2ssid_api.controller;

import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.Equipment;
import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.EquipmentCategory;
import com.g2ssid.ddh_g2ssid_api.exceptions.NotFoundException;
import com.g2ssid.ddh_g2ssid_api.report.specification.EquipmentSpecification;
import com.g2ssid.ddh_g2ssid_api.report.specification.generic.SearchCriteria;
import com.g2ssid.ddh_g2ssid_api.report.specification.generic.SpecificationBuilder;
import com.g2ssid.ddh_g2ssid_api.resources.equipment.EquipmentResource;
import com.g2ssid.ddh_g2ssid_api.resources.equipment.EquipmentResourceAssembler;
import com.g2ssid.ddh_g2ssid_api.service.EquipmentCategoryService;
import com.g2ssid.ddh_g2ssid_api.service.EquipmentService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import
        org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Api(value = "Equipment", description = "Equipment Rest API")
@RestController
@RequestMapping("/equipment")
public class EquipmentController {

    @Autowired
    private EquipmentService service;

    @Autowired
    private EquipmentCategoryService categoryService;

    @Autowired
    private EquipmentResourceAssembler assembler;

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<List<EquipmentResource>> findAll(
            @RequestParam(value = SearchCriteria.SEARCH_PARAM_NAME, required = false) String search) {
        SpecificationBuilder<Equipment> builder = new SpecificationBuilder();
        Specification<Equipment> specification = builder.build(search, EquipmentSpecification.class);


        List<EquipmentResource> resources = new ArrayList<>();
        for (Equipment equipment : service.findAll(specification)) {
            resources.add(assembler.toResource(equipment));
        }
        return new ResponseEntity(resources, HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.GET,
            value = "/{id}"
    )
    public ResponseEntity<EquipmentResource> findById(@PathVariable Long id) {
        Equipment equipment = service.findById(id);
        if (equipment == null ) {
            throw new NotFoundException(Equipment.class.getTypeName() + " id:" + id + " Not Found");
        }
        return new ResponseEntity(assembler.toResource(equipment), HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.POST
    )
    public ResponseEntity<EquipmentResource> addEquipment(@RequestBody EquipmentResource resource) {
        Equipment equipment = resource.toEntity();
        EquipmentCategory category = categoryService.findById(resource.getCategoryId());
        if (category == null) {
            throw new NotFoundException(EquipmentCategory.class.getTypeName() + " id:" + resource.getCategoryId() + " Not Found");
        }
        equipment.setCategory(category);
        equipment.setAvailable(true);
        Equipment savedEquipment = service.save(equipment);

        return new ResponseEntity(assembler.toResource(savedEquipment), HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.PUT,
            value = "/{id}"
    )
    public ResponseEntity<EquipmentResource> updateEquipment(@PathVariable Long id, @RequestBody EquipmentResource resource) {
        Equipment currentEquipment = service.findById(id);
        if (currentEquipment == null) {
            throw new NotFoundException(Equipment.class.getTypeName() + " id:" + id + " Not Found");
        }
        Equipment equipment = resource.toEntity();
        if (resource.getCategoryId() != null) {
            EquipmentCategory category = categoryService.findById(resource.getCategoryId());
            if (category == null) {
                throw new NotFoundException(EquipmentCategory.class.getTypeName() + " id:" + resource.getCategoryId() + " Not Found");
            }
            equipment.setCategory(category);
        }
        currentEquipment.merge(equipment);
        Equipment updateEquipment = service.save(currentEquipment);
        return new ResponseEntity(assembler.toResource(updateEquipment), HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.DELETE,
            value = "/{id}"
    )
    public void deleteEquipment(@PathVariable Long id) {
        service.deleteById(id);
    }
}
