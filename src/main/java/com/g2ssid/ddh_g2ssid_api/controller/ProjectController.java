package com.g2ssid.ddh_g2ssid_api.controller;

import com.g2ssid.ddh_g2ssid_api.domain.model.department.Department;
import com.g2ssid.ddh_g2ssid_api.domain.model.project.Project;
import com.g2ssid.ddh_g2ssid_api.exceptions.NotFoundException;
import com.g2ssid.ddh_g2ssid_api.report.specification.ProjectSpecification;
import com.g2ssid.ddh_g2ssid_api.report.specification.generic.SearchCriteria;
import com.g2ssid.ddh_g2ssid_api.report.specification.generic.SpecificationBuilder;
import com.g2ssid.ddh_g2ssid_api.resources.project.*;
import com.g2ssid.ddh_g2ssid_api.service.DepartmentServicelmpl;
import com.g2ssid.ddh_g2ssid_api.service.ProjectService;
import com.g2ssid.ddh_g2ssid_api.service.ProjectServiceImpl;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Julio Quispe
 */

@Api(value = "Project", description = "Project Rest API")
@RestController
@RequestMapping("/projects")
public class ProjectController {

    @Autowired
    private ProjectServiceImpl service;
    @Autowired
    private DepartmentServicelmpl departmentService;
    @Autowired
    private DepartmentResourceAssembler departmentResourceAssembler;
    @Autowired
    private ProjectResourceAssembler projectResourceAssembler;


    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<List<ProjectResource>> findAllProjects(@RequestParam(value = SearchCriteria.SEARCH_PARAM_NAME, required = false) String search) {
        List<ProjectResource> result = new ArrayList<>();
        SpecificationBuilder<Project> builder = new SpecificationBuilder<>();
        Specification<Project> specification = builder.build(search, ProjectSpecification.class);
        for (Project project : service.findAll(specification)) {
            result.add(projectResourceAssembler.toResource(project));
        }
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.GET,
            value = "/{id}"
    )
    public ResponseEntity<ProjectResource> findById(@PathVariable Long id) {
        Project project = service.getById(id);
        if (project == null) {
            throw new NotFoundException(Project.class.getTypeName() + " id:" + id + " Not Found");
        }
        return new ResponseEntity(projectResourceAssembler.toResource(project), HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.POST
    )
    public ResponseEntity<Project> addProject(@RequestBody ProjectResource projectResource) {
        Project project = projectResource.toEntity();
        Project savedProject = service.save(project);
        return new ResponseEntity(projectResourceAssembler.toResource(savedProject), HttpStatus.OK);
    }


    @RequestMapping(
            method = RequestMethod.PUT,
            value = "/{id}"
    )

    public ResponseEntity<ProjectResource> updateProject(@PathVariable long id, @RequestBody ProjectResource projectResource) {
        Project saveProject = service.getById(id);
        if(saveProject == null) {
            throw new NotFoundException(Project.class.getTypeName() + " id:" + id + " Not Found");
        }
        saveProject.merge(projectResource.toEntity());
        Project updateProject = service.update(saveProject);
        return  new ResponseEntity<>(projectResourceAssembler.toResource(updateProject), HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.GET,
            value = "/{id}/departments"
    )
    public ResponseEntity<List<DepartmentResource>> getAssignDepartaments(@PathVariable Long id) {
        List<Department> departments = departmentService.getDepartmentsByProjectId(id);
        List<DepartmentResource> listResult = new ArrayList<>();
        for (Department department : departments) {
            listResult.add(departmentResourceAssembler.toResource(department));
        }
        return new ResponseEntity<>(listResult, HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.POST,
            value = "/{id}/departments/assignDepartments"
    )
    public ResponseEntity<List<DepartmentResource>> saveAssignDepartments(@PathVariable Long id, @RequestBody AssignDepartmentsResource assignDepartmentsResource) {
        List<Department> departments = service.assignDeparments(id, assignDepartmentsResource);
        List<DepartmentResource> listResult = new ArrayList<>();
        for (Department department : departments) {
            listResult.add(departmentResourceAssembler.toResource(department));
        }
        return new ResponseEntity<>(listResult, HttpStatus.OK);
    }
}
