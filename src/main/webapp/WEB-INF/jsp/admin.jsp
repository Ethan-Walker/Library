<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css" media="screen" type="text/css"/>
    <link href="common.css" rel="stylesheet">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="js/index.js"></script>
</head>

<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <%--导航条--%>
            <%@include file="modal/nav.jsp" %>

        </div>
    </div>
    <div class="container-fluid">
        <div class="row clearfix">
            <div class="col-md-12" style="height: 40px;">
                <ul class="breadcrumb">
                    <li>
                        <a href="#">Home</a>
                    </li>
                    <li>
                        <a href="#">Library</a>
                    </li>
                    <li class="active">
                        Data
                    </li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="span2  col-xs-12 col-sm-3 col-md-2">
                <ul id="accordion" class="accordion">
                    <li>
                        <div class="link"><i class="glyphicon glyphicon-cutlery"></i>内容管理<i
                                class="fa fa-chevron-down"></i></div>
                        <ul class="submenu">
                            <li><a href="#">公告信息</a></li>
                            <li><a href="#">资源动态</a></li>
                        </ul>
                    </li>
                    <li>
                        <div class="link"><i class="fa fa-globe"></i>人员管理</div>
                    </li>
                    <li>
                        <div class="link"><i class="glyphicon glyphicon-envelope"></i>索引管理</div>
                    </li>
                </ul>
            </div>
            <div class="col-xs-12 col-sm-9 col-md-10">
                <div class="col-xs-12 col-sm-6 col-md-3" style="border:1px solid;">
                    aaaaa
                </div>
                <div class="col-xs-12 col-sm-6 col-md-3" style="border:1px solid;">
                    aaaaa
                </div>
                <div class="col-xs-12 col-sm-6 col-md-3" style="border:1px solid;">
                    aaaaa
                </div>
                <div class="col-xs-12 col-sm-6 col-md-3" style="border:1px solid;">
                    aaaaa
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">this is footer</div>
</div>
</body>

</html>
