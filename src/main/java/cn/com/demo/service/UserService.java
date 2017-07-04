package cn.com.demo.service;

import cn.com.demo.entity.Page;
import cn.com.demo.entity.User;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Gerry on 2016/12/2.
 *
 */
@Service
public interface UserService {

    boolean userexsist(String policenumber);

    void adduser(User user);

    User getuser(String policenumber);

    String getphonenumber(String userid);

    void updatephonenumber(String userid,String phonenumber);

    String getpassword(String userid);
}
