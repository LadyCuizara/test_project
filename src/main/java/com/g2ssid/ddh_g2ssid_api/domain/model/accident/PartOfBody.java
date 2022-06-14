package com.g2ssid.ddh_g2ssid_api.domain.model.accident;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.g2ssid.ddh_g2ssid_api.serialization.EnumSerializable;
import com.g2ssid.ddh_g2ssid_api.serialization.PartOfBodySerializer;

import java.util.prefs.BackingStoreException;

/**
 * @author Michel Terrazas Mercado
 */

@JsonSerialize(using = PartOfBodySerializer.class)
public enum PartOfBody implements EnumSerializable    {

    // las mayusculas representan al name, y lo que esta en comillas es el value
     CRANIUM ("region craneana, cuero cabelludo"),
     EYES ("ojos"),
     MOUTH ("boca"),
     FACE ("cara"),
     NOSE ("nariz , senos paranasales"),
     EAR ("aparato auditivo"),
     NECK ("cuello"),
     CERVICAL ("cervical"),
     SPINE ("columna vertebral, muscular adyacente"),
     BACK ("region dorsal"),
     CHEST ("torax, costillas, esternon");

    private String value;

    private PartOfBody (String value){

        this.value = value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @Override
    public String getKey() {
        return this.name();
    }

    @Override
    public String getValue() {
        return this.value;
    }
}
