package com.g2ssid.ddh_g2ssid_api.service;

import com.g2ssid.ddh_g2ssid_api.domain.model.employee.Employee;
import com.g2ssid.ddh_g2ssid_api.domain.model.employee.GenderType;
import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.Equipment;
import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.EquipmentAssignment;
import com.g2ssid.ddh_g2ssid_api.domain.repository.EmployeeRepository;

import com.g2ssid.ddh_g2ssid_api.domain.repository.GenericRepository;

import com.g2ssid.ddh_g2ssid_api.domain.repository.*;
import com.g2ssid.ddh_g2ssid_api.resources.employee.EmployeeResource;
import com.g2ssid.ddh_g2ssid_api.resources.equipment.EquipmentControlDailyListResource;
import com.g2ssid.ddh_g2ssid_api.resources.equipment.EquipmentControlDailyResource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.StoredProcedureQuery;
import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;


/**
 * @author giovanny delgadillo
 */
@Service
public class EmployeeServiceImpl extends GenericServiceImpl<Employee> implements EmployeeService{

    @Autowired
    private EmployeeRepository employeeRepository;

    @PersistenceContext
    private EntityManager em;

    private SimpleJdbcCall createEmployeeProc;
    private SimpleJdbcCall readEmployeeProc;
    private SimpleJdbcCall updateEmployeeProc;
    private SimpleJdbcCall deleteEmployeeProc;


    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.createEmployeeProc = new SimpleJdbcCall(dataSource).withProcedureName("SP_InsertEmployee").withReturnValue();
        this.readEmployeeProc = new SimpleJdbcCall(dataSource).withProcedureName("SP_get_employee").withReturnValue();
        this.updateEmployeeProc = new SimpleJdbcCall(dataSource).withProcedureName("SP_UpdateEmployee").withReturnValue();
        this.deleteEmployeeProc = new SimpleJdbcCall(dataSource).withProcedureName("SP_DeleteEmployee").withReturnValue();
    }

    public Employee save(Employee employee){
        int id = -1;
        SqlParameterSource inParams = buildParams(employee);
        ((MapSqlParameterSource) inParams).addValue("cre_by", employee.getCreatedBy());
        Map result = createEmployeeProc.execute(inParams);
        id = (int)result.get("id");
        employee.setId(id);
        return employee;
    }

    public void delete(long id){
        SqlParameterSource inParams = new MapSqlParameterSource().addValue("id", id);
        Map result = deleteEmployeeProc.execute(inParams);
    }

    public Employee getById(long id){
        SqlParameterSource inParams = new MapSqlParameterSource().addValue("id", id);
        Map result = readEmployeeProc.execute(inParams);
        ArrayList resultList = (ArrayList) result.get( "#result-set-1" );
        if (resultList.size() == 0) {
            return null;
        }
        Map resultlMap = (Map) resultList.get( 0 );
        Employee em = new Employee();
        em.setId((long)resultlMap.get("id"));
        em.setBirthDate((Date) resultlMap.get("birth_date"));
        em.setAddress((String) resultlMap.get("address"));
        em.setFirstName((String) resultlMap.get("first_name"));
        em.setLastName((String) resultlMap.get("last_name"));
        em.setEmail((String) resultlMap.get("email"));
        em.setCi((int) resultlMap.get("ci"));
        em.setPhoneNumber((int) resultlMap.get("phone_number"));
        em.setGender(GenderType.fromString((String) resultlMap.get("gender")));

        return em;
    }

    public Employee update(Employee employee){
        SqlParameterSource inParams = buildParams(employee);
        ((MapSqlParameterSource) inParams)
                .addValue("empID", employee.getId())
                .addValue("updBy", employee.getUpdatedBy());
        Map result = updateEmployeeProc.execute(inParams);

        return employee;
    }

    public MapSqlParameterSource buildParams(Employee employee) {
        return new MapSqlParameterSource()
                .addValue("fnam", employee.getFirstName())
                .addValue("lnam", employee.getLastName())
                .addValue("ci", employee.getCi())
                .addValue("birt", employee.getBirthDate())
                .addValue("emai", employee.getEmail())
                .addValue("addr", employee.getAddress())
                .addValue("gend", employee.getGender().getKey())
                .addValue("phon", employee.getPhoneNumber());
    }

    @Override
    public void savePicture(Long id, InputStream inputStream) {
        Employee employeePersisted = findById(id);
        try {
            Byte[] bytes = ImageUtils.inputStreamToByteArray(inputStream);
            employeePersisted.setPicture(bytes);
            getRepository().save(employeePersisted);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public List<Equipment> getEquipmentAssignmentEmployee(Long employee_id){
        List<Equipment> equipmentResult = new ArrayList<>();
        Optional<Employee> employee = employeeRepository.findById(employee_id);
        if(employee.isPresent()){
            Set<EquipmentAssignment> AssignmentByEmployee = employee.get().getEquipmentAssignments();
            for (EquipmentAssignment equipmentAssignment: AssignmentByEmployee){
                if(equipmentAssignment.getActive()== true){}
            }
        }
        return equipmentResult;
    }
    @Override
    protected GenericRepository<Employee> getRepository() {
        return employeeRepository;
    }

    public List<Employee> getAllEmployees(Specification<Employee> spec) {
        List<Employee> results = new ArrayList<>();
        employeeRepository.getAllEmployees(spec).forEach(results::add);
        return results;
    }
}
