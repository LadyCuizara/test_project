package com.g2ssid.ddh_g2ssid_api.resources.employee;

import com.g2ssid.ddh_g2ssid_api.controller.ContractController;
import com.g2ssid.ddh_g2ssid_api.domain.model.position.Contract;
import com.g2ssid.ddh_g2ssid_api.resources.GenericResourceAssembler;
import org.springframework.stereotype.Component;

/**
 * @author giovanny delgadillo
 */
@Component
public class ContractResourceAssembler extends GenericResourceAssembler<Contract, ContractResource> {

    public ContractResourceAssembler() {
        super(ContractController.class, ContractResource.class);
    }
}
