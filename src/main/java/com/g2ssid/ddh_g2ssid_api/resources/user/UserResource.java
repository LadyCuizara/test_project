package com.g2ssid.ddh_g2ssid_api.resources.user;

import com.g2ssid.ddh_g2ssid_api.domain.model.user.User;
import com.g2ssid.ddh_g2ssid_api.resources.GenericResource;


public class UserResource extends GenericResource<User> {

    private String firstName;
    private String lastName;
    private String email;
    private String userName;
    private String password;


    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    @Override
    public User toEntity() {
        User user = new User();
        user.setFirstName(getFirstName());
        user.setLastName(getLastName());
        user.setEmail(getEmail());
        user.setUsername(getUserName());
        user.setPassword(getPassword());
        return user;
    }

    @Override
    public void updateFromEntity(User entity) {
        setFirstName(entity.getFirstName());
        setLastName(entity.getLastName());
        setEmail(entity.getEmail());
        setUserName(entity.getUsername());
        setPassword(entity.getPassword());

    }

    @Override
    public void addLinks() {

    }
}
