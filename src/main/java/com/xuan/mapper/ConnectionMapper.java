package com.xuan.mapper;

import com.xuan.domain.Connection;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ConnectionMapper {

    Connection selectByUid1(@Param("uid1") Integer id);

    Connection selectByUid2(@Param("uid2") Integer id);

    void addConnection(Connection connection);

    void confirm(@Param("uid2") Integer id);

    List<Connection> findAll();

    void delById(@Param("id") Integer id);
}
