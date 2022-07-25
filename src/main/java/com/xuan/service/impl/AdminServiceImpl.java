package com.xuan.service.impl;

import com.xuan.domain.Admin;
import com.xuan.mapper.AdminMapper;
import com.xuan.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;


    @Override
    public Admin findByEmailAndPassword(String username, String password) {
        return adminMapper.findByEmailAndPassword(username, password);
    }
}
