package com.xuan.service;

import com.xuan.domain.Dairy;
import org.springframework.stereotype.Service;

import java.util.List;


public interface DairyService {
    void insert(Dairy dairy);

    List<Dairy> findByLid(int l_id);

    List<Dairy> findAll();

    void delById(Integer id);
}
