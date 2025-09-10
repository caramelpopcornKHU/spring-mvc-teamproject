package com.lx.team6springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.lx.team6springboot.service.UserService;
import com.lx.team6springboot.vo.UserVO;

import java.util.Map;

@RestController
@RequestMapping("/api")
public class RestAPIMysqlController {

    @Autowired
    private UserService userService;

    @GetMapping("/hello")
    public String sayHello() {
        return "Hello, World!";
    }

    @PostMapping("/users")
    public UserVO createUser(@RequestBody UserVO user) {
        return userService.createUser(user);
    }

    @GetMapping("/users/{id}")
    public UserVO getUser(@PathVariable String id) {
        return userService.getUserById(id);
    }

    @PutMapping("/users/{id}")
    public UserVO updateUser(@PathVariable String id, @RequestBody UserVO user) {
        return userService.updateUser(id, user);
    }

    @DeleteMapping("/users/{id}")
    public ResponseEntity<Map<String, Boolean>> deleteUser(@PathVariable String id) {
        userService.deleteUser(id);
        Map<String, Boolean> response = Map.of("deleted", true);
        return ResponseEntity.ok(response);
    }
}