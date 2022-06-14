package com.g2ssid.ddh_g2ssid_api.service;

import com.g2ssid.ddh_g2ssid_api.domain.model.equipment.EquipmentCategory;
import com.g2ssid.ddh_g2ssid_api.domain.repository.EquipmentCategoryRepository;
import com.g2ssid.ddh_g2ssid_api.domain.repository.GenericRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class EquipmentCategoryServiceImpl extends GenericServiceImpl<EquipmentCategory> implements EquipmentCategoryService {

    @Autowired
    private EquipmentCategoryRepository equipmentCategoryRepository;

    @Override
    protected GenericRepository<EquipmentCategory> getRepository() {
        return equipmentCategoryRepository;
    }

}
