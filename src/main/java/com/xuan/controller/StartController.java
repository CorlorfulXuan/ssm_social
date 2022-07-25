package com.xuan.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xuan.domain.Advertisement;
import com.xuan.domain.Comment;
import com.xuan.domain.Moment;
import com.xuan.domain.User;
import com.xuan.service.AdvertisementService;
import com.xuan.service.CommentService;
import com.xuan.service.MomentService;
import com.xuan.service.UserService;
import com.xuan.util.Age;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ClassUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/home")
public class StartController {

    @Autowired
    private AdvertisementService advertisementService;
    @Autowired
    private MomentService momentService;
    @Autowired
    private UserService userService;
    @Autowired
    private CommentService commentService;


    @RequestMapping("/index")
    public ModelAndView toIndex(HttpSession session,@RequestParam(defaultValue = "1") Integer page) {
        ModelAndView modelAndView = new ModelAndView();

        //广告位加载
        List<Advertisement> advertisementList = advertisementService.findAll();
        Advertisement advertisement_1 = advertisementList.get(0);
        Advertisement advertisement_2 = advertisementList.get(1);
        //左边2广告位
        modelAndView.addObject("advertisement_1",advertisement_1);
        //右边1广告位
        modelAndView.addObject("advertisement_2",advertisement_2);

        //加载moment
        List<Moment> momentList = momentService.findAll(page);
        for (Moment moment : momentList) {
            //查询moment对应的User
            moment.setUser(userService.findById(moment.getUid()));
            //查询moment对应评论
            List<Comment> comments = commentService.findByMid(moment.getId());
            //将评论数插入moment
            moment.setComment_num(comments.size());
            //将评论插入moment
            moment.setComments(comments);
        }
        PageInfo<Moment> pageInfo = new PageInfo<>(momentList);
        modelAndView.addObject("pageInfo",pageInfo);
        modelAndView.addObject("momentList",momentList);

        if (session.getAttribute("user") == null){
            modelAndView.setViewName("redirect:/login.jsp");
            return modelAndView;
        }

        //加载用户数据
        User user = (User) session.getAttribute("user");
        int updates = momentService.findUpdates(user.getId());
        modelAndView.addObject("updates",updates);
        int likes = momentService.findLikes(user.getId());
        modelAndView.addObject("likes",likes);

        //加载推荐用户
        List<User> userList = userService.findAll();

        //排除登录的用户
        Iterator<User> userIterator = userList.iterator();
        while (userIterator.hasNext()) {
            User user1 = userIterator.next();
            if (Objects.equals(user1.getId(), user.getId()))
                userIterator.remove();
        }

        //随机推荐用户
        Random random = new Random();
        int n = random.nextInt(userList.size());
        User recommend_user = userList.get(n);
        int recommend_userAge = Age.getAge(recommend_user.getBorn());
        modelAndView.addObject("recommend_user",recommend_user);
        modelAndView.addObject("recommend_userAge", recommend_userAge);

        modelAndView.setViewName("/realIndex");
        return modelAndView;
    }

    //进入主页
    @RequestMapping("/profile")
    public ModelAndView  toProfile(HttpSession session,@RequestParam(defaultValue = "1") Integer page, @RequestParam Integer uid) {
        ModelAndView modelAndView = new ModelAndView();
        User user = (User) session.getAttribute("user");
        User pro_user = userService.findById(uid);

        if (session.getAttribute("user") == null){
            modelAndView.setViewName("redirect:/login.jsp");
            return modelAndView;
        }

        int age = Age.getAge(pro_user.getBorn());
        modelAndView.addObject("age",age);
        modelAndView.addObject("pro_user",pro_user);

        List<Moment> momentList = momentService.findByUid(page,uid);
        for (Moment moment : momentList) {
            //查询moment对应的User
            moment.setUser(userService.findById(moment.getUid()));
            //查询moment对应评论
            List<Comment> comments = commentService.findByMid(moment.getId());
            //将评论数插入moment
            moment.setComment_num(comments.size());
            //将评论插入moment
            moment.setComments(comments);
        }
        PageInfo<Moment> pageInfo = new PageInfo<>(momentList);
        modelAndView.addObject("pageInfo",pageInfo);
        modelAndView.addObject("momentList",momentList);

        int updates = momentService.findUpdates(pro_user.getId());
        modelAndView.addObject("updates",updates);
        int likes = momentService.findLikes(pro_user.getId());
        modelAndView.addObject("likes",likes);

        if (user.getId().equals(pro_user.getId())) {
            modelAndView.setViewName("/profile_self");
        }else {
            modelAndView.setViewName("/profile");
        }
        return modelAndView;
    }
}
