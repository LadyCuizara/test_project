package com.g2ssid.ddh_g2ssid_api.service;

import com.g2ssid.ddh_g2ssid_api.domain.model.accident.Accident;
import com.g2ssid.ddh_g2ssid_api.domain.repository.AccidentRepository;
import com.g2ssid.ddh_g2ssid_api.domain.repository.GenericRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.util.Map;


/**
 * @author Michel Terrazas Mercado
 */

@Service
public class AccidentServiceImpl extends GenericServiceImpl <Accident> implements AccidentService{

    @Autowired
    private AccidentRepository accidentRepository;

    private SimpleJdbcCall createAccidentProc;
    private SimpleJdbcCall readAccidentProc;
    private SimpleJdbcCall updateAccidentProc;
    private SimpleJdbcCall deleteAccidentProc;


    @Override
    protected GenericRepository<Accident> getRepository() {
        return accidentRepository;
    }

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.createAccidentProc = new SimpleJdbcCall(dataSource).withProcedureName("SP_InsertAccident").withReturnValue();
        this.readAccidentProc = new SimpleJdbcCall(dataSource).withProcedureName("SP_get_accident").withReturnValue();
        this.updateAccidentProc = new SimpleJdbcCall(dataSource).withProcedureName("SP_UpdateAccident").withReturnValue();
        this.deleteAccidentProc = new SimpleJdbcCall(dataSource).withProcedureName("SP_DeleteAccident").withReturnValue();
    }

    public Accident save(Accident accident){
        int id = -1;
        SqlParameterSource inParams = buildParams(accident);
        ((MapSqlParameterSource) inParams).addValue("created_by", accident.getCreatedBy());
        Map result = createAccidentProc.execute(inParams);
        id = (int)result.get("id");
        accident.setId(id);
        return accident;
    }

    public Accident update(Accident accident){
        SqlParameterSource inParams = buildParams(accident);
        ((MapSqlParameterSource) inParams)
                .addValue("id", accident.getId())
                .addValue("updated_by", accident.getUpdatedBy());
        Map result = updateAccidentProc.execute(inParams);
        return accident;
    }

    public void delete(long id){
        SqlParameterSource inParams = new MapSqlParameterSource().addValue("id", id);
        Map result = deleteAccidentProc.execute(inParams);
    }

    public MapSqlParameterSource buildParams(Accident accident) {
        return new MapSqlParameterSource()
                .addValue("accident_type", accident.getAccidentType())
                .addValue("assigned", accident.getAssigned())
                .addValue("body", accident.getBody())
                .addValue("cause", accident.getCause())
                .addValue("date_init", accident.getDateInit())
                .addValue("day_debited", accident.getDayDebited())
                .addValue("day_lost", accident.getDayLost())
                .addValue("end_lost_time", accident.getEndLostTime())
                .addValue("factor", accident.getFactor())
                .addValue("frecuency", accident.getFrecuency())
                .addValue("kind", accident.getKind())
                .addValue("medication", accident.getMedication())
                .addValue("receive", accident.getReceive())
                .addValue("severity", accident.getSeverity())
                .addValue("start_lost_time", accident.getStartLostTime())
                .addValue("turn", accident.getTurn())
                .addValue("way", accident.getWay())
                .addValue("employee_id", accident.getEmployee().getId());
    }
}



