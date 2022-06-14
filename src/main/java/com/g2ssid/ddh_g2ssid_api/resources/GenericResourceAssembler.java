package com.g2ssid.ddh_g2ssid_api.resources;

import com.g2ssid.ddh_g2ssid_api.domain.model.base.BaseEntity;
import org.springframework.hateoas.mvc.ResourceAssemblerSupport;

/**
 * @author giovanny delgadillo
 */
public abstract class GenericResourceAssembler<T extends BaseEntity, D extends GenericResource> extends ResourceAssemblerSupport<T, D> {

    public GenericResourceAssembler(Class<?> controllerClass, Class<D> resourceType) {
        super(controllerClass, resourceType);
    }

    @Override
    public final D toResource(T entity) {
        D resource = createResourceWithId(entity.getId(), entity);
        resource.updateFromEntity(entity);
        resource.addLinks();
        return resource;
    }

    @Override
    protected final D createResourceWithId(Object id, T entity) {
        D resource = super.createResourceWithId(id, entity);
        resource.setResourceId(entity.getId());
        return resource;
    }
}
