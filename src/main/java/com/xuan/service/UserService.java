package com.xuan.service;

import com.xuan.domain.User;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface UserService {

    User login(String email,String password);

    Integer save(User user);

    User findById(int id);

    List<User> findAll();

    void update(User user);

    void updateAvatar(Integer id, String avatar);

    User findByEmail(String email);

    void delById(Integer id);
}
