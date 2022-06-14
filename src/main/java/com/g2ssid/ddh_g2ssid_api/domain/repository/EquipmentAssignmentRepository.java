package com.g2ssid.ddh_g2ssid_api.domain.repository;
import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.EquipmentAssignment;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface EquipmentAssignmentRepository extends GenericRepository<EquipmentAssignment> {
    @Query("SELECT a FROM EquipmentAssignment a left join a.equipment e where e.id = :equipmentId and a.active=true ")
    public List<EquipmentAssignment> assingmentByEquipment(@Param("equipmentId") Long equimentId);
}
