package com.g2ssid.ddh_g2ssid_api.controller;

import com.g2ssid.ddh_g2ssid_api.domain.model.user.User;
import com.g2ssid.ddh_g2ssid_api.exceptions.NotFoundException;
import com.g2ssid.ddh_g2ssid_api.resources.user.UserResource;
import com.g2ssid.ddh_g2ssid_api.resources.user.UserResourceAssembler;
import com.g2ssid.ddh_g2ssid_api.service.UserService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.config.EnableHypermediaSupport;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

import static org.springframework.web.bind.annotation.RequestMethod.PUT;

@Api(value = "User", description = "User Rest API")
@RestController
@EnableHypermediaSupport(type = EnableHypermediaSupport.HypermediaType.HAL)
@RequestMapping("/users")


public class UserController {

    @Autowired
    private UserService service;

    @Autowired
    private UserResourceAssembler assembler;

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<List<UserResource>> findAllUsers() {
        List<UserResource> userResourceList = new ArrayList<>();
        for (User user : service.findAll()) {
            userResourceList.add(assembler.toResource(user));
        }
        return new ResponseEntity(userResourceList, HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.GET,
            value = "/{id}"
    )
    public ResponseEntity<UserResource> findById(@PathVariable Long id) {
        User user = service.findById(id);
        if (user == null ) {
            throw new NotFoundException(User.class.getTypeName() + " id:" + id + " Not Found");
        }
        return new ResponseEntity(assembler.toResource(user), HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.POST
    )
    public ResponseEntity<UserResource> addUser(@RequestBody UserResource userResource) {
        User savedUser = service.save(userResource.toEntity());

        return new ResponseEntity(assembler.toResource(savedUser), HttpStatus.OK);
    }


    @RequestMapping(
            method = RequestMethod.PUT,
            value = "/{id}"
    )
    public ResponseEntity<UserResource> updateUser(@PathVariable Long id, @RequestBody UserResource userResource) {
        User currentUser = service.findById(id);
        if (currentUser == null) {
            throw new NotFoundException(User.class.getTypeName() + " id:" + id + " Not Found");
        }

        currentUser.merge(userResource.toEntity());
        User updateUser = service.save(currentUser);
        return new ResponseEntity(assembler.toResource(updateUser), HttpStatus.OK);
    }

    @RequestMapping(
            method = RequestMethod.DELETE,
            value = "/{id}"
    )
    public void deleteUser(@PathVariable Long id) {
        service.deleteById(id);
    }

}
