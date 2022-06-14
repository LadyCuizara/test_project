package com.g2ssid.ddh_g2ssid_api.domain.repository;

import com.g2ssid.ddh_g2ssid_api.domain.model.department.Department;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * @author Judith Delgadillo
 */

public interface DepartmentRepository extends GenericRepository<Department> {

    @Query("SELECT d FROM Department d left join d.projects p where p.id = :projectId")
     public List<Department> getDepartmentsByProject(@Param("projectId")Long projectId);
}
