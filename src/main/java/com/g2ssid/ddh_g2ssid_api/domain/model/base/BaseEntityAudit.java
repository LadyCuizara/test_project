package com.g2ssid.ddh_g2ssid_api.domain.model.base;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.Date;

/**
 * Base Entity For Audit
 *
 * @author giovanny delgadillo
 */
@MappedSuperclass
public abstract class BaseEntityAudit extends BaseEntity {

    @Column(name = "created_at", updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;

    @Size(max = 20)
    @Column(name = "created_by", length = 20)
    private String createdBy;

    @Column(name = "updated_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedAt;

    @Size(max = 20)
    @Column(name = "updated_by", length = 20)
    private String updatedBy;

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }

    /**
     * Sets createdAt before insert.
     */
    @PrePersist
    public void setCreationDate() {
        this.createdAt = new Date();
    }

    /**
     * Sets updateAt before update.
     */
    @PreUpdate
    public void setChangeDate() {
        this.updatedAt = new Date();
    }
}
