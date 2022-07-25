package com.xuan.mapper;

import com.xuan.domain.Moment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MomentMapper {

    List<Moment> findAll();

    List<Moment> findByUid(int uid);

    void addMoment(Moment moment);

    void delMoment(@Param("mid") Integer mid);
}
