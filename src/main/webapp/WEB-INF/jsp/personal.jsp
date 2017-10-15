<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css" media="screen" type="text/css"/>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/index.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <%--bootstrap -table --%>
    <script src="https://cdn.bootcss.com/bootstrap-table/1.11.0/extensions/export/bootstrap-table-export.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.min.js"></script>
    <script>
        $(function () {
            $(".index-link").trigger("click");
            $("#personal-info").trigger("click");
        })
    </script>
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
                        <div class="index-link">
                            <i class="glyphicon glyphicon-user"></i>个人中心<i class="fa fa-chevron-down"></i>
                        </div>
                        <ul class="submenu">
                            <li><a href="javascript:void(0);" id="personal-info">个人资料</a></li>
                            <li><a href="#">借阅历史</a></li>
                            <li><a href="#">待还书籍</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="col-xs-12 col-sm-9 col-md-10" id="content">

            </div>
        </div>
    </div>
</div>
<script>
    $("#personal-info").click(function () {
        $.get("/personal-info-jsp", {}, function (data) {
            $("#content").html(data);
        });

    })
</script>


</body>

</html>
