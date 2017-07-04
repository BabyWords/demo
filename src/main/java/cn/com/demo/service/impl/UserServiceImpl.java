package cn.com.demo.service.impl;

import cn.com.demo.dao.UserDao;
import cn.com.demo.entity.Page;
import cn.com.demo.entity.User;
import cn.com.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Gerry on 2016/12/2.
 */
@Service("userservice")
public class UserServiceImpl implements UserService {

@Autowired
    private UserDao userDao;
//    public UserTable getuserpassword(int userid) {
//
//        return userTableMapper.selectByPrimaryKey(userid);
//    }



    /**
     * Keven
     * @param policenumber
     * @return
     */
    public boolean userexsist(String policenumber){

        if(userDao.userexsist(policenumber)==0){
            return false;
        }else{
            return true;
        }
    }

    public void adduser(User user){
        userDao.adduser(user);
    }
    public User getuser(String policenumber){
        return userDao.getuser(policenumber);
    }

    @Override
    public String getphonenumber(String userid) {
        return userDao.getphonenumber(userid);
    }

    @Override
    public void updatephonenumber(String userid, String phonenumber) {
        userDao.updatephonenumber(userid,phonenumber);
    }

    @Override
    public String getpassword(String userid) {
        return userDao.getpassword(userid);
    }
}
