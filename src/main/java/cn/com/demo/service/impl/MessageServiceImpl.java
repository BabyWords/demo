package cn.com.demo.service.impl;

import cn.com.demo.dao.MessageDao;
import cn.com.demo.entity.Message;
import cn.com.demo.entity.Page;
import cn.com.demo.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * Created by Keven on 2017/7/2.
 */
@Service("messageservice")
public class MessageServiceImpl implements MessageService {
    @Autowired
    private MessageDao messageDao;

    public void addmessage(Message message) {
        messageDao.addmessage(message);
    }

    public int getAllMessageCount() {
        return messageDao.getAllMessageCount();
    }

    @Override
    public int getmyMessageCount(String userid) {
        return messageDao.getmyMessageCount(userid);
    }

    public List<Message> getAllMessageList(Page page) {
        return messageDao.getAllMessageList(page);
    }

    @Override
    public List<Message> getmyMessageList(Page page, String userid) {
        HashMap map=new HashMap();
        map.put("page",page);
        map.put("userid",userid);
        return messageDao.getmyMessageList(map);
    }

    @Override
    public Message getonemessage(String messageid) {
        Message message = (Message) messageDao.getonemessage(messageid);
        return message;
    }

    @Override
    public void changestatus(String messageid) {
        messageDao.changestatus(messageid);
    }

    @Override
    public void deletemessage(String messageid) {
        messageDao.deletemessage(messageid);
    }
}
