package com.g2ssid.ddh_g2ssid_api.resources.project;

import java.util.List;

/**
 * @author Julio Quispe
 */
public class AssignPositionResource {
    List<Long> listPositions;

    public List<Long> getListPositions() {
        return listPositions;
    }

    public void setListPositions(List<Long> listPositions) {
        this.listPositions = listPositions;
    }
}
