package com.lx.team6springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.lx.team6springboot.exception.ResourceNotFoundException;
import com.lx.team6springboot.repository.UserDAO;
import com.lx.team6springboot.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    @Override
    public UserVO createUser(UserVO user) {
        userDAO.insertUser(user);
        return user;
    }

    @Override
    @Cacheable("users")
    public UserVO getUserById(String id) {
        UserVO user = userDAO.selectUserById(id);
        if (user == null) {
            throw new ResourceNotFoundException("User not found with id: " + id);
        }
        return user;
    }

    @Override
    @CachePut(value = "users", key = "#id")
    public UserVO updateUser(String id, UserVO user) {
        UserVO existingUser = userDAO.selectUserById(id);
        if (existingUser == null) {
            throw new ResourceNotFoundException("User not found with id: " + id);
        }
        user.setId(Long.parseLong(id));
        userDAO.updateUser(user);
        return user;
    }

    @Override
    @CacheEvict(value = "users", key = "#id")
    public void deleteUser(String id) {
        UserVO existingUser = userDAO.selectUserById(id);
        if (existingUser == null) {
            throw new ResourceNotFoundException("User not found with id: " + id);
        }
        userDAO.deleteUser(id);
    }
}
