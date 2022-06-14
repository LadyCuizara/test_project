package com.g2ssid.ddh_g2ssid_api.resources.equipment;

import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.EquipmentControlDaily;
import com.g2ssid.ddh_g2ssid_api.resources.GenericResourceAssembler;
import org.springframework.stereotype.Component;

/**
 * @author  Julio Quispe
 */
@Component
public class EquipmentControlDailyResourceAssembler extends GenericResourceAssembler<EquipmentControlDaily, EquipmentControlDailyResource>{
    public EquipmentControlDailyResourceAssembler(){
        super(EquipmentControlDaily.class, EquipmentControlDailyResource.class);
    }
}
