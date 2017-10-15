package cn.library.controller;

import cn.library.common.pojo.LibResult;
import cn.library.service.SubscribeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by EthanWalker on 2017/10/14.
 */
@Controller
public class SubscribeController {

    @Autowired
    private SubscribeService subscribeService;

    @RequestMapping(method= RequestMethod.POST,value="/bookSubscribe")
    @ResponseBody
    public LibResult bookSubscribe(Long bookId, HttpServletRequest request){
        HttpSession session =request.getSession();
        Object username = session.getAttribute("username");
        return subscribeService.subscribe(username.toString(), bookId);
    }

}
