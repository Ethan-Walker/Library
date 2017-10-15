package cn.library.controller;

import cn.library.common.pojo.LibResult;
import cn.library.pojo.BookCategory;
import cn.library.service.BookCatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CachePut;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by EthanWalker on 2017/10/10.
 */
@Controller
public class IndexController {

    @Autowired
    private BookCatService bookCatService;

    @RequestMapping(method = RequestMethod.GET, value = "/")
    public String index(Model model) {
        List<BookCategory> bookCatList =bookCatService.queryAllBookCategoryList();
        model.addAttribute("bookCatList",bookCatList);
        return "index";
    }
    @RequestMapping(method = RequestMethod.GET,value="/no-login")
    public String noLogin(){
        return "no-login";
    }



    @RequestMapping(method=RequestMethod.POST,value="/isLogin")
    @ResponseBody
    public LibResult isLogin(HttpServletRequest request){
        Object username = request.getSession().getAttribute("username");
        if(username==null||username.toString().trim().equals("")){
            return LibResult.build(-1,"尚未登录");
        }else{
            return LibResult.ok();
        }
    }


}
