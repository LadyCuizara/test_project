package com.g2ssid.ddh_g2ssid_api.service;

import com.g2ssid.ddh_g2ssid_api.domain.model.department.Department;
import com.g2ssid.ddh_g2ssid_api.domain.model.position.Position;
import com.g2ssid.ddh_g2ssid_api.domain.repository.DepartmentRepository;
import com.g2ssid.ddh_g2ssid_api.domain.repository.GenericRepository;
import com.g2ssid.ddh_g2ssid_api.domain.repository.PositionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.sql.DataSource;
import java.util.*;

@Service
public class PositionServiceImpl extends GenericServiceImpl<Position> implements PositionService {

    @Autowired
    private PositionRepository positionRepository;

    @PersistenceContext
    private EntityManager em;

    @Autowired
    private DepartmentRepository departmentRepository;

    private SimpleJdbcCall createPositionProc;
    private SimpleJdbcCall readPositionProc;
    private SimpleJdbcCall updatePositionProc;
    private SimpleJdbcCall deletePositionProc;

    @Override
    protected GenericRepository<Position> getRepository() {
        return positionRepository;
    }

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.createPositionProc = new SimpleJdbcCall(dataSource).withProcedureName("SP_InsertPosition").withReturnValue();
        this.readPositionProc = new SimpleJdbcCall(dataSource).withProcedureName("SP_get_position").withReturnValue();
        this.updatePositionProc = new SimpleJdbcCall(dataSource).withProcedureName("SP_UpdatePosition").withReturnValue();
        this.deletePositionProc = new SimpleJdbcCall(dataSource).withProcedureName("SP_DeletePosition").withReturnValue();
    }

    public Position save(Position position){
        int id = -1;
        SqlParameterSource inParams = buildParams(position);
        ((MapSqlParameterSource) inParams).addValue("cre_by", position.getCreatedBy());
        Map result = createPositionProc.execute(inParams);
        id = (int)result.get("id");
        position.setId(id);
        return position;
    }

    public void delete(long id){
        SqlParameterSource inParams = new MapSqlParameterSource().addValue("id", id);
        Map result = deletePositionProc.execute(inParams);
    }

    public Position getById(long id){
        SqlParameterSource inParams = new MapSqlParameterSource().addValue("id", id);
        Map result = readPositionProc.execute(inParams);
        ArrayList resultList = (ArrayList) result.get( "#result-set-1" );
        if (resultList.size() == 0) {
            return null;
        }
        Map resultlMap = (Map) resultList.get( 0 );
        Position em = new Position();
        em.setId((long)resultlMap.get("id"));
        em.setDescription((String) resultlMap.get("description"));
        em.setName((String) resultlMap.get("name"));

        return em;
    }

    public Position update(Position position){
        SqlParameterSource inParams = buildParams(position);
        ((MapSqlParameterSource) inParams)
                .addValue("posID", position.getId())
                .addValue("updBy", position.getUpdatedBy());
        Map result = updatePositionProc.execute(inParams);

        return position;
    }

    public MapSqlParameterSource buildParams(Position position) {
        return new MapSqlParameterSource()
                .addValue("desc", position.getDescription())
                .addValue("nam", position.getName());
    }

    public List<Position> getPositionsByDepartmentId(Long positionId) {
        Optional<Department> department = departmentRepository.findById(positionId);
        List<Position> positionsList = new ArrayList<>();
        if(department.isPresent()) {
            Set<Position> positionSet = department.get().getPositions();
            positionSet.forEach(positionsList::add);
        }
        return positionsList;
    }
}
