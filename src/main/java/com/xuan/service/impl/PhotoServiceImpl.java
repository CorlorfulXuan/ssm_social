package com.xuan.service.impl;

import com.xuan.domain.Photo;
import com.xuan.mapper.PhotoMapper;
import com.xuan.service.PhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("photoService")
public class PhotoServiceImpl implements PhotoService {
    @Autowired
    private PhotoMapper photoMapper;

    @Override
    public void insert(Photo insert_photo) {
        photoMapper.insert(insert_photo);
    }

    @Override
    public List<Photo> findByLid(int l_id) {
        return photoMapper.findByLid(l_id);
    }

    @Override
    public List<Photo> findAll() {
        return photoMapper.findAll();
    }

    @Override
    public void delById(Integer id) {
        photoMapper.delById(id);
    }
}
