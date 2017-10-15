<%--
  Created by IntelliJ IDEA.
  User: EthanWalker
  Date: 2017/10/11
  Time: 12:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-default" role="navigation">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse"
                data-target="#bs-example-navbar-collapse-1"><span
                class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
                class="icon-bar"></span><span class="icon-bar"></span></button>
        <a class="navbar-brand" href="#">西工大图书馆信息中心</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav navbar-right">
            <c:if test="${empty sessionScope.username}">
                <li>
                    <a class="btn" href="/manager/login">登录</a>
                </li>
            </c:if>
            <c:if test="${!empty sessionScope.username}">
                <li>
                    <a class="btn" href="/manager/logout">退出登录</a>
                </li>
            </c:if>
        </ul>
    </div>
</nav>
