package com.xuan.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.xuan.domain.*;
import com.xuan.service.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;
    @Autowired
    private UserService userService;
    @Autowired
    private MomentService momentService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private ConnectionService connectionService;
    @Autowired
    private DairyService dairyService;
    @Autowired
    private PhotoService photoService;
    @Autowired
    private EventService eventService;
    @Autowired
    private AdvertisementService advertisementService;

    @RequestMapping(value = "/updateAds",method = RequestMethod.POST)
    public String updateAds(HttpSession session, MultipartFile imgFile, Advertisement advertisement) throws IOException {
        if (session.getAttribute("admin") == null){
            return "redirect:/admin_login.jsp";
        }
        if (imgFile.isEmpty()||advertisement.getId()==null) {
            return "redirect:/admin_adsList.jsp";
        }

        String path = System.getProperty("rootpath")+"img/";
        String originalFilename = imgFile.getOriginalFilename();
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        imgFile.transferTo(new File(path + uuid +originalFilename));
        advertisement.setImg(uuid+originalFilename);
        advertisementService.update(advertisement);

        return "redirect:/admin_adsList.jsp";
    }

    @RequestMapping("/editAds/{id}")
    public ModelAndView editAds(@PathVariable("id") Integer id, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null) {
            modelAndView.setViewName("redirect:/admin_login.jsp");
            return modelAndView;
        }
        Advertisement advertisement = advertisementService.findById(id);
        modelAndView.addObject("ads",advertisement);
        modelAndView.setViewName("/editAds");
        return modelAndView;
    }

    @RequestMapping(value = "/delPhoto",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String delPhoto(@RequestBody String ids, HttpSession session) throws IOException {
        Map<String,Object> map = new HashMap<>();
        ObjectMapper objectMapper = new ObjectMapper();
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null) {
            map.put("msg","login");
            return objectMapper.writeValueAsString(map);
        }

        Map idMap = objectMapper.readValue(ids,Map.class);
        String[] idsStr = idMap.get("ids").toString().substring(1,idMap.get("ids").toString().length()-1).split(",");
        List<Integer> idList = new ArrayList<>();
        for (String s : idsStr) {
            idList.add(Integer.valueOf(s));
        }
        for (Integer id : idList) {
            photoService.delById(id);
        }
        map.put("msg","success");

        return objectMapper.writeValueAsString(map);
    }
    @RequestMapping(value = "/delEvent",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String delEvent(@RequestBody String ids, HttpSession session) throws IOException {
        Map<String,Object> map = new HashMap<>();
        ObjectMapper objectMapper = new ObjectMapper();
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null) {
            map.put("msg","login");
            return objectMapper.writeValueAsString(map);
        }

        Map idMap = objectMapper.readValue(ids,Map.class);
        String[] idsStr = idMap.get("ids").toString().substring(1,idMap.get("ids").toString().length()-1).split(",");
        List<Integer> idList = new ArrayList<>();
        for (String s : idsStr) {
            idList.add(Integer.valueOf(s));
        }
        for (Integer id : idList) {
            eventService.delById(id);
        }
        map.put("msg","success");

        return objectMapper.writeValueAsString(map);
    }

    @RequestMapping(value = "/delDairy",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String delDairy(@RequestBody String ids, HttpSession session) throws IOException {
        Map<String,Object> map = new HashMap<>();
        ObjectMapper objectMapper = new ObjectMapper();
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null) {
            map.put("msg","login");
            return objectMapper.writeValueAsString(map);
        }

        Map idMap = objectMapper.readValue(ids,Map.class);
        String[] idsStr = idMap.get("ids").toString().substring(1,idMap.get("ids").toString().length()-1).split(",");
        List<Integer> idList = new ArrayList<>();
        for (String s : idsStr) {
            idList.add(Integer.valueOf(s));
        }
        for (Integer id : idList) {
            dairyService.delById(id);
        }
        map.put("msg","success");

        return objectMapper.writeValueAsString(map);
    }

    @RequestMapping(value = "/delConnection",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String delConnection(@RequestBody String ids, HttpSession session) throws IOException {
        Map<String,Object> map = new HashMap<>();
        ObjectMapper objectMapper = new ObjectMapper();
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null) {
            map.put("msg","login");
            return objectMapper.writeValueAsString(map);
        }

        Map idMap = objectMapper.readValue(ids,Map.class);
        String[] idsStr = idMap.get("ids").toString().substring(1,idMap.get("ids").toString().length()-1).split(",");
        List<Integer> idList = new ArrayList<>();
        for (String s : idsStr) {
            idList.add(Integer.valueOf(s));
        }
        for (Integer id : idList) {
            connectionService.delById(id);
        }
        map.put("msg","success");

        return objectMapper.writeValueAsString(map);
    }

    @RequestMapping(value = "/delComment",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String delComment(@RequestBody String ids, HttpSession session) throws IOException {
        Map<String,Object> map = new HashMap<>();
        ObjectMapper objectMapper = new ObjectMapper();
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null) {
            map.put("msg","login");
            return objectMapper.writeValueAsString(map);
        }

        Map idMap = objectMapper.readValue(ids,Map.class);
        String[] idsStr = idMap.get("ids").toString().substring(1,idMap.get("ids").toString().length()-1).split(",");
        List<Integer> idList = new ArrayList<>();
        for (String s : idsStr) {
            idList.add(Integer.valueOf(s));
        }
        for (Integer id : idList) {
            commentService.delById(id);
        }
        map.put("msg","success");

        return objectMapper.writeValueAsString(map);
    }
    @RequestMapping(value = "/delMoment",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String delMoment(@RequestBody String ids, HttpSession session) throws IOException {
        Map<String,Object> map = new HashMap<>();
        ObjectMapper objectMapper = new ObjectMapper();
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null) {
            map.put("msg","login");
            return objectMapper.writeValueAsString(map);
        }

        Map idMap = objectMapper.readValue(ids,Map.class);
        String[] idsStr = idMap.get("ids").toString().substring(1,idMap.get("ids").toString().length()-1).split(",");
        List<Integer> idList = new ArrayList<>();
        for (String s : idsStr) {
            idList.add(Integer.valueOf(s));
        }
        for (Integer id : idList) {
            momentService.delMoment(id);
        }

        map.put("msg","success");

        return objectMapper.writeValueAsString(map);
    }

    @RequestMapping(value = "/delUser",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String delUser(@RequestBody String ids, HttpSession session) throws IOException {
        Map<String,Object> map = new HashMap<>();
        ObjectMapper objectMapper = new ObjectMapper();
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null) {
            map.put("msg","login");
            return objectMapper.writeValueAsString(map);
        }

        Map idMap = objectMapper.readValue(ids,Map.class);
        String[] idsStr = idMap.get("ids").toString().substring(1,idMap.get("ids").toString().length()-1).split(",");
        List<Integer> idList = new ArrayList<>();
        for (String s : idsStr) {
            idList.add(Integer.valueOf(s));
        }
        for (Integer id : idList) {
            //检查connection
            if (connectionService.selectByUid1(id)!=null&&connectionService.selectByUid2(id)==null){
                connectionService.delById(connectionService.selectByUid1(id).getId());
            }
            if (connectionService.selectByUid1(id)==null&&connectionService.selectByUid2(id)!=null) {
                connectionService.delById(connectionService.selectByUid2(id).getId());
            }
            if (momentService.findByUid(id).size()!=0){
                List<Moment> momentList = momentService.findByUid(id);
                for (Moment moment : momentList) {
                    momentService.delMoment(moment.getId());
                }
            }
            commentService.delByUid(id);
            userService.delById(id);

        }


        map.put("msg","success");

        return objectMapper.writeValueAsString(map);
    }

    @RequestMapping(value = "/comment-list",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getCommentList() throws JsonProcessingException {

        List<Comment> commentList = commentService.findAll();
        ObjectMapper objectMapper = new ObjectMapper();

        return objectMapper.writeValueAsString(commentList);
    }

    @RequestMapping(value = "/moment-list",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getMomentList() throws JsonProcessingException {

        List<Moment> momentList = momentService.findAll();
        ObjectMapper objectMapper = new ObjectMapper();

        return objectMapper.writeValueAsString(momentList);
    }

    @RequestMapping(value = "/user-list",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getUserList() throws JsonProcessingException {

        List<User> userList = userService.findAll();
        ObjectMapper objectMapper = new ObjectMapper();

        return objectMapper.writeValueAsString(userList);
    }
    @RequestMapping(value = "/ads-list",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getAdsList() throws JsonProcessingException {

        List<Advertisement> advertisementList = advertisementService.findAll();
        ObjectMapper objectMapper = new ObjectMapper();

        return objectMapper.writeValueAsString(advertisementList);
    }
    @RequestMapping(value = "/connection-list",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getConnectionList() throws JsonProcessingException {

        List<Connection> connectionList = connectionService.findAll();
        ObjectMapper objectMapper = new ObjectMapper();

        return objectMapper.writeValueAsString(connectionList);
    }
    @RequestMapping(value = "/dairy-list",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getDairyList() throws JsonProcessingException {

        List<Dairy> dairyList = dairyService.findAll();
        ObjectMapper objectMapper = new ObjectMapper();

        return objectMapper.writeValueAsString(dairyList);
    }
    @RequestMapping(value = "/event-list",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getEventList() throws JsonProcessingException {

        List<Event> eventList = eventService.findAll();
        ObjectMapper objectMapper = new ObjectMapper();

        return objectMapper.writeValueAsString(eventList);
    }
    @RequestMapping(value = "/photo-list",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getPhotoList() throws JsonProcessingException {

        List<Photo> photoList = photoService.findAll();
        ObjectMapper objectMapper = new ObjectMapper();

        return objectMapper.writeValueAsString(photoList);
    }


    @RequestMapping("/login")
    public String login(String username, String password, HttpSession session) {
        Admin admin = adminService.findByEmailAndPassword(username, password);
        if (admin != null) {
            session.setAttribute("admin", admin);
            return "redirect:/admin_index.jsp";
        }else {
            return "redirect:/admin_login.jsp";
        }
    }

    @RequestMapping("/loginOut")
    public String loginOut(HttpSession session) {
        session.removeAttribute("admin");
        return "redirect:/admin_login.jsp";
    }

}
