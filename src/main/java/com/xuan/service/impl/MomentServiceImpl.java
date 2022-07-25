package com.xuan.service.impl;

import com.github.pagehelper.PageHelper;
import com.xuan.domain.Moment;
import com.xuan.mapper.CommentMapper;
import com.xuan.mapper.MomentMapper;
import com.xuan.service.MomentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("momentService")
public class MomentServiceImpl implements MomentService {

    @Autowired
    private MomentMapper momentMapper;
    @Autowired
    private CommentMapper commentMapper;

    @Override
    public List<Moment> findAll(Integer page) {
        PageHelper.startPage(page,5);
        List<Moment> momentList = momentMapper.findAll();
        return momentList;
    }
    public List<Moment> findAll() {
        return momentMapper.findAll();
    }

    @Override
    public List<Moment> findByUid(Integer page, Integer uid) {
        PageHelper.startPage(page,5);
        List<Moment> momentList = momentMapper.findByUid(uid);
        return momentList;
    }

    @Override
    public List<Moment> findByUid(Integer uid) {
        return momentMapper.findByUid(uid);
    }


    @Override
    public Integer findUpdates(int uid) {
        List<Moment> momentList = momentMapper.findByUid(uid);
        return momentList.size();
    }

    @Override
    public Integer findLikes(int uid) {
        List<Moment> momentList = momentMapper.findByUid(uid);
        int likes = 0;
        for (Moment moment : momentList) {
            likes = likes + moment.getLike();
        }
        return likes;
    }

    @Override
    public void addMoment(Moment moment) {
        momentMapper.addMoment(moment);
    }

    @Override
    public void delMoment(Integer mid) {
        //删除该动态所有评论
        commentMapper.delCommentByMid(mid);
        //删除该动态
        momentMapper.delMoment(mid);
    }


}
