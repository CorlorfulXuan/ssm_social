package com.xuan.service.impl;

import com.xuan.domain.Comment;
import com.xuan.mapper.CommentMapper;
import com.xuan.mapper.UserMapper;
import com.xuan.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("commentService")
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentMapper commentMapper;
    @Autowired
    private UserMapper userMapper;


    @Override
    public List<Comment> findByMid(int mid) {
        List<Comment> comments = commentMapper.findByMid(mid);
        for (Comment comment : comments) {
            comment.setUser(userMapper.findById(comment.getUid()));
        }

        return comments;
    }

    @Override
    public void addComment(Comment comment) {


        commentMapper.addComment(comment);
    }

    @Override
    public List<Comment> findAll() {
        return commentMapper.findAll();
    }

    @Override
    public void delById(Integer id) {
        commentMapper.delById(id);
    }

    @Override
    public void delByUid(Integer id) {
        commentMapper.delByUid(id);
    }
}
