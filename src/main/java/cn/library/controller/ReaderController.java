package cn.library.controller;

import cn.library.common.pojo.LibResult;
import cn.library.mapper.ReaderMapper;
import cn.library.pojo.Reader;
import cn.library.service.ReaderService;
import cn.library.utils.CookieUtils;
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
 * Created by EthanWalker on 2017/10/10.
 */
@Controller
public class ReaderController {

    @Autowired
    private ReaderService readerService;

    @RequestMapping(method = RequestMethod.POST,value = "/login")
    @ResponseBody
    public LibResult login(Reader reader, HttpServletRequest request, HttpServletResponse response){

        LibResult result =  readerService.login(reader);
        if(result.getStatus()==200){
            Cookie username = new Cookie("username", reader.getUsername());
            username.setPath("/");
            response.addCookie(username);
            Cookie password = new Cookie("password",reader.getPassword());
            password.setPath("/");
            response.addCookie(password);
            HttpSession session = request.getSession();
            session.setAttribute("reader",username);
        }
        return result;
    }

    @RequestMapping(method =RequestMethod.GET,value = "/logout")
    public String logout(HttpServletRequest request,HttpServletResponse response){
        HttpSession session = request.getSession();
        session.invalidate();
        Cookie username = new Cookie("username",null);
        username.setMaxAge(0);
        Cookie password = new Cookie("password",null);
        password.setMaxAge(0);
        response.addCookie(username);
        response.addCookie(password);
        return "redirect:/";
    }
    @RequestMapping(method=RequestMethod.POST,value="/register")
    @ResponseBody
    public LibResult register(Reader reader,HttpServletResponse response,HttpServletRequest request){
        LibResult result = readerService.register(reader);
        if(result.getStatus()==200){
            response.addCookie(new Cookie("username",reader.getUsername()));
            response.addCookie(new Cookie("password",reader.getPassword()));
            request.getSession().setAttribute("reader",reader.getUsername());
        }
        return result;
    }


    @RequestMapping(method=RequestMethod.GET,value = "/personal")
    public String personal(){
        return "personal";
    }

    @RequestMapping(method=RequestMethod.GET,value="/personal-info-jsp")
    public String personalInfo(){
        return "fragment/personal-info";
    }

    @RequestMapping(method=RequestMethod.POST,value="/personal-info")
    @ResponseBody
    public Reader getReader(HttpSession session){
        String username = (String) session.getAttribute("username");
        return readerService.queryReaderByUsername(username);

    }

    @RequestMapping(method=RequestMethod.POST,value="/updatePersonalInfo")
    @ResponseBody
    public LibResult updatePersonalInfo(Reader reader){
       return  readerService.updatePersonInfo(reader);
    }
}
