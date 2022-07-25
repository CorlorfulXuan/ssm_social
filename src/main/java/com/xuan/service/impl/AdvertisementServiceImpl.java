package com.xuan.service.impl;

import com.xuan.domain.Advertisement;
import com.xuan.mapper.AdvertisementMapper;
import com.xuan.service.AdvertisementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service("advertisementService")
public class AdvertisementServiceImpl implements AdvertisementService {
    @Autowired
    private AdvertisementMapper advertisementMapper;


    @Override
    public List<Advertisement> findAll() {
        List<Advertisement> advertisementList = advertisementMapper.findAll();
        return advertisementList;
    }

    @Override
    public Advertisement findById(Integer id) {
        return advertisementMapper.findById(id);
    }

    @Override
    public void update(Advertisement advertisement) {
        advertisementMapper.update(advertisement);
    }
}
