package com.xuan.mapper;

import com.xuan.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {

    User findByEmailAndPassword(@Param("email") String email, @Param("password") String password);

    Integer save(User user);

    User findById(int id);

    List<User> findAll();

    void update(User user);

    void updateAvatar(@Param("id") Integer id, @Param("avatar") String avatar);

    User findByEmail(@Param("email") String email);

    void delById(@Param("id") Integer id);
}
