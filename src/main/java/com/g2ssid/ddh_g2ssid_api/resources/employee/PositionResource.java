package com.g2ssid.ddh_g2ssid_api.resources.employee;

import com.g2ssid.ddh_g2ssid_api.controller.ContractController;
import com.g2ssid.ddh_g2ssid_api.controller.EmployeeController;
import com.g2ssid.ddh_g2ssid_api.controller.PositionController;
import com.g2ssid.ddh_g2ssid_api.domain.model.position.Position;
import com.g2ssid.ddh_g2ssid_api.resources.GenericResource;

import static org.springframework.hateoas.mvc.ControllerLinkBuilder.linkTo;
import static org.springframework.hateoas.mvc.ControllerLinkBuilder.methodOn;

/**
 * @author giovanny delgadillo
 */
public class PositionResource extends GenericResource<Position> {

    private String name;
    private String description;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public Position toEntity() {
        Position position = new Position();
        position.setName(getName());
        position.setDescription(getDescription());
        return position;
    }

    @Override
    public void updateFromEntity(Position entity) {
        setName(entity.getName());
        setDescription(entity.getDescription());
    }

    @Override
    public void addLinks() {
        add(linkTo(methodOn(PositionController.class).findById(getResourceId())).slash("contracts").withRel("contracts"));
    }
}
