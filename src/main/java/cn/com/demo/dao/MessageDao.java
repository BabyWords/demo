package cn.com.demo.dao;

import cn.com.demo.entity.Message;
import cn.com.demo.entity.Page;

import java.util.HashMap;
import java.util.List;

/**
 * Created by Keven on 2017/7/2.
 */
public interface MessageDao {
    void addmessage(Message message);

    int getAllMessageCount();

    int getmyMessageCount(String userid);

    List<Message> getAllMessageList(Page page);

    List<Message> getmyMessageList(HashMap map);

    Message getonemessage(String messageid);

    void changestatus(String messageid);

    void deletemessage(String messageid);
}
