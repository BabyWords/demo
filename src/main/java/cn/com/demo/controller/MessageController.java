package cn.com.demo.controller;

import cn.com.demo.entity.Message;
import cn.com.demo.entity.Page;
import cn.com.demo.entity.User;
import cn.com.demo.service.MessageService;
import cn.com.demo.service.UserService;
import cn.com.demo.util.UUIDGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.*;
import java.text.SimpleDateFormat;

/**
 * Created by Keven on 2017/7/1.
 */
@Controller
@RequestMapping("/message")

public class MessageController extends  BaseController{
    @Autowired
    MessageService messageService;
    @Autowired
    UserService userService;


    @RequestMapping("/list")
    public String testmessage(HttpSession session, ModelAndView mv, @RequestParam String policenumber, @RequestParam String nickname, @RequestParam String deptname) {
        User user = new User();
        if (userService.userexsist(policenumber)) {
            user = userService.getuser(policenumber);
            session.setAttribute("sessionuser", user);
        } else {
            try{
                String newnickname=URLDecoder.decode(nickname,"UTF-8");
                String newdeptname=URLDecoder.decode(deptname,"UTF-8");
                String user_name=new String(newnickname.getBytes("iso-8859-1"),"UTF-8");
                String dept_name=new String(newdeptname.getBytes("iso-8859-1"),"UTF-8");
                user.setId(UUIDGenerator.getUUID());
                user.setUsername(user_name);
                user.setPolicenumber(policenumber);
                user.setPhonenumber("0");
                user.setDeptname(dept_name);
                user.setType("0");
                userService.adduser(user);
                session.setAttribute("sessionuser", user);
            }catch (Exception e){
                e.printStackTrace();
            }

        }
        return "redirect:/message/tolist";
    }

    @RequestMapping("/tolist")
    public ModelAndView tolist(HttpServletRequest request) {
        //用于存放结果的Map，存有page信息和用户list
        Map<String, Object> map = new HashMap<String, Object>();
        //获取总的页面数量
        String currentPage = request.getParameter("currentPage");
        //String pageNow = "1";
        Page page = null;
        //该list存放用户信息
        List<Message> messagelist = new ArrayList<Message>();
        //获取总的行数即记录数
        int totalRow = messageService.getAllMessageCount();
        if (currentPage != null) {
            //构造一个page，参数包括总记录条数和当前页号
            page = new Page(totalRow, Integer.parseInt(currentPage));
            //返回查询的结果
            messagelist = messageService.getAllMessageList(page);
        } else {
            //第一次查询时默认currentPage为1
            page = new Page(totalRow, 1);
            //返回查询的结果
            messagelist = messageService.getAllMessageList(page);
        }
        //将page存入map
        map.put("page", page);
        //将用户list存入map
        map.put("messagelist", messagelist);
        return new ModelAndView("list", map);
    }

    @RequestMapping("/toaddinput")
    public String toadd() {
        return "addinput";
    }

    @RequestMapping("/addmessage")
    public String addmessage(HttpSession session, @RequestParam(required = false) String title, @RequestParam(required = false) String content, @RequestParam(required = false) String phonenumber) {
        Message insertmesage = new Message();
        Date data = new Date();
        User user = (User) session.getAttribute("sessionuser");
//        user.setPhonenumber(phonenumber);
//        userService.updatephonenumber(user.getId(),phonenumber);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        String nowtime = dateFormat.format(data);
        insertmesage.setId(UUIDGenerator.getUUID());
        insertmesage.setTitle(title);
        insertmesage.setContent(content);
        insertmesage.setCreate_time(nowtime);
        insertmesage.setStatus("0");
        insertmesage.setCreate_user(user.getId());
        insertmesage.setPhonenumber(phonenumber);
        messageService.addmessage(insertmesage);
        return "redirect:/message/tolist";
    }

    @RequestMapping("/showdetail")
    public ModelAndView showdetail(HttpSession session, @RequestParam String messageid) {
        ModelAndView mv = new ModelAndView();
        String phonenumber = "";
        Message message = messageService.getonemessage(messageid);
        phonenumber = userService.getphonenumber(message.create_user);
        mv.addObject("message", message);
        mv.addObject("phonenumber", phonenumber);
        mv.setViewName("showdetail");
        return mv;
    }

    @RequestMapping("/changestatus")
    public void changestatus(@RequestParam String id, HttpServletResponse response) {
        messageService.changestatus(id);
    }

    @RequestMapping("/deletemessage")
    public void deletemessage(@RequestParam String id, HttpServletResponse response) {
        messageService.deletemessage(id);
    }

    @RequestMapping("/showmymessage")
    public ModelAndView shwomymessage(HttpServletRequest request,HttpSession session) {
        User user = (User) session.getAttribute("sessionuser");
        Map<String, Object> map = new HashMap<String, Object>();

        String currentPage = request.getParameter("currentPage");

        Page page = null;

        List<Message> messagelist = new ArrayList<Message>();

        int totalRow = messageService.getmyMessageCount(user.getId());
        if (currentPage != null) {

            page = new Page(totalRow, Integer.parseInt(currentPage));

            messagelist = messageService.getmyMessageList(page,user.getId());
        } else {

            page = new Page(totalRow, 1);

            messagelist = messageService.getmyMessageList(page,user.getId());
        }

        map.put("page", page);

        map.put("messagelist", messagelist);
        return new ModelAndView("list", map);
    }
}
