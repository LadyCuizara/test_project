package com.g2ssid.ddh_g2ssid_api.domain.model.user;


import com.g2ssid.ddh_g2ssid_api.domain.model.base.BaseEntityAudit;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "users")
public class User extends BaseEntityAudit{

    @Column(name = "username")
    private String username;

    @Column(nullable = false)
    private String password;

    @Column(nullable = false)
    private String firstName;

    @Column(nullable = false)
    private String lastName;

    @Column(nullable = false)
    private String email;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "user_role",
            joinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "role_id", referencedColumnName = "id"))
    private List<Role> roles;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) { this.password = password; }

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

    public void setEmail(String email) { this.email = email; }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    public void merge(User newUser) {
        if(newUser.getUsername() != null) {
            this.setUsername(newUser.getUsername());
        }
        if (newUser.getPassword() != null) {
            this.setPassword(newUser.getPassword());
        }
        if (newUser.getFirstName() != null) {
            this.setFirstName(newUser.getFirstName());
        }

        if (newUser.getLastName() != null) {
            this.setLastName(newUser.getLastName());
        }

        if (newUser.getEmail() != null) {
            this.setEmail(newUser.getEmail());
        }
    }

}
