package com.g2ssid.ddh_g2ssid_api.domain.repository;
import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.Equipment;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;


/**
 * @author Nicol Balderrama
 */
public interface EquipmentRepository extends GenericRepository<Equipment> {
    /**
     * @author: lady
     */
    @Query("SELECT e FROM Equipment e left join e.equipmentAssignments d left join d.employee em where em.id = :employeeId and d.active=true"  )
    public List<Equipment> equipmentsAssignmentByEmployee(@Param("employeeId") Long employeeId);

    @Query("SELECT e FROM Equipment e left join e.category c where c.id = :categoryId and e.available=true"  )
    public List<Equipment> equipmentsByCategory(@Param("categoryId") Long categoryId);
}
