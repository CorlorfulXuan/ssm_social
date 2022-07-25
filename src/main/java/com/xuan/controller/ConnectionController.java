package com.xuan.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.xuan.domain.*;
import com.xuan.service.*;
import com.xuan.util.EventTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.*;

@Controller
@RequestMapping("/connect")
public class ConnectionController {

    @Autowired
    private ConnectionService connectionService;
    @Autowired
    private UserService userService;
    @Autowired
    private DairyService dairyService;
    @Autowired
    private EventService eventService;
    @Autowired
    private PhotoService photoService;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date;

    @RequestMapping(value = "/uploadPhotos",method = RequestMethod.POST)
    @ResponseBody
    public String uploadPhotos(MultipartFile[] photos, HttpSession session) throws IOException {
        Map<String,Object> map = new HashMap<>();

        if (session.getAttribute("user") == null){
            return "redirect:/login.jsp";
        }
        User user = (User) session.getAttribute("user");
        //查询connection
        int l_id = 0;
        if (connectionService.selectByUid1(user.getId())!=null) {
            Connection connection = connectionService.selectByUid1(user.getId());
            l_id = connection.getId();
        }
        if (connectionService.selectByUid2(user.getId())!=null) {
            Connection connection =connectionService.selectByUid2(user.getId());
            l_id = connection.getId();
        }
        Photo insert_photo = new Photo();
        insert_photo.setL_id(l_id);
        String path = System.getProperty("rootpath")+"photos/";

        for (MultipartFile photo : photos) {
            String originalFilename = photo.getOriginalFilename();
            String uuid = UUID.randomUUID().toString().replaceAll("-", "");
            photo.transferTo(new File(path + uuid +originalFilename));
            insert_photo.setAddress(uuid +originalFilename);
            photoService.insert(insert_photo);
        }

        map.put("test","success");
        ObjectMapper objectMapper = new ObjectMapper();

        return objectMapper.writeValueAsString(map);
    }

    @RequestMapping("/insertEvent")
    public String insertEvent(Event event, String type, HttpSession session) {
        //用户登录状态
        if (session.getAttribute("user") == null){
            return "redirect:/login.jsp";
        }
        //判断内容是否为空
        if (event.getTime()==null||event.getThing()==null){
            return "redirect:/connect/goDoubleSpace/"+type;
        }
        eventService.insert(event);
        return "redirect:/connect/goDoubleSpace/"+type;
    }


    @RequestMapping("/insertDairy")
    public String insertDairy(Dairy dairy, String type, HttpSession session) {
        //用户登录状态
        if (session.getAttribute("user") == null){
            return "redirect:/login.jsp";
        }
        //判断内容是否为空
        if (dairy.getContent()==null||dairy.getTime()==null||dairy.getWeather()==null){
            return "redirect:/connect/goDoubleSpace/"+type;
        }
        //插入日记
        dairyService.insert(dairy);
        return "redirect:/connect/goDoubleSpace/"+type;
    }


    @RequestMapping("/goDoubleSpace/{type}")
    public ModelAndView goDoubleSpace(@PathVariable("type")String type, HttpSession session) throws ParseException {
        ModelAndView modelAndView = new ModelAndView();
        //用户登录状态
        if (session.getAttribute("user") == null){
            modelAndView.setViewName("redirect:/login.jsp");
            return modelAndView;
        }
        //跳到页面种类
        modelAndView.addObject("type",type);
        //主用户
        User user = (User) session.getAttribute("user");
        modelAndView.addObject("user1",user);
        int uid = user.getId();
        String msg = "";
        //查询user在不在connection表里
        if (connectionService.selectByUid1(uid)!=null) {
            if (connectionService.selectByUid1(uid).getIsConfirm()==1){
                Connection connection = connectionService.selectByUid1(uid);
                //绑定信息
                modelAndView.addObject("connection",connection);
                User user2 = userService.findById(connection.getUid2());
                //绑定用户
                modelAndView.addObject("user2",user2);
                //日记展示
                List<Dairy> dairyList = dairyService.findByLid(connection.getId());
                for (Dairy dairy : dairyList) {
                    User user_dairy = userService.findById(dairy.getUid());
                    dairy.setUser(user_dairy);
                }
                modelAndView.addObject("dairyList",dairyList);
                //纪念日展示
                List<Event> eventList = eventService.findByLid(connection.getId());
                for (Event event : eventList) {
                    Long resultTime = EventTime.getResultTime(event.getTime());
                    event.setResultTime(resultTime);
                }
                modelAndView.addObject("eventList",eventList);
                //照片展示
                List<Photo> photoList = photoService.findByLid(connection.getId());
                modelAndView.addObject("photoList",photoList);

                modelAndView.setViewName("/coupleSpace");
            }else {
                msg = "还没有完成绑定";
                modelAndView.addObject("msg",msg);
                modelAndView.addObject("isConfirm",0);
                modelAndView.setViewName("/agreeConnect");
            }
        }else if (connectionService.selectByUid2(uid)!=null) {
            if (connectionService.selectByUid2(uid).getIsConfirm()==1){
                Connection connection = connectionService.selectByUid2(uid);
                //绑定信息
                modelAndView.addObject("connection",connection);
                User user2 = userService.findById(connection.getUid1());
                //绑定用户
                modelAndView.addObject("user2",user2);
                //日记展示
                List<Dairy> dairyList = dairyService.findByLid(connection.getId());
                for (Dairy dairy : dairyList) {
                    User user_dairy = userService.findById(dairy.getUid());
                    dairy.setUser(user_dairy);
                }
                modelAndView.addObject("dairyList",dairyList);
                //纪念日展示
                List<Event> eventList = eventService.findByLid(connection.getId());
                for (Event event : eventList) {
                    Long resultTime = EventTime.getResultTime(event.getTime());
                    event.setResultTime(resultTime);
                }
                modelAndView.addObject("eventList",eventList);
                //照片展示
                List<Photo> photoList = photoService.findByLid(connection.getId());
                modelAndView.addObject("photoList",photoList);

                modelAndView.setViewName("/coupleSpace");
            }else {
                msg = "还没有完成绑定";
                modelAndView.addObject("msg",msg);
                modelAndView.addObject("isConfirm",0);
                modelAndView.setViewName("/agreeConnect");
            }
        }else {
            msg = "还没有完成绑定";
            modelAndView.addObject("msg",msg);
            modelAndView.addObject("isConfirm",0);
            modelAndView.setViewName("/agreeConnect");
        }
        return modelAndView;
    }
    @RequestMapping("/refuse/{cid}")
    public String refuse(@PathVariable("cid") Integer cid) {
        if (cid != 0) {
            connectionService.delById(cid);
        }
        return "redirect:/index.jsp";
    }

    @RequestMapping("/confirm")
    public String Confirm(HttpSession session) {
        User user = (User) session.getAttribute("user");
        connectionService.confirm(user.getId());
        return "redirect:/index.jsp";
    }
    @RequestMapping("/agree")
    public ModelAndView agreeConnect(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.setViewName("/agreeConnect");
        User user = (User) session.getAttribute("user");
        String msg = "";
        Integer isConfirm = 0;

        if (connectionService.selectByUid1(user.getId())!=null) {
            Connection connection = connectionService.selectByUid1(user.getId());
            User user2 = userService.findById(connection.getUid2());
            if (connection.getIsConfirm()==0){
                msg = "等待"+user2.getUsername()+"同意";
                modelAndView.addObject("cid",0);
            }else {
                modelAndView.setViewName("redirect:/home/profile?page=1&uid="+user2.getId());
            }
        }else if (connectionService.selectByUid1(user.getId())==null&&connectionService.selectByUid2(user.getId())==null) {
            msg = "还没有发起和收到任何申请，快去申请与其他用户绑定吧";
            modelAndView.addObject("cid",0);
        }else if (connectionService.selectByUid2(user.getId())!=null) {
            Connection connection = connectionService.selectByUid2(user.getId());
            User user1 = userService.findById(connection.getUid1());
            if (connection.getIsConfirm()==0){
                msg = "同意"+user1.getUsername()+"的绑定申请吗";
                isConfirm = 1;
                modelAndView.addObject("cid",connection.getId());
            }else {
                modelAndView.setViewName("redirect:/home/profile?page=1&uid="+user1.getId());
            }
        }

        modelAndView.addObject("isConfirm",isConfirm);
        modelAndView.addObject("msg",msg);
        return modelAndView;
    }

    @RequestMapping("/start/{uid}/{page}")
    public ModelAndView connect(@PathVariable("uid") Integer uid, @PathVariable("page")Integer page, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/judgeConnect");
        User user1 = (User) session.getAttribute("user");
        User user2 = userService.findById(uid);
        String msg = "";

        //如果都不在 直接插入数据 IsConfirm为0
        //先查找user1和user2在不在connection表里
        //user1在1号位，user2在2号位 IsConfirm为0：已申请，等待对方同意；IsConfirm为1：您已经与该用户绑定关系
        //user1在1号位，user2不在2号位 IsConfirm为0：您已经申请与其他用户绑定；IsConfirm为1：您已经与其他用户绑定关系
        //user2在1号位，user1在2号位 IsConfirm为0：对方已给你申请，去同意；IsConfirm为1：您已经与该用户绑定关系
        //user2在1号位，user1不在2号位 IsConfirm为0：对方已申请与他人绑定关系；IsConfirm为1：该用户已与其他用户绑定关系
        //user1不在1号位，user2在2号位，已有其他人发起申请
        if (connectionService.selectByUid1(user1.getId())==null&&connectionService.selectByUid1(user2.getId())==null
            &&connectionService.selectByUid2(user1.getId())==null&&connectionService.selectByUid2(user2.getId())==null) {
            Connection connection = new Connection();
            connection.setUid1(user1.getId());
            connection.setUid2(user2.getId());
            date = new Date();
            connection.setCreate_time(date);
            connection.setIsConfirm(0);
            connectionService.addConnection(connection);
            msg = "申请成功,等待对方同意";
        }else {
            msg = "申请失败";
        //    if (connectionService.selectByUid1(user1.getId())!=null&&connectionService.selectByUid2(user2.getId())!=null) {
        //        Connection connection = connectionService.selectByUid1(user1.getId());
        //        if (connection.getIsConfirm()==0) {
        //            msg = "已申请，等待对方同意";
        //        }else {
        //            msg = "您已经与该用户绑定关系";
        //        }
        //    }else if (connectionService.selectByUid1(user1.getId())!=null&&connectionService.selectByUid2(user2.getId())==null) {
        //        Connection connection = connectionService.selectByUid1(user1.getId());
        //        if (connection.getIsConfirm()==0) {
        //            msg = "您已经申请与其他用户绑定";
        //        }else {
        //            msg = "您已经与其他用户绑定关系";
        //        }
        //    }else if (connectionService.selectByUid1(user2.getId())!=null&&connectionService.selectByUid2(user1.getId())!=null) {
        //        Connection connection = connectionService.selectByUid1(user2.getId());
        //        if (connection.getIsConfirm()==0) {
        //            msg = "对方已给你申请，去同意";
        //        }else {
        //            msg = "您已经与该用户绑定关系";
        //        }
        //    }else if (connectionService.selectByUid1(user2.getId())!=null&&connectionService.selectByUid2(user1.getId())==null) {
        //        Connection connection = connectionService.selectByUid1(user2.getId());
        //        if (connection.getIsConfirm()==0) {
        //            msg = "对方已申请与他人绑定关系";
        //        }else {
        //            msg = "该用户已与其他用户绑定关系";
        //        }
        //    }else if (connectionService.selectByUid1(user1.getId())==null&&connectionService.selectByUid2(user2.getId())!=null) {
        //        Connection connection = connectionService.selectByUid2(user2.getId());
        //        if (connection.getIsConfirm()==0) {
        //            msg = "已有其他用户申请绑定";
        //        }else {
        //            msg = "该用户已与其他用户绑定关系";
        //        }
        //    }
        }
        modelAndView.addObject("msg",msg);
        modelAndView.addObject("page",page);
        modelAndView.addObject("user2",user2);
        return modelAndView;
    }

}
