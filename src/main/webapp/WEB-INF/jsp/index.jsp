<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>西工大图书馆</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/login-register.css" rel="stylesheet"/>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/login-register.js" type="text/javascript"></script>
</head>

<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <%--导航条--%>
            <%@include file="modal/nav.jsp" %>

        </div>
    </div>
    <%--搜索框--%>
    <%@include file="modal/search.jsp" %>

    <div class="row clearfix" style="margin-bottom:30px;">
        <div class="col-md-12 column">
            <div class="row clearfix">
                <div class="col-md-2 column">
                    <a href="/search?categoryName=图书" > <img alt="140x140" src="img/book_logo.jpg"/></a>
                </div>
                <div class="col-md-2 column">
                    <a href="/search?categoryName=期刊" > <img alt="140x140" src="img/periodical.jpg"/></a>
                </div>
                <div class="col-md-2 column">
                    <a href="/search?categoryName=报纸" ><img alt="140x140" src="img/newspaper.jpg"/></a>
                </div>
                <div class="col-md-2 column">
                    <a href="/search?categoryName=论文" ><img alt="140x140" src="img/paper.jpg"/></a>
                </div>
                <div class="col-md-2 column">
                    <a href="/search?categoryName=古籍" ><img alt="140x140" src="img/ancient.jpg"/></a>
                </div>
                <div class="col-md-2 column">
                    <a href="/search?categoryName=音乐" ><img alt="140x140" src="img/music.jpg"/></a>
                </div>
            </div>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-6 column">
            <div class="list-group">
                <a href="#" class="list-group-item active">
                    <h4 class="list-group-item-heading" style="display: inline-block;font-size:18px">
                        公告
                    </h4>
                </a>
                <a href="#" class="list-group-item">
                    <h4 class="list-group-item-heading">
                        免费域名注册
                    </h4>
                    <p class="list-group-item-text">
                        您将通过网页进行免费域名注册。
                    </p>
                </a>
                <a href="#" class="list-group-item">
                    <h4 class="list-group-item-heading">
                        24*7 支持
                    </h4>
                    <p class="list-group-item-text">
                        我们提供 24*7 支持。
                    </p>
                </a>
            </div>
        </div>
        <div class="col-md-6 column">
            <div class="list-group">
                <a href="#" class="list-group-item active">
                    <h4 class="list-group-item-heading">
                        资源动态
                    </h4>
                </a>
                <a href="#" class="list-group-item">
                    <h4 class="list-group-item-heading">
                        免费域名注册
                    </h4>
                    <p class="list-group-item-text">
                        您将通过网页进行免费域名注册。
                    </p>
                </a>
                <a href="#" class="list-group-item">
                    <h4 class="list-group-item-heading">24*7 支持</h4>
                    <p class="list-group-item-text">我们提供 24*7 支持。</p>
                </a>
            </div>
        </div>
    </div>

    <%@include file="modal/login-reg.jsp" %>
</div>
</body>

</html>
