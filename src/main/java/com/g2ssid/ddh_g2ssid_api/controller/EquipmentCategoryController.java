package com.g2ssid.ddh_g2ssid_api.controller;

import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.Equipment;
import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.EquipmentCategory;
import com.g2ssid.ddh_g2ssid_api.exceptions.NotFoundException;
import com.g2ssid.ddh_g2ssid_api.report.specification.EquipmentCategorySpecification;
import com.g2ssid.ddh_g2ssid_api.report.specification.generic.SearchCriteria;
import com.g2ssid.ddh_g2ssid_api.report.specification.generic.SpecificationBuilder;
import com.g2ssid.ddh_g2ssid_api.resources.equipment.EquipmentCategoryResource;
import com.g2ssid.ddh_g2ssid_api.resources.equipment.EquipmentCategoryResourceAssembler;
import com.g2ssid.ddh_g2ssid_api.resources.equipment.EquipmentResource;
import com.g2ssid.ddh_g2ssid_api.resources.equipment.EquipmentResourceAssembler;
import com.g2ssid.ddh_g2ssid_api.service.EquipmentCategoryServiceImpl;
import com.g2ssid.ddh_g2ssid_api.service.EquipmentService;
import com.g2ssid.ddh_g2ssid_api.service.EquipmentServiceImpl;
import com.g2ssid.ddh_g2ssid_api.service.EquipmentCategoryService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureOrder;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Api(value = "EquipmentCategory", description = "EquipmentCategory Rest API")
@RestController
@RequestMapping("/equipment-categories")
public class EquipmentCategoryController {

    @Autowired
    private EquipmentCategoryServiceImpl service;
    @Autowired
    private EquipmentCategoryResourceAssembler assembler;
    @Autowired
    private EquipmentServiceImpl equipmentService;
    @Autowired
    private EquipmentResourceAssembler equipmentAssembler;

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<List<EquipmentCategoryResource>> findAll(
            @RequestParam(value = SearchCriteria.SEARCH_PARAM_NAME, required = false) String search){
            SpecificationBuilder<EquipmentCategory> builder = new SpecificationBuilder();
            Specification<EquipmentCategory> specification = builder.build(search, EquipmentCategorySpecification.class);

        List<EquipmentCategoryResource> categories = new ArrayList<>();
        for (EquipmentCategory category : service.findAll(specification)) {
            categories.add(assembler.toResource(category));
        }
        return new ResponseEntity(categories, HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.GET,
            value = "/{id}"
    )
    public ResponseEntity<EquipmentCategoryResource> findById(@PathVariable Long id) {
        EquipmentCategory equipmentCategory = service.findById(id);
        if (equipmentCategory == null ) {
            throw new NotFoundException(EquipmentCategory.class.getTypeName() + " id:" + id + " Not Found");
        }
        return new ResponseEntity(assembler.toResource(equipmentCategory), HttpStatus.OK);
    }
    @RequestMapping(
            method = RequestMethod.POST
    )
    public ResponseEntity<EquipmentCategoryResource> addEquipment(@RequestBody EquipmentCategoryResource equipmentCategory) {
        EquipmentCategory savedEquipmentCategory = service.save(equipmentCategory.toEntity());

        return new ResponseEntity(assembler.toResource(savedEquipmentCategory), HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.PUT,
            value = "/{id}"
    )
    public ResponseEntity<EquipmentCategoryResource> updateEquipment(@PathVariable Long id, @RequestBody EquipmentCategoryResource equipmentCategory) {
        EquipmentCategory currentEquipmentCategory = service.findById(id);
        if (currentEquipmentCategory == null) {
            throw new NotFoundException(EquipmentCategory.class.getTypeName() + " id:" + id + " Not Found");
        }

        currentEquipmentCategory.merge(equipmentCategory.toEntity());
        EquipmentCategory updateEquipmentCategory = service.save(currentEquipmentCategory);
        return new ResponseEntity(assembler.toResource(updateEquipmentCategory), HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.DELETE,
            value = "/{id}"
    )
    public void deleteEquipment(@PathVariable Long id) {
        service.deleteById(id);
    }

    /*
    * created by: Lady
    * method:find by equipment type
    * */

    @RequestMapping(
            method = RequestMethod.GET,
            value = "/categories/{type}"
    )
    public ResponseEntity<List<EquipmentCategoryResource>> findByType(@PathVariable String type) {
        List<EquipmentCategoryResource> categories = new ArrayList<>();
        List<EquipmentCategory> listCategories = service.findAll();
        for (EquipmentCategory category : listCategories) {
            if (category.getEquipmentType().getKey().equals(type))
                categories.add(assembler.toResource(category));        }
        return new ResponseEntity(categories, HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.GET,
            value = "/{id}/equipments"
    )
    public ResponseEntity<List<EquipmentResource>> findEquipmentsByCategoryId(@PathVariable Long id) {
        /*EquipmentCategory equipmentCategory = service.findById(id);
        if (equipmentCategory == null ) {
            throw new NotFoundException(EquipmentCategory.class.getTypeName() + " id:" + id + " Not Found");
        }*/
        List<Equipment> equipments = equipmentService.getEquipmentByCategory(id);
        List<EquipmentResource> equipmentResources = new ArrayList<>();

        for (Equipment equipment : equipments) {
            equipmentResources.add(equipmentAssembler.toResource(equipment));
        }
        return new ResponseEntity(equipmentResources, HttpStatus.OK);
    }
}


