package cn.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by EthanWalker on 2017/10/10.
 */
@Controller
public class TestHelloController {

    @RequestMapping(method = RequestMethod.GET, value = "/hello")
    public String hello(){
        return "fragment/pianduan";
    }
}
