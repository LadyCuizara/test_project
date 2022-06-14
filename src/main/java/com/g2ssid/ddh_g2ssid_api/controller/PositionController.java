package com.g2ssid.ddh_g2ssid_api.controller;

import com.g2ssid.ddh_g2ssid_api.domain.model.position.Contract;
import com.g2ssid.ddh_g2ssid_api.domain.model.position.Position;
import com.g2ssid.ddh_g2ssid_api.exceptions.NotFoundException;
import com.g2ssid.ddh_g2ssid_api.resources.employee.ContractResource;
import com.g2ssid.ddh_g2ssid_api.resources.employee.ContractResourceAssembler;
import com.g2ssid.ddh_g2ssid_api.resources.employee.PositionResource;
import com.g2ssid.ddh_g2ssid_api.resources.employee.PositionResourceAssembler;
import com.g2ssid.ddh_g2ssid_api.service.PositionService;
import com.g2ssid.ddh_g2ssid_api.service.PositionServiceImpl;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.config.EnableHypermediaSupport;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Api(value = "Position", description = "Position Rest API")
@RestController
@EnableHypermediaSupport(type = EnableHypermediaSupport.HypermediaType.HAL)
@RequestMapping("/positions")
public class PositionController {

    @Autowired
    private PositionServiceImpl service;

    @Autowired
    private PositionResourceAssembler assembler;

    @Autowired
    private ContractResourceAssembler assemblerContract;

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<List<PositionResource>> findAllPositions() {
        List<PositionResource> positionResourceList = new ArrayList<>();
        for (Position position : service.findAll()) {
            positionResourceList.add(assembler.toResource(position));
        }
        return new ResponseEntity(positionResourceList, HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.GET,
            value = "/{id}"
    )
    public ResponseEntity<PositionResource> findById(@PathVariable Long id) {
        Position position = service.getById(id);
        if (position == null ) {
            throw new NotFoundException(Position.class.getTypeName() + " id:" + id + " Not Found");
        }
        return new ResponseEntity(assembler.toResource(position), HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.POST
    )
    public ResponseEntity<PositionResource> addPosition(@RequestBody PositionResource positionResource) {
        Position savedPosition = service.save(positionResource.toEntity());

        return new ResponseEntity(assembler.toResource(savedPosition), HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.PUT,
            value = "/{id}"
    )
    public ResponseEntity<PositionResource> updatePosition(@PathVariable Long id, @RequestBody PositionResource positionResource) {
        Position currentPosition = service.getById(id);
        if (currentPosition == null) {
            throw new NotFoundException(Position.class.getTypeName() + " id:" + id + " Not Found");
        }

        currentPosition.merge(positionResource.toEntity());
        Position updatePosition = service.update(currentPosition);
        return new ResponseEntity(assembler.toResource(updatePosition), HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.DELETE,
            value = "/{id}"
    )
    public void deletePosition(@PathVariable Long id) {
        Position saved = service.getById(id);
        if (saved == null) {
            throw new NotFoundException(Position.class.getTypeName() + " id:" + id + " Not Found");
        }
        service.delete(id);
    }

    @RequestMapping(
            method = RequestMethod.GET,
            value = "/{id}/contracts")
    public ResponseEntity<List<ContractResource>> findAllContract(@PathVariable Long id) {
        Position position = service.findById(id);
        if (position == null ) {
            throw new NotFoundException(Position.class.getTypeName() + " id:" + id + " Not Found");
        }
        List<ContractResource> contractResourceList = new ArrayList<>();
        for (Contract contract : position.getContracts()) {
            contractResourceList.add(assemblerContract.toResource(contract));
        }
        return new ResponseEntity(contractResourceList, HttpStatus.OK);
    }
}
