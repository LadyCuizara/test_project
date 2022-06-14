package com.g2ssid.ddh_g2ssid_api.resources.accident;


import com.g2ssid.ddh_g2ssid_api.controller.AccidentController;
import com.g2ssid.ddh_g2ssid_api.domain.model.accident.Accident;
import com.g2ssid.ddh_g2ssid_api.resources.GenericResourceAssembler;
import org.springframework.stereotype.Component;


/**
 * @author Michel Terrazas Mercado
 */

@Component
public class AccidentResourceAssembler extends GenericResourceAssembler<Accident,AccidentResource> {
    public AccidentResourceAssembler(){super(AccidentController.class, AccidentResource.class);}
}
