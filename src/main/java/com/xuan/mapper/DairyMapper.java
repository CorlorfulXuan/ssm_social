package com.xuan.mapper;

import com.xuan.domain.Dairy;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DairyMapper {
    void insert(Dairy dairy);

    List<Dairy> findByLid(@Param("l_id") int l_id);

    void delByLid(@Param("l_id") Integer l_id);

    List<Dairy> findAll();

    void delById(@Param("id") Integer id);
}
