package com.xuan.service;

import com.xuan.domain.Comment;

import java.util.Date;
import java.util.List;

public interface CommentService {

    public List<Comment> findByMid(int mid);

    public void addComment(Comment comment);


    List<Comment> findAll();

    void delById(Integer id);

    void delByUid(Integer id);
}
