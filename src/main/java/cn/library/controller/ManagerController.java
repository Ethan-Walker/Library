package cn.library.controller;

import cn.library.common.pojo.LibResult;
import cn.library.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by EthanWalker on 2017/10/11.
 */
@Controller
public class ManagerController {

    @Autowired
    private ManagerService managerService;

    @RequestMapping(method = RequestMethod.POST, value = "/manager/login")
    @ResponseBody
    public LibResult login(String username, String password, HttpServletRequest request, HttpServletResponse response) {
        LibResult result = managerService.login(username, password);
        if (result.getStatus() == 200) {
            Cookie mananger_ = new Cookie("username", username);
            mananger_.setPath("/manager");
            Cookie password_ = new Cookie("password", password);
            password_.setPath("/manager");
            response.addCookie(mananger_);
            response.addCookie(password_);
            request.getSession().setAttribute("manager", username);
        }
        return result;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/manager/login")

    public String managerLogin() {
        return "manager-login";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/manager")
    public String manager() {
        return "manager";
    }

    @RequestMapping(method=RequestMethod.GET,value="/manager/logout")
    public String logout(HttpServletRequest request,HttpServletResponse response){
        HttpSession session = request.getSession();
        session.invalidate();
        Cookie username = new Cookie("username",null);
        username.setPath("/manager");
        username.setMaxAge(0);
        Cookie password = new Cookie("password",null);
        password.setPath("/manager");
        password.setMaxAge(0);
        response.addCookie(username);
        response.addCookie(password);
        /*重定向后面跟的是 路径 ，不是 页面*/
        return "redirect:/manager/login";
    }
}
