package com.lx.team6springboot.repository;

import org.apache.ibatis.annotations.Mapper;
import com.lx.team6springboot.vo.UserVO;

@Mapper
public interface UserDAO {
    void insertUser(UserVO user);
    UserVO selectUserById(String id);
    void updateUser(UserVO user);
    void deleteUser(String id);
}
