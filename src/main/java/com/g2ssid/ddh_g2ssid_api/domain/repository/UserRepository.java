package com.g2ssid.ddh_g2ssid_api.domain.repository;

import com.g2ssid.ddh_g2ssid_api.domain.model.user.User;

public interface UserRepository extends GenericRepository<User> {
    User findByUsername(String name);
}
