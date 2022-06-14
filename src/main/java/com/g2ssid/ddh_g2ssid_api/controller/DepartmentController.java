package com.g2ssid.ddh_g2ssid_api.controller;

import com.g2ssid.ddh_g2ssid_api.domain.model.department.Department;
import com.g2ssid.ddh_g2ssid_api.domain.model.position.Position;
import com.g2ssid.ddh_g2ssid_api.domain.model.project.Project;
import com.g2ssid.ddh_g2ssid_api.exceptions.NotFoundException;
import com.g2ssid.ddh_g2ssid_api.report.specification.DepartmentSpecification;
import com.g2ssid.ddh_g2ssid_api.report.specification.generic.SearchCriteria;
import com.g2ssid.ddh_g2ssid_api.report.specification.generic.SpecificationBuilder;
import com.g2ssid.ddh_g2ssid_api.resources.employee.PositionResource;
import com.g2ssid.ddh_g2ssid_api.resources.employee.PositionResourceAssembler;
import com.g2ssid.ddh_g2ssid_api.resources.project.AssignPositionResource;
import com.g2ssid.ddh_g2ssid_api.resources.project.DepartmentResource;
import com.g2ssid.ddh_g2ssid_api.resources.project.DepartmentResourceAssembler;
import com.g2ssid.ddh_g2ssid_api.service.*;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Judith Delgadillo
 */

@Api(value = "Department", description = "Department Rest API")
@RestController
@RequestMapping("/departments")
public class DepartmentController {

    @Autowired
    private DepartmentServicelmpl servicelmpl;
    @Autowired
    private DepartmentResourceAssembler departmentResourceAssembler;
    @Autowired
    private PositionServiceImpl positionServiceImpl;
    @Autowired
    private ProjectServiceImpl projectServiceImpl;
    @Autowired
    private PositionResourceAssembler positionResourceAssembler;

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<List<DepartmentResource>> findAllDepartments(
            @RequestParam(value = SearchCriteria.SEARCH_PARAM_NAME, required = false) String search) {
        SpecificationBuilder<Department> builder = new SpecificationBuilder();
        Specification<Department> specification = builder.build(search, DepartmentSpecification.class);
        List<DepartmentResource> resources = new ArrayList<>();
        for (Department department : servicelmpl.findAll(specification)) {
            resources.add(departmentResourceAssembler.toResource(department));
        }
        return new ResponseEntity(resources, HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.GET,
            value = "/{id}"
    )
    public ResponseEntity<DepartmentResource> findById(@PathVariable Long id) {
        Department department = servicelmpl.getById(id);
        if (department == null ) {
            throw new NotFoundException(Department.class.getTypeName() + " id:" + id + " Not Found");
        }
        return new ResponseEntity(departmentResourceAssembler.toResource(department), HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.POST
    )
    public ResponseEntity<Department> addDepartment(@RequestBody DepartmentResource departmentResource) {
        Department department = departmentResource.toEntity();
        Department savedDepartment = servicelmpl.save(department);
        return new ResponseEntity(departmentResourceAssembler.toResource(savedDepartment), HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.PUT,
            value = "/{id}"
    )
    public ResponseEntity<Department> updateDepartment(@PathVariable Long id, @RequestBody DepartmentResource departmentResource) {
        Department currentDepartment = servicelmpl.getById(id);
        if (currentDepartment == null) {
            throw new NotFoundException(Department.class.getTypeName() + " id:" + id + " Not Found");
        }
        currentDepartment.merge(departmentResource.toEntity());
        Department updateEquipment = servicelmpl.update(currentDepartment);
        return new ResponseEntity(departmentResourceAssembler.toResource(updateEquipment), HttpStatus.OK);
    }


    @RequestMapping(
            method = RequestMethod.DELETE,
            value = "/{id}"
    )
    public void deleteDepartment(@PathVariable Long id) {
        Department saved = servicelmpl.getById(id);
        if (saved == null) {
            throw new NotFoundException(Department.class.getTypeName() + " id:" + id + " Not Found");
        }
        servicelmpl.delete(id);
    }

    @RequestMapping(
            method = RequestMethod.GET,
            value = "/{id}/positions"
    )
    public ResponseEntity<List<PositionResource>> getAssignPositions(@PathVariable Long id) {
        List<Position> departments = positionServiceImpl.getPositionsByDepartmentId(id);
        List<PositionResource> listResult = new ArrayList<>();
        for (Position position : departments) {
            listResult.add(positionResourceAssembler.toResource(position));
        }
        return new ResponseEntity<>(listResult, HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.POST,
            value = "/{id}/positions/assignPositions"
    )
    public ResponseEntity<List<PositionResource>> saveAssignDepartments(@PathVariable Long id, @RequestBody AssignPositionResource assignPositionResource) {
        List<Position> positionsList = servicelmpl.assignDeparments(id, assignPositionResource);
        List<PositionResource> listResult = new ArrayList<>();
        for (Position position : positionsList) {
            listResult.add(positionResourceAssembler.toResource(position));
        }
        return new ResponseEntity<>(listResult, HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.GET,
            value = "/{id}/departmentsByProject")
    public ResponseEntity<List<Department>> departmentsByProject(@PathVariable Long id){
        Project project = projectServiceImpl.findById(id);
        List<DepartmentResource> result = new ArrayList<>();
        if(project == null){
            throw new NotFoundException(Project.class.getTypeName() + " id:" + id + " Not Found");
        }
        List<Department> listDepartments = servicelmpl.getDepartmentsByProject(project.getId());
        for(Department department: listDepartments){
            result.add(departmentResourceAssembler.toResource(department));
        }
        return new ResponseEntity(result, HttpStatus.OK);
    }
}
