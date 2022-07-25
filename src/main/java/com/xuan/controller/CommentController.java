package com.xuan.controller;

import com.xuan.domain.Comment;
import com.xuan.domain.User;
import com.xuan.service.CommentService;
import com.xuan.service.MomentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    private CommentService commentService;
    @Autowired
    private MomentService momentService;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date date;

    @RequestMapping("/add-comment")
    public String addComment(Comment comment) {
        if (!comment.getContent().equals("")) {
            date = new Date();
            comment.setTime(date);
            commentService.addComment(comment);
        }
        return "redirect:/index.jsp";
    }


}
