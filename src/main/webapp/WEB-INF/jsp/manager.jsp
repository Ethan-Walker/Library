<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css" media="screen" type="text/css"/>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/index.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <%--bootstrap -table --%>
    <script src="https://cdn.bootcss.com/bootstrap-table/1.11.0/extensions/export/bootstrap-table-export.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.min.js"></script>

</head>

<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <%--导航条--%>
            <%@include file="modal/manager-nav.jsp" %>
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
                        <div class="index-link" id="jieyue-manager"><i class="glyphicon glyphicon-user"></i>借阅管理</div>
                    </li>
                    <li>
                        <div class="index-link" id="book-manager"><i class="glyphicon glyphicon-user"></i>图书管理</div>
                    </li>
                    <li>
                        <div class="index-link" id="personal"><i class="glyphicon glyphicon-user"></i>个人资料</div>
                    </li>
                </ul>
            </div>
            <div class="col-xs-12 col-sm-9 col-md-10" id="content">

            </div>
        </div>
    </div>
    <div class="container-fluid">this is footer</div>
</div>
<script>

    $(function(){
        $("#jieyue-manager").click(function () {
            $.get("/hello",function(data){
                console.log(data);
                $("#content").html(data)
            })
        });
        $("#book-manager").click(function(){
            $.post("/manager/book-manager",function(data){
                $("#content").html(data);
            });
        });
    })
</script>
</body>

</html>
