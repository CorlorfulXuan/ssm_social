package com.xuan.service;

import com.xuan.domain.Photo;

import java.util.List;

public interface PhotoService {
    void insert(Photo insert_photo);

    List<Photo> findByLid(int l_id);

    List<Photo> findAll();

    void delById(Integer id);
}
