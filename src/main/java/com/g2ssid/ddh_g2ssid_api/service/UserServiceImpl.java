package com.g2ssid.ddh_g2ssid_api.service;

import com.g2ssid.ddh_g2ssid_api.domain.model.user.User;
import com.g2ssid.ddh_g2ssid_api.domain.repository.GenericRepository;
import com.g2ssid.ddh_g2ssid_api.domain.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl extends GenericServiceImpl<User> implements UserService{

    @Autowired
    private UserRepository userRepository;
    @Override
    protected GenericRepository<User> getRepository() {
        return userRepository;
    }

}
