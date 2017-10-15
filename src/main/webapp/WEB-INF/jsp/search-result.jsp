<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css" media="screen" type="text/css"/>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.css">
    <link href="css/login-register.css" rel="stylesheet"/>
    <script src="js/jquery.min.js"></script>
    <script src="js/index.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <%--bootstrap -table --%>
    <script src="https://cdn.bootcss.com/bootstrap-table/1.11.0/extensions/export/bootstrap-table-export.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.min.js"></script>
    <script src="js/bootstrap-paginator.js"></script>
    <script src="js/login-register.js" type="text/javascript"></script>


</head>

<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <%--导航条--%>
            <%@include file="modal/nav.jsp" %>
            <%--头部--%>
            <%--<%@include file="modal/header.jsp" %>--%>
        </div>
    </div>
    <%--搜索框--%>
    <%@include file="modal/search.jsp" %>
    <div class="container-fluid">
        <div class="row">
            <div class="span2  col-xs-12 col-sm-3 col-md-2">
                <ul id="accordion" class="accordion">
                    <c:forEach var="bookCat" items="${bookCatList}">
                        <c:choose>
                            <c:when test="${bookCat.name==categoryName}">
                                <li>
                                    <div class="index-link" style="color:red;">
                                        <i class="glyphicon glyphicon-envelope"></i>
                                            ${bookCat.name}
                                    </div>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li>
                                    <div class="index-link"><i class="glyphicon glyphicon-envelope"></i>
                                            ${bookCat.name}
                                    </div>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </ul>

                <script>
                    $(".index-link").click(function () {
//                        var categoryName = $(this).find("input").val();
                        var str = $(this).html();
                        var categoryName = str.substring(str.lastIndexOf(">") + 1).trim();
                        var query = $("#book-search").val();
                        window.location.href = "/search?categoryName=" + categoryName + "&query=" + query;
                    })
                </script>

            </div>

            <div class="col-xs-12 col-sm-9 col-md-10">
                <div class="container col-sm-9  col-md-10">
                    <div class="row clearfix">
                        <div class="column" id="search-content">
                            <div class="row">
                                <c:forEach items="${bookList}" var="book">
                                    <div class="panel panel-info">
                                        <div class="panel-heading">
                                            <h2 class="panel-title" style="font-size:20px;">
                                                    ${book.title}
                                                <span class="book_verst-size:16px;">第${book.book_version}版</span>
                                                <span>&nbsp;&nbsp;&nbsp;</span>
                                                <label style="font-size: 16px;">作者: </label>
                                                <span class="author" style="font-size:16px;">${book.author}</span>
                                                <c:choose>
                                                    <c:when test="${book.status==0}">
                                                        <button class="btn btn-primary" style="float:right;" onclick="subscribe(${book.id});">预约</button>
                                                    </c:when>
                                                    <c:otherwise>
                                                    <span class="status"
                                                          style="float: right;font-size:16px;"> (借出) </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </h2>
                                        </div>
                                        <div class="panel-body">
                                            <div class="col-xs-3">
                                                <label>位置: </label>
                                                <span class="book_position"
                                                      style="font-size:18px;">${book.book_position} </span>
                                            </div>
                                            <div class="col-xs-3">
                                                <label>出版年份: </label>
                                                <span class="publish_year"
                                                      style="font-size:18px;">${book.publish_year}</span>
                                            </div>
                                            <div class="col-xs-3">
                                                <label>出版社: </label>
                                                <span class="press" style="font-size:18px;">${book.press}</span>
                                            </div>
                                            <div class="col-xs-3">
                                                <label>分类: </label>
                                                <span class="category_name"
                                                      style="font-size:18px;">${book.category_name} </span>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="row">
                                <c:if test="${empty totalPages || totalPages==0}">
                                    <h3 style="text-align: center;">未找到相关书籍.</h3>
                                </c:if>
                            </div>
                            <div class="row">

                                <div class="col-md-7" style="text-align: center;font-size:18px;">
                                    一共 ${totalCount} 条数据, 共 <span id="totalPages">${totalPages}</span>页, 每页
                                    <select id="pageSize" name="pageSize" onchange="onPageSizeChange();">
                                        <option value="5">5</option>
                                        <option value="10">10</option>
                                        <option value="20">20</option>
                                        <option value="50">50</option>
                                    </select>
                                    条数据
                                </div>
                                <div class="col-md-5">
                                    <ul class="pagination">

                                        <c:if test="${!empty totalPages && totalPages>0}">
                                            <li><a href="javascript:void(0);" onclick="preInto();">&laquo;</a></li>
                                            <c:if test="${totalPages<=5}">
                                                <c:set var="startPage" value="1"></c:set>
                                                <c:set var="endPage" value="${totalPages}"></c:set>
                                            </c:if>
                                            <c:if test="${totalPages>5}">
                                                <c:choose>
                                                    <c:when test="${pageIndex<=3}">
                                                        <c:set var="startPage" value="1"></c:set>
                                                        <c:set var="endPage" value="5"></c:set>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:choose>
                                                            <c:when test="${totalPages-pageIndex<=3}">
                                                                <c:set var="startPage" value="${totalPages-4}"></c:set>
                                                                <c:set var="endPage" value="${totalPages}"></c:set>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:set var="startPage" value="${pageIndex-2}"></c:set>
                                                                <c:set var="endPage" value="${pageIndex+2}"></c:set>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:if>

                                            <c:forEach begin="${startPage}" end="${endPage}" varStatus="num">
                                                <c:if test="${pageIndex==num.index}">
                                                    <li class="active">
                                                        <a href="javascript:void(0);"
                                                           onclick="flyInto(${num.index})">${num.index}</a>
                                                    </li>
                                                </c:if>
                                                <c:if test="${pageIndex!=num.index}">
                                                    <li><a href="javascript:void(0);"
                                                           onclick="flyInto(${num.index})">${num.index}</a></li>
                                                </c:if>
                                            </c:forEach>
                                            <li><a href="javascript:void(0);" onclick="nextInto();">&raquo;</a></li>
                                        </c:if>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        var pageSize = ${pageSize};
        if (pageSize != null) {
            $("#pageSize").val(pageSize);
        }
    })
    function sendReq(pageIndex){
        var query = $("#book-search").val().trim();
        var categoryName = $("#categoryName").val().trim();
        var pageSize = $("#pageSize").val().trim();
        window.location = "/search?query=" + query + "&categoryName=" + categoryName + "&pageIndex=" + pageIndex + "&pageSize=" + pageSize;
    }
    function onPageSizeChange(){
        var pageIndex = 1;
        sendReq(pageIndex);
    }
    function preInto() {
        var pageIndex = $(".pagination").find("li.active a").html().trim();
        if (pageIndex == 1) {
            return;
        } else {
            pageIndex =parseInt( pageIndex) - 1;
            sendReq(pageIndex);
        }

    }
    function nextInto() {
        var pageIndex = $(".pagination").find("li.active a").html().trim();
        var totalPages = $("#totalPages").html().trim();

        if (pageIndex == totalPages) {
            return;
        } else {
            pageIndex = parseInt(pageIndex )+ 1;
           sendReq(pageIndex);
        }

    }
    function flyInto(pageIndex) {
       sendReq(pageIndex);
    }

    function subscribe(bookId){
        //验证是否登录
        $.post("/isLogin",function(data){
            if(data.status==200){
                $("#confirmSubscribe").modal("show");
            }else{
                $("#warnModalLabel").html("请先登录再预约");
                $("#warnModal").modal("show");
            }
        });
        $("#confirmSubscribe").on("shown.bs.modal",function(){
            $("#bookId").val(bookId);
        })
    }

    function confirmSubscribe(){
        var bookId = $("#bookId").val();
        console.log(bookId);
        $.post("/bookSubscribe",{"bookId":bookId},function(data){
            if(data.status==200){
                $("#confirmSubscribe").modal("hide");
                $("#warnModalLabel").html("预定成功");
                $("#warnModal").modal("show");
            }
        })

    }

</script>
<%@include file="modal/login-reg.jsp" %>

<%--确认预约模态框--%>
<div class="modal fade" id="confirmSubscribe" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="confirmSubscribeLabel">
                    确认预约?
                </h4>
                <input type="hidden" id="bookId" />
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="confirmSubscribe()">
                    确认
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- 提示模态框（Modal） -->
<div class="modal fade" id="warnModal" tabindex="-1" role="dialog" aria-labelledby="warnModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="warnModalLabel">
                    请先登录再预约
                </h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    关闭
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

</body>


</html>


<%--



   <div class="panel panel-info">
                                <div class="panel-heading">
                                    <h2 class="panel-title" style="font-size:20px;">
                                        Java编程思想
                                        <span id="book_version" style="font-size:16px;">第1版</span>
                                        <span>&nbsp;&nbsp;&nbsp;</span>
                                        <label for="author" style="font-size: 16px;">作者: </label>
                                        <span id="author" style="font-size:16px;">张超</span>
                                        <span class="status">（可借）</span>
                                        <button class="btn btn-primary" style="float:right;">预约</button>
                                    </h2>
                                </div>
                                <div class="panel-body">
                                    <div class="col-xs-3">
                                        <label for="publish_year">出版年份: </label>
                                        <span id="publish_year" style="font-size:18px;">1992</span>
                                    </div>
                                    <div class="col-xs-3">
                                        <label for="press">出版社: </label>
                                        <span id="press" style="font-size:18px;">人民出版社</span>
                                    </div>
                                    <div class="col-xs-3">
                                        <label for="category_name">分类: </label>
                                        <span id="category_name" style="font-size:18px;">图书 </span>
                                    </div>
                                    <div class="col-xs-3">
                                        <label for="book_position">位置: </label>
                                        <span id="book_position" style="font-size:18px;">二楼J21-332 </span>
                                    </div>
                                </div>

                            </div>
--%>