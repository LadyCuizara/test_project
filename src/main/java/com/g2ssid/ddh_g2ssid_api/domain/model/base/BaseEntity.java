package com.g2ssid.ddh_g2ssid_api.domain.model.base;


import javax.persistence.*;
import java.io.Serializable;

/**
 * Base Entity class to be used for all entities in the sistem, includes Id as an Auto Generated Key
 *
 * @author giovanny delgadillo
 */
@MappedSuperclass
public abstract class BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    protected Long id;

    public Long getId() {
        return id;
    }
    public void setId(long id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (getId() != null ? getId().hashCode() : 0);

        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (this == object) {
            return true;
        }
        if (object == null) {
            return false;
        }
        if (getClass() != object.getClass()) {
            return false;
        }

        BaseEntity otherEntity = (BaseEntity) object;
        if (this.getId() != otherEntity.getId() && (this.getId() == null || !this.id.equals(otherEntity.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return this.getClass().getName() + " [ID=" + id + "]";
    }
}
