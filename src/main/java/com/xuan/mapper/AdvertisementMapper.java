package com.xuan.mapper;

import com.xuan.domain.Advertisement;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdvertisementMapper {

    public List<Advertisement> findAll();

    Advertisement findById(@Param("id") Integer id);

    void update(Advertisement advertisement);
}
