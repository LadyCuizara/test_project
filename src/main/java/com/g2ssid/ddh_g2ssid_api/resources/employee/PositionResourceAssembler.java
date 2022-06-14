package com.g2ssid.ddh_g2ssid_api.resources.employee;

import com.g2ssid.ddh_g2ssid_api.controller.PositionController;
import com.g2ssid.ddh_g2ssid_api.domain.model.position.Position;
import com.g2ssid.ddh_g2ssid_api.resources.GenericResourceAssembler;
import org.springframework.stereotype.Component;

/**
 * @author giovanny delgadillo
 */
@Component
public class PositionResourceAssembler extends GenericResourceAssembler<Position, PositionResource> {

    public PositionResourceAssembler() {
        super(PositionController.class, PositionResource.class);
    }
}
