package com.xuan.service.impl;

import com.xuan.domain.Dairy;
import com.xuan.mapper.DairyMapper;
import com.xuan.service.DairyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("dairyService")
public class DairyServiceImpl implements DairyService {
    @Autowired
    private DairyMapper dairyMapper;

    @Override
    public void insert(Dairy dairy) {
        dairyMapper.insert(dairy);
    }

    @Override
    public List<Dairy> findByLid(int l_id) {
        List<Dairy> dairyList = dairyMapper.findByLid(l_id);
        return dairyList;
    }

    @Override
    public List<Dairy> findAll() {
        return dairyMapper.findAll();
    }

    @Override
    public void delById(Integer id) {
        dairyMapper.delById(id);
    }
}
