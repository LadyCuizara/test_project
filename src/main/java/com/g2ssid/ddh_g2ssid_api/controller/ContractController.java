package com.g2ssid.ddh_g2ssid_api.controller;

import com.g2ssid.ddh_g2ssid_api.domain.model.employee.Employee;
import com.g2ssid.ddh_g2ssid_api.domain.model.position.Contract;
import com.g2ssid.ddh_g2ssid_api.domain.model.position.Position;
import com.g2ssid.ddh_g2ssid_api.domain.model.project.Project;
import com.g2ssid.ddh_g2ssid_api.exceptions.NotFoundException;
import com.g2ssid.ddh_g2ssid_api.report.specification.ContractSpecification;
import com.g2ssid.ddh_g2ssid_api.report.specification.generic.SearchCriteria;
import com.g2ssid.ddh_g2ssid_api.report.specification.generic.SpecificationBuilder;
import com.g2ssid.ddh_g2ssid_api.resources.employee.ContractResource;
import com.g2ssid.ddh_g2ssid_api.resources.employee.ContractResourceAssembler;
import com.g2ssid.ddh_g2ssid_api.service.*;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.hateoas.config.EnableHypermediaSupport;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;
import java.io.IOException;

/**
 * @author giovanny delgadillo
 */
@Api(value = "Contract", description = "Contract Rest API")
@RestController
@RequestMapping("/contracts")
public class ContractController {
    @Autowired
    private ContractServiceImpl service;

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private PositionService positionService;

    @Autowired
    private ProjectService projectService;

    @Autowired
    private ContractResourceAssembler assembler;

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<List<ContractResource>> findAllContracts(@RequestParam(value = SearchCriteria.SEARCH_PARAM_NAME, required = false) String search) {
        SpecificationBuilder<Contract> builder = new SpecificationBuilder();
        Specification<Contract> specification = builder.build(search, ContractSpecification.class);

        List<ContractResource> contractResourceList = new ArrayList<>();
        for (Contract contract : service.findAll(specification)) {
            contractResourceList.add(assembler.toResource(contract));
        }
        return new ResponseEntity(contractResourceList, HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.GET,
            value = "/{id}"
    )
    public ResponseEntity<ContractResource> findById(@PathVariable Long id) {
        Contract contract = service.getById(id);
        if (contract == null ) {
            throw new NotFoundException(Contract.class.getTypeName() + " id:" + id + " Not Found");
        }
        return new ResponseEntity(assembler.toResource(contract), HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.POST
    )
    public ResponseEntity<ContractResource> addContract(@RequestBody ContractResource resource) {
        Contract contract = resource.toEntity();
        Employee employee = employeeService.findById(resource.getEmployeeId());
        if (employee == null) {
            throw new NotFoundException(Employee.class.getTypeName() + " id:" + resource.getEmployeeId() + " Not Found");
        }
        Position position = positionService.findById(resource.getPositionId());
        if (position == null) {
            throw new NotFoundException(Position.class.getTypeName() + " id:" + resource.getPositionId() + " Not Found");
        }
        Project project = projectService.findById(resource.getProjectId());
        if (project == null) {
            throw new NotFoundException(Project.class.getTypeName() + " id:" + resource.getPositionId() + " Not Found");
        }
        contract.setEmployee(employee);
        contract.setPosition(position);
        contract.setProject(project);
        Contract savedContract = service.save(contract);
        return new ResponseEntity(assembler.toResource(savedContract), HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.PUT,
            value = "/{id}"
    )
    public ResponseEntity<ContractResource> updateContract(@PathVariable Long id, @RequestBody ContractResource resource) {
        Contract savedContract = service.getById(id);
        if (savedContract == null) {
            throw new NotFoundException(Contract.class.getTypeName() + " id:" + id + " Not Found");
        }
        savedContract.merge(resource.toEntity());
        Contract updatedContract = service.update(savedContract);
        return new ResponseEntity(assembler.toResource(updatedContract), HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.DELETE,
            value = "/{id}"
    )
    public void deleteContract(@PathVariable Long id) {
        Contract saved = service.getById(id);
        if (saved == null) {
            throw new NotFoundException(Contract.class.getTypeName() + " id:" + id + " Not Found");
        }
        service.delete(id);
    }
}
