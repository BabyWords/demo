package cn.com.demo.dao;

import cn.com.demo.entity.Page;
import cn.com.demo.entity.User;

import java.util.List;

/**
 * Created by Keven on 2017/7/2.
 */
public interface UserDao {
    int userexsist(String policenumber);

    void adduser(User user);

    User getuser(String policenumber);

    int getAllUsersCount();


    String getphonenumber(String userid);

    void updatephonenumber(String userid,String phonenumber);

    String getpassword(String userid);
}
