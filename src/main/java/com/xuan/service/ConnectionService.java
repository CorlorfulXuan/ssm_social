package com.xuan.service;

import com.xuan.domain.Connection;

import java.util.List;

public interface ConnectionService {
    Connection selectByUid1(Integer id);

    Connection selectByUid2(Integer id);

    void addConnection(Connection connection);

    void confirm(Integer id);

    List<Connection> findAll();

    void delById(Integer id);
}
