<%--
  Created by IntelliJ IDEA.
  User: EthanWalker
  Date: 2017/10/11
  Time: 1:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <div class="row" style="margin-top:30px;margin-bottom: 30px;">
        <div class="col-md-2"></div>
        <div class="col-md-6">
            <div class="input-group">
                <div class="col-md-2">
                    <select id="categoryName" class="form-control"
                            style="width:80px;height:50px;font-size: 16px;font-weight: bold;" name="categoryName">
                        <option value="全部">全部</option>
                        <c:forEach items="${bookCatList}" var="cat">
                            <c:choose>
                                <c:when test="${!empty categoryName && cat.name==categoryName}">
                                    <option value="${cat.name}" selected="selected">${cat.name}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${cat.name}" style="font-size:18px;">${cat.name}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-4">
                    <c:choose>
                        <c:when test="${empty query}">
                            <input id="book-search"  type="text" name="query" class="form-control"
                                   style="height: 50px;width: 500px;display: inline-block;">
                        </c:when>
                        <c:otherwise>
                            <input id="book-search"  type="text" name="query" value="${query}" class="form-control"
                                   style="height: 50px;width: 500px;display: inline-block;">
                        </c:otherwise>
                    </c:choose>
                </div>
                <!-- /btn-group -->
            </div>
            <!-- /input-group -->
        </div>
        <div class="col-md-4">
            <button class="btn btn-success"  style="height: 50px;margin-left:30px;width:80px;" onclick="submitForm();">
                搜索
            </button>
        </div>
    </div>

<script>
    function submitForm(){
        var query= $("#book-search").val();
        if(query==undefined||query==null){
            query="";
        }
        var categoryName = $("#categoryName").val().trim();
        var pageIndex =$(".pagination").find("li.active a").html();
        if(pageIndex==undefined||pageIndex==null){
            pageIndex=1;
        }
        var pageSize = $("#pageSize").val();
        if(pageSize==undefined||pageSize==null){
            pageSize=5;
        }
        window.location="/search?query="+query+"&categoryName="+categoryName+"&pageIndex="+pageIndex+"&pageSize="+pageSize;
    }
</script>