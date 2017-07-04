package cn.com.demo.controller;

import cn.com.demo.entity.User;
import cn.com.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Created by Gerry on 2016/12/2.
 * Maven+Spring+SpringMVC+Log4j+BootStrap+Mybatis+Generate的Demo实例
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController{
    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String userlogin(HttpSession session,@RequestParam String userid, @RequestParam String password, HttpServletRequest request, HttpServletResponse response) {

        User user = new User();
        if (userService.userexsist(userid)&&password.equals("snxun.com")){
            user = userService.getuser(userid);
            session.setAttribute("sessionuser", user);
            return "redirect:/message/tolist";
        }else{
            return "redirect:/adminlogin.jsp";
        }

    }

}


