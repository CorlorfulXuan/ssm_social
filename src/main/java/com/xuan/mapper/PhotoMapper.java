package com.xuan.mapper;

import com.xuan.domain.Photo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PhotoMapper {
    void insert(Photo insert_photo);

    List<Photo> findByLid(@Param("l_id") int l_id);

    void delByLid(@Param("l_id") Integer l_id);

    List<Photo> findAll();

    void delById(@Param("id") Integer id);
}
