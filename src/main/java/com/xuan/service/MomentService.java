package com.xuan.service;

import com.xuan.domain.Moment;

import java.util.Date;
import java.util.List;

public interface MomentService {

    List<Moment> findAll(Integer page);

    List<Moment> findByUid(Integer page, Integer uid);

    List<Moment> findByUid(Integer uid);

    Integer findUpdates(int uid);

    Integer findLikes(int uid);

    void addMoment(Moment moment);

    void delMoment(Integer mid);

    List<Moment> findAll();
}
