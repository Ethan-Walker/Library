package cn.library.common.interceptor;

import cn.library.common.pojo.LibResult;
import cn.library.mapper.ReaderMapper;
import cn.library.pojo.Admin;
import cn.library.pojo.Reader;
import cn.library.service.AdminService;
import cn.library.service.ManagerService;
import cn.library.service.ReaderService;
import cn.library.utils.CookieUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.zip.ZipEntry;

/**
 * Created by EthanWalker on 2017/10/10.
 */
public class AutoLoginInterceptor implements HandlerInterceptor {

    @Autowired
    private ReaderService readerService;

    @Autowired
    private AdminService adminService;

    @Autowired
    private ManagerService managerService;

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        HttpSession session = httpServletRequest.getSession();
        String username_ = CookieUtils.getCookieValue(httpServletRequest, "username");
        String password_ = CookieUtils.getCookieValue(httpServletRequest, "password");
        String path = httpServletRequest.getRequestURI();
        LibResult result = null;
        if (path.indexOf("admin") != -1) {
            Object admin = session.getAttribute("admin");
            if(admin!=null&&!"".equals(admin.toString())){
                return true;
            }
            if (username_ != null && password_ != null) {
                result = adminService.login(username_, password_);
            }
            // 不对登录界面进行重定向
            if (path.indexOf("admin/login") == -1 && (result == null || result.getStatus() != 200)) {
                httpServletResponse.sendRedirect("/admin/login");
                return false;
            }
        } else if (path.indexOf("manager") != -1) {
            Object manager = session.getAttribute("manager");
            if(manager!=null&&!"".equals(manager.toString())){
                return true;
            }
            if (username_ != null && password_ != null) {
                result = managerService.login(username_, password_);
            }
            // 不对登录界面进行重定向
            if (path.indexOf("manager/login") == -1 && (result == null || result.getStatus() != 200)) {
                httpServletResponse.sendRedirect("/manager/login");
                return false;
            }
        } else {
            Object user = session.getAttribute("reader");
            if(user!=null&&"".equals(user.toString())){
                return true;
            }
            if (username_ != null && password_ != null) {
                Reader reader = new Reader();
                reader.setUsername(username_);
                reader.setPassword(password_);
                result = readerService.login(reader);
            }
            // 登录失败， 且访问的是私人资料，重定向到未登录提示页面
            if ((result == null || result.getStatus() != 200) && path.indexOf("personal") != -1) {
                httpServletRequest.getRequestDispatcher("/no-login").forward(httpServletRequest, httpServletResponse);
                return false;
            }
        }
        if (result != null && result.getStatus() == 200) {
            session.setAttribute("username", username_);
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
