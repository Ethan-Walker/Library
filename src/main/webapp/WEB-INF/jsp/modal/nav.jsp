<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: EthanWalker
  Date: 2017/10/11
  Time: 1:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-default" role="navigation">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse"
                data-target="#bs-example-navbar-collapse-1"><span
                class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
                class="icon-bar"></span><span class="icon-bar"></span></button>
        <a class="navbar-brand" href="/">西工大图书馆信息中心</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav navbar-right">
            <c:if test="${empty sessionScope.username}">
                <li>
                    <a class="btn big-login" data-toggle="modal" href="javascript:void(0)"
                       onclick="openLoginModal();">登录</a>
                </li>
                <li>
                    <a class="btn big-register" data-toggle="modal" href="javascript:void(0)"
                       onclick="openRegisterModal();">注册</a>
                </li>
            </c:if>
            <c:if test="${!empty sessionScope.username}">
                <li>
                    <a class="btn" href="/logout">退出登录</a>
                </li>
                <li>
                    <a class="btn" href="/personal">个人中心</a>
                </li>
            </c:if>

            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">快速导航<strong
                        class="caret"></strong></a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="#">公告</a>
                    </li>
                    <li>
                        <a href="#">资源动态</a>
                    </li>
                    <li>
                        <a href="#">借阅需知</a>
                    </li>
                    <li>
                        <a href="#">开馆时间</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</nav>