package com.g2ssid.ddh_g2ssid_api.serialization;

import com.g2ssid.ddh_g2ssid_api.domain.model.project.ProjectStatusType;

/**
 * @author Julio Quispe
 */
public class ProjectStatusTypeSerializer extends EnumSerializer<ProjectStatusType> {
    protected ProjectStatusTypeSerializer() {
        super(ProjectStatusType.class);
    }
}
