package com.xuan.service.impl;

import com.xuan.domain.Connection;
import com.xuan.mapper.ConnectionMapper;
import com.xuan.mapper.DairyMapper;
import com.xuan.mapper.EventMapper;
import com.xuan.mapper.PhotoMapper;
import com.xuan.service.ConnectionService;
import com.xuan.service.DairyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("connectionService")
public class ConnectionServiceImpl implements ConnectionService {

    @Autowired
    private ConnectionMapper connectionMapper;
    @Autowired
    private DairyMapper dairyMapper;
    @Autowired
    private PhotoMapper photoMapper;
    @Autowired
    private EventMapper eventMapper;

    @Override
    public Connection selectByUid1(Integer id) {
        Connection connection = connectionMapper.selectByUid1(id);
        return connection;
    }

    @Override
    public Connection selectByUid2(Integer id) {
        Connection connection = connectionMapper.selectByUid2(id);
        return connection;    }

    @Override
    public void addConnection(Connection connection) {
        connectionMapper.addConnection(connection);
    }

    @Override
    public void confirm(Integer id) {
        connectionMapper.confirm(id);
    }

    @Override
    public List<Connection> findAll() {
        List<Connection> connectionList = connectionMapper.findAll();
        for (Connection connection : connectionList) {
            connection.setDairy_num(dairyMapper.findByLid(connection.getId()).size());
            connection.setPhoto_num(photoMapper.findByLid(connection.getId()).size());
            connection.setEvent_num(eventMapper.findByLid(connection.getId()).size());
        }
        return connectionList;
    }

    @Override
    public void delById(Integer id) {
        connectionMapper.delById(id);
        dairyMapper.delByLid(id);
        photoMapper.delByLid(id);
        eventMapper.delByLid(id);
    }
}
