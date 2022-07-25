package com.xuan.mapper;

import com.xuan.domain.Admin;
import org.apache.ibatis.annotations.Param;

public interface AdminMapper {

    Admin findByEmailAndPassword(@Param("username") String username, @Param("password") String password);
}
