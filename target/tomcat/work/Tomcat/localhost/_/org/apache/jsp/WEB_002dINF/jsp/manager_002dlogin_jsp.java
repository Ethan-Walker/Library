/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2017-10-11 06:30:57 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class manager_002dlogin_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/>\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("    <title>图书馆管理人员登录界面</title>\r\n");
      out.write("    <link href=\"../css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("    <script src=\"../js/jquery.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <style type=\"text/css\">\r\n");
      out.write("        html, body {\r\n");
      out.write("            height: 100%;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .box {\r\n");
      out.write("            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#6699FF', endColorstr='#6699FF'); /*  IE */\r\n");
      out.write("            background-image: linear-gradient(bottom, #6699FF 0%, #6699FF 100%);\r\n");
      out.write("            background-image: -o-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);\r\n");
      out.write("            background-image: -moz-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);\r\n");
      out.write("            background-image: -webkit-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);\r\n");
      out.write("            background-image: -ms-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);\r\n");
      out.write("\r\n");
      out.write("            margin: 0 auto;\r\n");
      out.write("            position: relative;\r\n");
      out.write("            width: 100%;\r\n");
      out.write("            height: 100%;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .login-box {\r\n");
      out.write("            width: 100%;\r\n");
      out.write("            max-width: 400px;\r\n");
      out.write("            height: 400px;\r\n");
      out.write("            position: absolute;\r\n");
      out.write("            top: 50%;\r\n");
      out.write("\r\n");
      out.write("            margin-top: -200px;\r\n");
      out.write("            /*设置负值，为要定位子盒子的一半高度*/\r\n");
      out.write("\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        @media screen and (min-width: 400px) {\r\n");
      out.write("            .login-box {\r\n");
      out.write("                left: 50%;\r\n");
      out.write("                /*设置负值，为要定位子盒子的一半宽度*/\r\n");
      out.write("                margin-left: -200px;\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .form {\r\n");
      out.write("            width: 100%;\r\n");
      out.write("            max-width: 400px;\r\n");
      out.write("            height: 275px;\r\n");
      out.write("            margin: 25px auto 0px auto;\r\n");
      out.write("            padding-top: 25px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .login-content {\r\n");
      out.write("            height: 300px;\r\n");
      out.write("            width: 100%;\r\n");
      out.write("            max-width: 400px;\r\n");
      out.write("            background-color: rgba(255, 250, 2550, .6);\r\n");
      out.write("            float: left;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .input-group {\r\n");
      out.write("            margin: 0px 0px 30px 0px !important;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .form-control,\r\n");
      out.write("        .input-group {\r\n");
      out.write("            height: 40px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .form-group {\r\n");
      out.write("            margin-bottom: 0px !important;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .login-title {\r\n");
      out.write("            padding: 20px 10px;\r\n");
      out.write("            background-color: rgba(0, 0, 0, .6);\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .login-title h1 {\r\n");
      out.write("            margin-top: 10px !important;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .login-title small {\r\n");
      out.write("            color: #fff;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .link p {\r\n");
      out.write("            line-height: 20px;\r\n");
      out.write("            margin-top: 30px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .btn-sm {\r\n");
      out.write("            padding: 8px 24px !important;\r\n");
      out.write("            font-size: 16px !important;\r\n");
      out.write("        }\r\n");
      out.write("    </style>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("<div class=\"box\">\r\n");
      out.write("    <div class=\"login-box\">\r\n");
      out.write("        <div class=\"login-title text-center\">\r\n");
      out.write("            <h1>\r\n");
      out.write("                <small>图书馆管理人员登录</small>\r\n");
      out.write("            </h1>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"login-content \">\r\n");
      out.write("            <div class=\"form\">\r\n");
      out.write("                <form id=\"manager-form\">\r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <div class=\"col-xs-12  \">\r\n");
      out.write("                            <div class=\"input-group\">\r\n");
      out.write("                                <span class=\"input-group-addon\"><span class=\"glyphicon glyphicon-user\"></span></span>\r\n");
      out.write("                                <input type=\"text\" id=\"username\" name=\"username\" class=\"form-control\" placeholder=\"用户名\">\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <div class=\"col-xs-12  \">\r\n");
      out.write("                            <div class=\"input-group\">\r\n");
      out.write("                                <span class=\"input-group-addon\"><i class=\"glyphicon glyphicon-lock\"></i></span>\r\n");
      out.write("                                <input type=\"password\" id=\"password\" name=\"password\" class=\"form-control\"\r\n");
      out.write("                                       placeholder=\"密码\">\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <div class=\"msg\" style=\"margin-top:-10px; margin-bottom: 10px;text-align: center;font-size:18px;opacity:0;\">哈哈 </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"form-group form-actions\">\r\n");
      out.write("                        <div class=\"col-xs-4 col-xs-offset-4 \">\r\n");
      out.write("                            <input type=\"button\" class=\"btn btn-sm btn-info\" value=\"登录\" onclick=\"managerLogin()\"/>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                </form>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("    function managerLogin() {\r\n");
      out.write("        $(\".msg\").css(\"opacity\",\"0\"); // 隐藏错误信息\r\n");
      out.write("        $.post(\"/manager/login\", $('#manager-form').serialize(), function (data) {\r\n");
      out.write("            if (data.status == 200) {\r\n");
      out.write("                $(\".msg\").css(\"opacity\",\"1\");\r\n");
      out.write("                $(\".msg\").html(\"登陆成功,正在跳转...\");\r\n");
      out.write("                setTimeout(function(){\r\n");
      out.write("                    window.location.href = \"/manager\";\r\n");
      out.write("                },1000);\r\n");
      out.write("            } else {\r\n");
      out.write("                $(\".msg\").css(\"opacity\",\"1\");\r\n");
      out.write("                $(\".msg\").html(\"用户名或密码错误\");\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
