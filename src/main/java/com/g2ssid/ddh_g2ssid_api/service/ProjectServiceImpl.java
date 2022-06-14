package com.g2ssid.ddh_g2ssid_api.service;

import com.g2ssid.ddh_g2ssid_api.domain.model.department.Department;
import com.g2ssid.ddh_g2ssid_api.domain.model.project.Project;
import com.g2ssid.ddh_g2ssid_api.domain.model.project.ProjectStatusType;
import com.g2ssid.ddh_g2ssid_api.domain.repository.DepartmentRepository;
import com.g2ssid.ddh_g2ssid_api.domain.repository.EmployeeRepository;
import com.g2ssid.ddh_g2ssid_api.domain.repository.GenericRepository;
import com.g2ssid.ddh_g2ssid_api.domain.repository.ProjectRepository;
import com.g2ssid.ddh_g2ssid_api.resources.project.AssignDepartmentsResource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.util.*;

/**
 * @author Julio Quispe
 */
@Service
public class ProjectServiceImpl extends GenericServiceImpl<Project> implements ProjectService{

    @Autowired
    private ProjectRepository projectRepository;
    @Autowired
    private DepartmentRepository departmentRepository;
    @Autowired
    private DepartmentServicelmpl departmentServicelmpl;

    @Override
    protected GenericRepository<Project> getRepository() {
        return projectRepository;
    }

    private SimpleJdbcCall createProjectProc;
    private SimpleJdbcCall readProjectProc;
    private SimpleJdbcCall updateProjectProc;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.createProjectProc = new SimpleJdbcCall(dataSource).withProcedureName("SP_InsertProject").withReturnValue();
        this.readProjectProc = new SimpleJdbcCall(dataSource).withProcedureName("SP_get_project").withReturnValue();
        this.updateProjectProc = new SimpleJdbcCall(dataSource).withProcedureName("SP_UpdateProject").withReturnValue();
    }

    public Project save(Project project){
        int id = -1;
        SqlParameterSource inParams = buildParams(project);
        ((MapSqlParameterSource) inParams).addValue("cre_by", project.getCreatedBy());
        Map result = createProjectProc.execute(inParams);
        id = (int)result.get("id");
        project.setId(id);
        return project;
    }

    public Project getById(long id){
        SqlParameterSource inParams = new MapSqlParameterSource().addValue("id", id);
        Map result = readProjectProc.execute(inParams);
        ArrayList resultList = (ArrayList) result.get( "#result-set-1" );
        if (resultList.size() == 0) {
            return null;
        }
        Map resultlMap = (Map) resultList.get( 0 );
        Project em = new Project();
        em.setId((long)resultlMap.get("id"));
        em.setDescription((String) resultlMap.get("description"));
        em.setName((String) resultlMap.get("name"));
        em.setPlace((String) resultlMap.get("place"));
        em.setStatusProject(ProjectStatusType.fromString((String) resultlMap.get("statusProject")));

        return em;
    }

    public Project update(Project project){
        SqlParameterSource inParams = buildParams(project);
        ((MapSqlParameterSource) inParams)
                .addValue("proyID", project.getId())
                .addValue("upd_by", project.getUpdatedBy());
        Map result = updateProjectProc.execute(inParams);

        return project;
    }

    public MapSqlParameterSource buildParams(Project project) {
        return new MapSqlParameterSource()
                .addValue("des", project.getDescription())
                .addValue("nam", project.getName())
                .addValue("pla", project.getPlace())
                .addValue("est", project.getStatusProject().getKey());
    }

    public List<Department> assignDeparments(Long projectId, AssignDepartmentsResource assignDepartmentsResource) {
        List<Department> listDepartments = new ArrayList<>();
        Optional<Project> projectOp = projectRepository.findById(projectId);
        if (projectOp.isPresent()) {
            projectOp.get().setDepartments(new HashSet<>());
            for(Long departmentId : assignDepartmentsResource.getListDepartments()) {
                Optional<Department> departmentOp = departmentRepository.findById(departmentId);
                if(departmentOp.isPresent()) {
                    projectOp.get().getDepartments().add(departmentOp.get());
                    departmentOp.get().getProjects().add(projectOp.get());
                }
            }
            projectRepository.save(projectOp.get());
            listDepartments = departmentServicelmpl.getDepartmentsByProjectId(projectOp.get().getId());
        }
        return  listDepartments;
    }

}
