package com.xuan.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.xuan.domain.Moment;
import com.xuan.domain.User;
import com.xuan.service.CommentService;
import com.xuan.service.MomentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
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
@RequestMapping("/moment")
public class MomentController {

    @Autowired
    private MomentService momentService;
    @Autowired
    private CommentService commentService;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date date;

    @RequestMapping("/add-imgMoment")
    @ResponseBody
    public String addImgMoment(HttpSession session, MultipartFile moment_img,String moment_content) throws IOException {
        Map<String,Object> map = new HashMap<>();
        //登录状态
        if (session.getAttribute("user") == null){
            return "redirect:/login.jsp";
        }
        //上传图片
        String path = System.getProperty("rootpath")+"img/";
        String originalFilename = moment_img.getOriginalFilename();
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        moment_img.transferTo(new File(path + uuid +originalFilename));
        //存入数据库
        User user = (User) session.getAttribute("user");
        Moment moment = new Moment();
        moment.setUid(user.getId());
        moment.setContent(moment_content);
        moment.setImg(uuid+originalFilename);
        date = new Date();
        moment.setTime(date);
        moment.setLike(0);
        momentService.addMoment(moment);

        map.put("test","上传成功");
        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(map);

        return json;
    }

    @RequestMapping("/add-moment")
    public String addMoment(Moment moment) {
        if (!moment.getContent().equals("")) {
            date = new Date();
            moment.setTime(date);
            moment.setLike(0);
            momentService.addMoment(moment);
        }
        return "redirect:/index.jsp";
    }

    @RequestMapping("/delMoment/{mid}/{page}")
    public String delMoment(@PathVariable("mid") Integer mid, @PathVariable("page") Integer page, HttpSession session) {
        User user = (User) session.getAttribute("user");
        momentService.delMoment(mid);

        return "redirect:/home/profile?page="+page+"&uid="+user.getId();
    }

}
