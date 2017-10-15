package cn.library.controller;

import cn.library.common.pojo.LibResult;
import cn.library.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by EthanWalker on 2017/10/11.
 */
@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping(method = RequestMethod.POST,value="/admin/login")
    @ResponseBody
    public LibResult login(String username, String password, HttpServletRequest request, HttpServletResponse response){
        LibResult result= adminService.login(username,password);
        if(result.getStatus()==200){
            Cookie admin_ =  new Cookie("username",username);
            admin_.setPath("/admin");
            Cookie password_=  new Cookie("password",password);
            password_.setPath("/admin");
            response.addCookie(admin_);
            response.addCookie(password_);

            request.getSession().setAttribute("admin",username);
        }
        return result;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/admin/login")
    public String adminLogin() {
        return "admin-login";
    }



    @RequestMapping(method = RequestMethod.GET, value = "/admin")
    public String admin() {
        return "admin";
    }

}
