package com.xuan.service;

import com.xuan.domain.Admin;

public interface AdminService {

    Admin findByEmailAndPassword(String username, String password);
}
