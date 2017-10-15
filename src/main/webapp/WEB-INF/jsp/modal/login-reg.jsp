<%--
  Created by IntelliJ IDEA.
  User: EthanWalker
  Date: 2017/10/11
  Time: 1:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- 登录、注册弹出框-->
<div class="modal fade login" id="loginModal">
    <div class="modal-dialog login animated">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3 class="modal-title" style="text-align: center;"></h3>
            </div>
            <div class="modal-body">
                <div class="box">
                    <div class="content">
                        <div class="error"></div>
                        <div class="success"></div>
                        <div class="form loginBox">
                            <form id='login' method="post" action="/login" accept-charset="UTF-8">
                                <input id="username" class="form-control" type="text" placeholder="用户名"
                                       name="username">
                                <input id="password" class="form-control" type="password" placeholder="密码"
                                       name="password">
                                <input class="btn btn-default btn-login" type="button" value="登录"
                                       onclick="loginAjax()">
                            </form>
                        </div>
                    </div>
                </div>
                <div class="box">
                    <div class="content registerBox" style="display:none;">
                        <div class="form">
                            <form id="register" method="post" html="{:multipart=>true}" data-remote="true"
                                  action="/register"
                                  accept-charset="UTF-8">
                                <input id="username" class="form-control" type="text" placeholder="用户名"
                                       name="username">
                                <input id="number" class="form-control" type="text" placeholder="学号"
                                       name="schoolNumber"/>
                                <input id="password" class="form-control" type="password" placeholder="密码"
                                       name="password">
                                <input id="password_confirmation" class="form-control" type="password"
                                       placeholder="再次输入密码" name="password_confirmation">
                                <input class="btn btn-default btn-register" type="button" value="注册"
                                       onclick="registerAjax()">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="forgot login-footer">
                        <span>Looking to
                                 <a href="javascript: showRegisterForm();">create an account</a>
                            ?</span>
                </div>
                <div class="forgot register-footer" style="display:none">
                    <span>Already have an account?</span>
                    <a href="javascript: showLoginForm();">Login</a>
                </div>
            </div>
        </div>
    </div>
</div>
