package com.xuan.mapper;

import com.xuan.domain.Event;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EventMapper {
    void insert(Event event);

    List<Event> findByLid(@Param("l_id") int l_id);

    void delByLid(@Param("l_id") Integer l_id);

    List<Event> findAll();

    void delById(@Param("id") Integer id);
}
