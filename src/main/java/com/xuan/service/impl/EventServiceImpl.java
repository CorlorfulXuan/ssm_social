package com.xuan.service.impl;

import com.xuan.domain.Event;
import com.xuan.mapper.EventMapper;
import com.xuan.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("eventService")
public class EventServiceImpl implements EventService {
    @Autowired
    private EventMapper eventMapper;

    @Override
    public void insert(Event event) {
        eventMapper.insert(event);
    }

    @Override
    public List<Event> findByLid(int l_id) {
        List<Event> eventList = eventMapper.findByLid(l_id);
        return eventList;
    }

    @Override
    public List<Event> findAll() {
        return eventMapper.findAll();
    }

    @Override
    public void delById(Integer id) {
        eventMapper.delById(id);
    }
}
