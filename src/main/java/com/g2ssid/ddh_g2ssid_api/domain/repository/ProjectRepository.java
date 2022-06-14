package com.g2ssid.ddh_g2ssid_api.domain.repository;

import com.g2ssid.ddh_g2ssid_api.domain.model.position.Position;
import com.g2ssid.ddh_g2ssid_api.domain.model.project.Project;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

/**
 * @author Julio Quispe
 */
public interface ProjectRepository extends GenericRepository<Project> {
}
