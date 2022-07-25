package com.xuan.service;

import com.xuan.domain.Event;

import java.util.List;

public interface EventService {
    void insert(Event event);

    List<Event> findByLid(int l_id);

    List<Event> findAll();

    void delById(Integer id);
}
