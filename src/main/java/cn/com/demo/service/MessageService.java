package cn.com.demo.service;

import cn.com.demo.entity.Message;
import cn.com.demo.entity.Page;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Keven on 2017/7/2.
 */
@Service
public interface MessageService {
    void addmessage(Message message);

    int getAllMessageCount();

    int getmyMessageCount(String userid);

    List<Message> getAllMessageList(Page page);

    List<Message> getmyMessageList(Page page, String userid);

    Message getonemessage(String messageid);

    void changestatus(String messageid);

    void deletemessage(String messageid);
}
