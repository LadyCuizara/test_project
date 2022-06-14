package com.g2ssid.ddh_g2ssid_api.resources;

import com.fasterxml.jackson.annotation.JsonProperty;
import org.springframework.hateoas.ResourceSupport;

/**
 * @author giovanny delgadillo
 */
public abstract class GenericResource<T> extends ResourceSupport {

    private Long id;

    @JsonProperty("id")
    public Long getResourceId() {
        return id;
    }

    public void setResourceId(Long id) {
        this.id = id;
    }

    /**
     * Allows to convert the Resource to the respective entity.
     * @return Entity
     */
    public abstract T toEntity();

    /**
     * Updates all the variables from the entity to the resource.
     * @param entity
     */
    public abstract void updateFromEntity(T entity);

    /**
     * Allows to add _Links to the resource response.
     */
    public abstract void addLinks();
}
