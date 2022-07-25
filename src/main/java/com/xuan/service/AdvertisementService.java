package com.xuan.service;

import com.xuan.domain.Advertisement;

import java.util.List;

public interface AdvertisementService {

    public List<Advertisement> findAll();

    Advertisement findById(Integer id);

    void update(Advertisement advertisement);
}
