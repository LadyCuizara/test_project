package com.g2ssid.ddh_g2ssid_api.domain.model.user;

public enum RoleType {
    STANDARD_USER("STANDARD_USER"),
    ADMIN_USER("ADMIN_USER");

    private String name;

    private RoleType(String name){
        this.name = name;
    }

    public String getName(){
        return name;
    }
}

