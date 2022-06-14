package com.g2ssid.ddh_g2ssid_api.service;

import com.g2ssid.ddh_g2ssid_api.domain.model.department.Department;
import com.g2ssid.ddh_g2ssid_api.domain.model.position.Position;
import com.g2ssid.ddh_g2ssid_api.domain.model.project.Project;
import com.g2ssid.ddh_g2ssid_api.domain.repository.DepartmentRepository;
import com.g2ssid.ddh_g2ssid_api.domain.repository.PositionRepository;
import com.g2ssid.ddh_g2ssid_api.domain.repository.GenericRepository;
import com.g2ssid.ddh_g2ssid_api.domain.repository.ProjectRepository;
import com.g2ssid.ddh_g2ssid_api.resources.project.AssignPositionResource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.util.*;

@Service
public class DepartmentServicelmpl extends GenericServiceImpl<Department> implements DepartmentService {
    @Autowired
    private DepartmentRepository departmentRepository;
    @Autowired
    private ProjectRepository projectRepository;
    @Autowired
    private PositionRepository positionRepository;
    @Autowired
    private PositionServiceImpl positionServiceImpl;


    private SimpleJdbcCall createDepartmentProc;
    private SimpleJdbcCall readDepartmentProc;
    private SimpleJdbcCall updateDepartmentProc;
    private SimpleJdbcCall deleteDepartmentProc;


    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.createDepartmentProc = new SimpleJdbcCall(dataSource).withProcedureName("SP_InsertDepartment").withReturnValue();
        this.readDepartmentProc = new SimpleJdbcCall(dataSource).withProcedureName("SP_get_department").withReturnValue();
        this.updateDepartmentProc = new SimpleJdbcCall(dataSource).withProcedureName("SP_UpdateDepartment").withReturnValue();
        this.deleteDepartmentProc = new SimpleJdbcCall(dataSource).withProcedureName("SP_DeleteDepartment").withReturnValue();
    }

    public Department save(Department project){
        int id = -1;
        SqlParameterSource inParams = buildParams(project);
        ((MapSqlParameterSource) inParams).addValue("cre_by", project.getCreatedBy());
        Map result = createDepartmentProc.execute(inParams);
        id = (int)result.get("id");
        project.setId(id);
        return project;
    }

    public void delete(long id){
        SqlParameterSource inParams = new MapSqlParameterSource().addValue("id", id);
        Map result = deleteDepartmentProc.execute(inParams);
    }

    public Department getById(long id){
        SqlParameterSource inParams = new MapSqlParameterSource().addValue("id", id);
        Map result = readDepartmentProc.execute(inParams);
        ArrayList resultList = (ArrayList) result.get( "#result-set-1" );
        if (resultList.size() == 0) {
            return null;
        }
        Map resultlMap = (Map) resultList.get( 0 );
        Department em = new Department();
        em.setId((long)resultlMap.get("id"));
        em.setDescription((String) resultlMap.get("description"));
        em.setName((String) resultlMap.get("name"));

        return em;
    }

    public Department update(Department project){
        SqlParameterSource inParams = buildParams(project);
        ((MapSqlParameterSource) inParams)
                .addValue("depID", project.getId())
                .addValue("updBy", project.getUpdatedBy());
        Map result = updateDepartmentProc.execute(inParams);

        return project;
    }

    public MapSqlParameterSource buildParams(Department project) {
        return new MapSqlParameterSource()
                .addValue("desc", project.getDescription())
                .addValue("nam", project.getName());
    }

    @Override
    protected GenericRepository<Department> getRepository() {
        return departmentRepository;
    }

    public List<Department> getDepartmentsByProjectId(Long projectId) {
        Optional<Project> project = projectRepository.findById(projectId);
        List<Department> departmentsList = new ArrayList<>();
        if(project.isPresent()) {
            Set<Department> departmentSet = project.get().getDepartments();
            departmentSet.forEach(departmentsList::add);
        }
        return departmentsList;
    }

    public List<Position> assignDeparments(Long departmentId, AssignPositionResource assignPositionResource) {
        List<Position> listPositions = new ArrayList<>();
        Optional<Department> departmentOp = departmentRepository.findById(departmentId);
        if (departmentOp.isPresent()) {
            departmentOp.get().setPositions(new HashSet<>());
            for(Long positionId : assignPositionResource.getListPositions()) {
                Optional<Position> positionOp = positionRepository.findById(positionId);
                if(positionOp.isPresent()) {
                    departmentOp.get().getPositions().add(positionOp.get());
                    positionOp.get().getDepartments().add(departmentOp.get());
                }
            }
            departmentRepository.save(departmentOp.get());
            listPositions = positionServiceImpl.getPositionsByDepartmentId(departmentOp.get().getId());
        }
        return  listPositions;
    }

    @Override
    public List<Department> getDepartmentsByProject(Long projectId) {
        return departmentRepository.getDepartmentsByProject(projectId);
    }
}
