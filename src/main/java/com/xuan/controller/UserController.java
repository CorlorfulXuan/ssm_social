package com.xuan.controller;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.xuan.domain.User;
import com.xuan.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(String email, String password, HttpSession session) {
        User user = userService.login(email,password);
        if (user != null) {
            session.setAttribute("user",user);
            return "redirect:/index.jsp";
        }
        return "redirect:/login.jsp";
    }

    @RequestMapping("/register")
    public String save(User user) {
        int id = userService.save(user);
        if (id!=0) {
            return "redirect:/login.jsp";
        }
        else
            return "redirect:/register.jsp";
    }

    @RequestMapping("/loginOut")
    public String loginOut(HttpSession session) {
        session.removeAttribute("user");
        return "redirect:/login.jsp";
    }

    @RequestMapping("/edit")
    public ModelAndView edit(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();

        if (session.getAttribute("user") == null){
            modelAndView.setViewName("redirect:/login.jsp");
            return modelAndView;
        }

        //更新登录的数据
        User user = (User) session.getAttribute("user");
        User newU = userService.findById(user.getId());
        session.setAttribute("user", newU);

        modelAndView.addObject("user", newU);
        modelAndView.setViewName("/edit");

        return modelAndView;
    }

    @RequestMapping("/update")
    public String update(User user,HttpSession session) {
        userService.update(user);
        int id = user.getId();

        User newU = (User) userService.findById(id);
        session.setAttribute("user", newU);
        return "redirect:/home/profile?page=1&uid="+id;
    }

    @RequestMapping("/search")
    public String search(String search_email, HttpSession session) {
        User userResult = userService.findByEmail(search_email);
        return "redirect:/home/profile?page=1&uid="+userResult.getId();
    }

    @RequestMapping(value = "/upload",method = RequestMethod.POST)
    @ResponseBody
    public String upload(HttpSession session,MultipartFile uploadFile) throws IOException {
        Map<String,Object> map = new HashMap<>();
        //判断用户是否处于登录状态
        if (session.getAttribute("user") == null){
            return "redirect:/login.jsp";
        }
        User user = (User) session.getAttribute("user");
        //定义上传后存储路径
        String path = System.getProperty("rootpath")+"photos/";
        //获得文件名
        String originalFilename = uploadFile.getOriginalFilename();
        //通过uuid避免文件名冲突
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        //上传文件
        uploadFile.transferTo(new File(path + uuid +originalFilename));
        //更新头像地址
        userService.updateAvatar(user.getId(), uuid+originalFilename);
        //返回上传成功信息，转换为json格式
        map.put("test","上传成功");
        ObjectMapper objectMapper = new ObjectMapper();

        return objectMapper.writeValueAsString(map);
    }




}
