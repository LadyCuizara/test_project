package com.g2ssid.ddh_g2ssid_api.service;

import com.g2ssid.ddh_g2ssid_api.domain.model.employee.Employee;
import com.g2ssid.ddh_g2ssid_api.domain.model.position.Contract;
import com.g2ssid.ddh_g2ssid_api.domain.model.position.EmployeeType;
import com.g2ssid.ddh_g2ssid_api.domain.model.position.Position;
import com.g2ssid.ddh_g2ssid_api.domain.model.project.Project;
import com.g2ssid.ddh_g2ssid_api.domain.repository.ContractRepository;
import com.g2ssid.ddh_g2ssid_api.domain.repository.GenericRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

/**
 * @author giovanny delgadillo
 */
@Service
public class ContractServiceImpl extends GenericServiceImpl<Contract> implements ContractService {

    @Autowired
    private ContractRepository contractRepository;

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private PositionServiceImpl positionService;

    @Autowired
    private ProjectServiceImpl projectService;


    private SimpleJdbcCall createContractProc;
    private SimpleJdbcCall readContractProc;
    private SimpleJdbcCall updateContractProc;
    private SimpleJdbcCall deleteContractProc;


    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.createContractProc = new SimpleJdbcCall(dataSource).withProcedureName("SP_InsertContract").withReturnValue();
        this.readContractProc = new SimpleJdbcCall(dataSource).withProcedureName("SP_GetContract").withReturnValue();
        this.updateContractProc = new SimpleJdbcCall(dataSource).withProcedureName("SP_UpdateContract").withReturnValue();
        this.deleteContractProc = new SimpleJdbcCall(dataSource).withProcedureName("SP_DeleteContract").withReturnValue();
    }

    public Contract save(Contract contract){
        int id = -1;
        SqlParameterSource inParams = buildParams(contract);
        ((MapSqlParameterSource) inParams).addValue("cre_by", contract.getCreatedBy());
        Map result = createContractProc.execute(inParams);
        id = (int)result.get("id");
        contract.setId(id);
        return contract;
    }

    public void delete(long id){
        SqlParameterSource inParams = new MapSqlParameterSource().addValue("id", id);
        Map result = deleteContractProc.execute(inParams);
    }

    public Contract getById(long id){
        SqlParameterSource inParams = new MapSqlParameterSource().addValue("id", id);
        Map result = readContractProc.execute(inParams);
        ArrayList resultList = (ArrayList) result.get( "#result-set-1" );
        if (resultList.size() == 0) {
            return null;
        }
        Map resultlMap = (Map) resultList.get( 0 );
        Contract em = new Contract();
        em.setId((long)resultlMap.get("id"));
        em.setEmployeeType(EmployeeType.fromString((String) resultlMap.get("employee_type")));
        em.setInitDate((Date) resultlMap.get("init_date"));
        em.setEndDate((Date) resultlMap.get("end_date"));
        em.setSalary((BigDecimal) resultlMap.get("salary"));
        Employee employee = employeeService.findById((long)resultlMap.get("employee_id"));
        em.setEmployee(employee);
        Position position = positionService.getById((long) resultlMap.get("position_id"));
        em.setPosition(position);
        Project project = projectService.getById((long) resultlMap.get("project_id"));
        em.setProject(project);

        return em;
    }

    public Contract update(Contract contract){
        SqlParameterSource inParams = buildParams(contract);
        ((MapSqlParameterSource) inParams)
                .addValue("conID", contract.getId())
                .addValue("updBy", contract.getUpdatedBy());
        Map result = updateContractProc.execute(inParams);

        return contract;
    }

    public MapSqlParameterSource buildParams(Contract contract) {
        return new MapSqlParameterSource()
                .addValue("empType", contract.getEmployeeType().getKey())
                .addValue("iniDate", contract.getInitDate())
                .addValue("endDate", contract.getEndDate())
                .addValue("sala", contract.getSalary())
                .addValue("empID", contract.getEmployee().getId())
                .addValue("posID", contract.getPosition().getId())
                .addValue("projID", contract.getProject().getId());
    }

    @Override
    protected GenericRepository<Contract> getRepository() {
        return contractRepository;
    }
}
