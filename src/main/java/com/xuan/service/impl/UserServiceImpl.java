package com.xuan.service.impl;

import com.xuan.domain.User;
import com.xuan.mapper.UserMapper;
import com.xuan.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User login(String email, String password) {

        User user = userMapper.findByEmailAndPassword(email,password);

        return user;
    }

    @Override
    public Integer save(User user) {
        Integer id = userMapper.save(user);
        return id;
    }

    @Override
    public User findById(int id) {
        User user = userMapper.findById(id);
        return user;
    }

    @Override
    public List<User> findAll() {
        List<User> userList = userMapper.findAll();
        return userList;
    }

    @Override
    public void update(User user) {
        userMapper.update(user);
    }

    @Override
    public void updateAvatar(Integer id, String avatar) {
        userMapper.updateAvatar(id, avatar);
    }

    @Override
    public User findByEmail(String email) {
        User user = userMapper.findByEmail(email);
        return user;
    }

    @Override
    public void delById(Integer id) {
        userMapper.delById(id);
    }


}
