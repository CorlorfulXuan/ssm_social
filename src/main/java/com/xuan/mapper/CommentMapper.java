package com.xuan.mapper;

import com.xuan.domain.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommentMapper {

    List<Comment> findByMid(int mid);

    void addComment(Comment comment);

    void delCommentByMid(@Param("mid") Integer mid);

    List<Comment> findAll();

    void delById(@Param("id") Integer id);

    void delByUid(@Param("uid") Integer id);
}
