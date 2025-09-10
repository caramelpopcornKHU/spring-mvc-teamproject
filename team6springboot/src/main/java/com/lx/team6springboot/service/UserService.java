package com.lx.team6springboot.service;

import com.lx.team6springboot.vo.UserVO;

public interface UserService {
    UserVO createUser(UserVO user);
    UserVO getUserById(String id);
    UserVO updateUser(String id, UserVO user);
    void deleteUser(String id);
}
