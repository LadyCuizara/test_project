package com.g2ssid.ddh_g2ssid_api.domain.model.user;
import com.g2ssid.ddh_g2ssid_api.domain.model.base.BaseEntityAudit;

import javax.persistence.*;

@Entity
@Table(name = "role")
public class Role extends BaseEntityAudit {

    @Enumerated(EnumType.STRING)
    @Column(name = "role_name")
    private RoleType roleName;

    @Column(name = "description")
    private String description;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public RoleType getRoleName() {
        return roleName;
    }

    public void setRoleName(RoleType roleName) {
        this.roleName = roleName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
