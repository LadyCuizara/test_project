package com.g2ssid.ddh_g2ssid_api.resources.user;
import com.g2ssid.ddh_g2ssid_api.controller.UserController;
import com.g2ssid.ddh_g2ssid_api.domain.model.user.User;
import com.g2ssid.ddh_g2ssid_api.resources.GenericResourceAssembler;
import org.springframework.stereotype.Component;

@Component
public class UserResourceAssembler extends GenericResourceAssembler<User, UserResource>
{
    public UserResourceAssembler() {
        super(UserController.class, UserResource.class);
    }
}
