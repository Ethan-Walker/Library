<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: EthanWalker
  Date: 2017/10/11
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="row clearfix">
    <%--表格--%>
    <div class="col-md-12 column">
        <div class="row base-margin" id="query">
            <ol class="breadcrumb">
                <li><strong><span style="color: #27a0d7">图书列表</span></strong></li>
            </ol>
            <form class="form-inline" role="form" style="float: left; width: 100%" method="post" id="queryForm">
                <div class="form-group">
                    <label for="bookCatId">分类：</label>
                    <select class="form-control" id="bookCatId" name="bookCatId">
                        <option value="">全部</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="bookName">书名：</label>
                    <input type="text" class="form-control" name="bookName" id="bookName" placeholder="请输入书名">
                </div>

                <%--       <div class="form-group">
                           <label>日期:</label>
                           <input placeholder="开始日期" class="form-control layer-date" id="startDate" name="startDate">
                           <input placeholder="结束日期" class="form-control layer-date" id="endDate" name="endDate">
                       </div>
                       --%>
                <div class="form-group">
                    <button type="button" id="queryBtn" onclick="doQuery();" class="btn btn-primary">查询</button>
                </div>
                <div class="form-group btn-right">
                    <button type="button" class="btn btn-primary" id="addBtn" onclick="openAddBookModal();"
                            data-toggle="modal" data-target="#editModal">添加书籍
                    </button>
                </div>
                <div class="form-group">
                    <button type="button" id="deleteSelect" data-toggle="modal" data-target="#confirmDelete"
                            class="btn btn-primary">
                        删除选中
                    </button>
                </div>
                <div class="form-group">
                    <button type="button" id="editSelect" onclick="editSel();" class="btn btn-primary">编辑选中
                    </button>
                </div>

            </form>
        </div>
        <div class="container" style="margin-top:-30px;">
            <table id="demo-table">
            </table>
        </div>
    </div>

</div>

<%--确认删除模态框--%>
<div class="modal fade" id="confirmDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="confirmDeleteLabel">
                    确认删除?
                </h4>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="deleteSel()">
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


<!-- /.modal -->
<script type="text/javascript">

    $(function () {
        initTable();
        $('#warnModal').modal('hide');
        var tag = 1; // 1 表示 添加书籍，0 表示 编辑书籍
    });
    function openAddBookModal() {

        tag = 1; // 添加书籍
        $("#modalBookCatId").html("");
        getBookCats("modalBookCatId");
    }
    function deleteSel() {
        var selects = $("#demo-table").bootstrapTable("getAllSelections");
        console.log(selects);

        if (selects == null || selects.length == 0) {
            $("#warnModalLabel").html("未选中任何书籍")
            $("#warnModal").modal("show");
            return;
        }

        var ids = "" + selects[0].id;
        for (var i = 1; i < selects.length; i++) {
            ids += ",";
            ids += selects[i].id;
        }
        $.post("/manager/book-manager/deleteBookByIds", {"ids": ids}, function (data) {
            if (data.status == 200) {
                $('#confirmDelete').on('hide.bs.modal', function () {
                    $('#demo-table').bootstrapTable('refresh'); //刷新表格
                });
                $("#confirmDelete").modal("hide");
            }
        })
    }

    function editSel() {

        $("#modalBookCatId").html("");
        getBookCats("modalBookCatId");
        tag = 0; // 编辑书籍
        var selects = $("#demo-table").bootstrapTable("getAllSelections");
        if (selects == null || selects.length == 0) {
            console.log("选中的为空");
            $("#warnModalLabel").html("未选中任何书籍")
            $("#warnModal").modal("show");
            return;
        }
        if (selects.length > 1) {
            console.log("选中超过一本书籍");
            $("#warnModalLabel").html("只能选中一本书籍")
            $("#warnModal").modal("show");
            return;
        }

        $("#editModal").modal("show");
    }
    function doQuery(params) {
        $('#demo-table').bootstrapTable('refresh'); //刷新表格
    }

    function getBookCats(id) {
        $.post("/manager/book-manager/bookCatList?random=" + Math.random(), function (data) {
            var select = $("#" + id);
            if (data != null) {
                for (var i = 0; i < data.length; i++) {
                    select.html(select.html() + "<option value='" + data[i].id + "'>" +
                        data[i].name + "</option>");
                }
            }

        });
    }
    function initTable() {
//        var url = "user.do?method=listUsers&random=" + Math.random();
        var url = "/manager/book-manager/queryBookList?random=" + Math.random();
        getBookCats("bookCatId");
        $('#demo-table').bootstrapTable({
            method: 'POST',
            dataType: 'json',
            contentType: "application/x-www-form-urlencoded",
            cache: false,
            sidePagination: "server", //分页方式：client客户端分页，server服务端分页（*）
            url: url,
            height: $(window).height() - 110,
            width: $(window).width(),
            showColumns: true,
            pagination: true,
            queryParams: queryParams,
            minimumCountColumns: 2,
            pageNumber: 1, //初始化加载第一页，默认第一页
            pageSize: 20, //每页的记录行数（*）
            pageList: [10, 25, 50, 100], //可供选择的每页的行数（*）
            uniqueId: "id", //每一行的唯一标识，一般为主键列
            showExport: true,
            exportDataType: 'all',
            checkbox: true,
            singleSelect: false,
            clickToSelect: true,
            sortName: "createTime",
            sortOrder: "asc",
            responseHandler: responseHandler,
            columns: [{
                checkbox: true
            }, {
                field: '',
                title: '序号',
                formatter: function (value, row, index) {
                    return index + 1;
                }
            },
                {
                    field: 'title',
                    title: '书名',
                    align: 'center',
                    valign: 'middle',
                    sortable: true
                }, {
                    field: 'press',
                    title: '出版社',
                    align: 'center',
                    valign: 'middle',
                }, {
                    field: 'publishYear',
                    title: '出版年份',
                    align: 'center',
                    valign: 'middle',
                    sortable: true
                }, {
                    field: 'bookVersion',
                    title: '版本',
                    align: 'center',
                    valign: 'middle',
                    sortable: true
                }, {
                    field: 'bookPosition',
                    title: '所在位置',
                    align: 'center',
                    valign: 'middle'
                }, {
                    field: 'status',
                    title: '状态',
                    align: 'center',
                    valign: 'left',
                    sortable: true,
                    formatter: function (value, row, index) {
                        if (value == 0) {
                            return "可借";
                        } else {
                            return "借出"
                        }
                    }
                }, {
                    field: 'cid',
                    title: '分类',
                    align: 'center',
                    formatter: function (value, row, index) {
                        if (value == 1) {
                            return "图书";
                        } else if (value == 2) {
                            return "期刊"
                        } else if (value == 3) {
                            return "报纸"
                        } else if (value == 4) {
                            return "论文"
                        } else if (value == 5) {
                            return "古籍"
                        } else if (value == 6) {
                            return "音乐"
                        }
                    }
                },

                {
                    field: 'createTime',
                    title: '创建时间',
                    align: 'center',
                    valign: 'middle',
                    sortable: true,
                    formatter: function (value, row, index) {
                        return new Date(value).format('yyyy-MM-dd hh:mm:s');
                    }
                }
            ]
        })
        ;
    }


    function queryParams(params) {
        var param = {
            bookCatId: $("#bookCatId").val(),
            bookName: $("#bookName").val(),
            limit: this.limit, // 页面大小
            offset: this.offset, // 页码
            pageIndex: this.pageNumber,
            pageSize: this.pageSize
        }
        return param;
    }

    // 用于server 分页，表格数据量太大的话 不想一次查询所有数据，可以使用server分页查询，数据量小的话可以直接把sidePagination: "server"  改为 sidePagination: "client" ，同时去掉responseHandler: responseHandler就可以了，
    function responseHandler(res) {
        if (res) {
            return {
                "rows": res.bookList,
                "total": res.totalCount
            };
        } else {
            return {
                "rows": [],
                "total": 0
            };
        }
    }
</script>


<%--添加书籍--%>

<script>
    $(function () {
        $("#editModal").on("shown.bs.modal", function () {
            if(tag==0){
                var selects = $("#demo-table").bootstrapTable("getAllSelections");
                var select = selects[0];
                $("#title").val(select.title);
                $("#author").val(select.author);
                $("#press").val(select.press);
                $("#publishYear").val(select.publishYear);
                $("#bookVersion").val(select.bookVersion);
                $("#bookPosition").val(select.bookPosition);
                $("#modalBookCatId").val(select.cid);
                $("#id").val(select.id);
            }
        })
    })
    function addOrEdit() {
        if (tag == 1) {
            //添加书籍
            addNewBook();
        } else {
            editBook();
        }
    }
    // 编辑表单
    function editBook(user_id) {

        $.ajax(
            {
                url: "/manager/book-manager/editBook",
                data: $("#modalAddForm").serialize(),
                type: "post",
                beforeSend: function () {
                    $("#tip").html("<span style='color:blue'>正在处理...</span>");
                    return true;
                },
                success: function (data) {
                    if (data.status == 200) {
                        $("#editModal").modal("hide");
                        $("#warnModalLabel").html("修改成功");
                        $("#warnModal").modal("show");
                        $("#warnModal").on("hidden.bs.modal", function () {
                            $('#demo-table').bootstrapTable('refresh'); //刷新表格
                        })
                    }
                    else {
                        $("#tip").html("<span style='color:red'>失败，请重试</span>");
                        //  alert('操作失败');
                    }
                },
                error: function () {
                    alert('请求出错');
                },
                complete: function () {
                    // $('#tips').hide();
                }
            });


        return false;
    }


    // 提交表单
    function addNewBook() {
//        var user_id = $.trim($('#user_id').val());
//        var act = $.trim($('#act').val());

//        if (!user_id) {
//            alert('用户ID不能为空！');
//            return false;
//        }
        // 异步提交数据到action/add_action.php页面
        $.ajax(
            {
                url: "/manager/book-manager/addBook",
                data: $("#modalAddForm").serialize(),
                type: "post",
                beforeSend: function () {
                    $("#tip").html("<span style='color:blue'>正在处理...</span>");
                    return true;
                },
                success: function (data) {
                    if (data.status == 200) {
                        var msg = "添加";
//                        if (act == "edit") msg = "编辑";
                        $("#editModal").modal("hide");
                        $("#warnModalLabel").html("添加成功");
                        $("#warnModal").modal("show");
                        $("#warnModal").on("hidden.bs.modal", function () {
                            $('#demo-table').bootstrapTable('refresh'); //刷新表格
                        })

                    }
                    else {
                        $("#tip").html("<span style='color:red'>失败，请重试</span>");
                    }
                },
                error: function () {
                    alert('请求出错');
                },
                complete: function () {
                    $('#acting_tips').hide();
                }
            });
        console.log("b");
        return false;
    }

    Date.prototype.format = function (fmt) {
        var o = {
            "M+": this.getMonth() + 1,                 //月份
            "d+": this.getDate(),                    //日
            "h+": this.getHours(),                   //小时
            "m+": this.getMinutes(),                 //分
            "s+": this.getSeconds(),                 //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds()             //毫秒
        };
        if (/(y+)/.test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        }
        for (var k in o) {
            if (new RegExp("(" + k + ")").test(fmt)) {
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            }
        }
        return fmt;
    }
</script>

<!-- 添加书籍模态框示例（Modal） -->
<form id="modalAddForm" onsubmit="return false;" class="form-horizontal" type="form"
      style="margin: 20px;">
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="addBookModalLabel" style="text-align: center;">
                        添加书籍
                    </h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="id" id="id"/>
                    <div class="form-group">
                        <label for="title" class="col-sm-3 control-label">书名</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="title" name="title"
                                   placeholder="请输入书名">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="author" class="col-sm-3 control-label">作者</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="author" id="author"
                                   placeholder="请输入作者">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="modalBookCatId" class="col-sm-3 control-label">分类</label>
                        <div class="col-sm-9">
                            <select class="form-control" id="modalBookCatId" name="cid">
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="publishYear" class="col-sm-3 control-label">出版年份</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="publishYear" id="publishYear"
                                   placeholder="请输入出版年份">
                            </input>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="bookVersion" class="col-sm-3 control-label">版本</label>
                        <div class="col-sm-9">
                            <input type="number" class="form-control" name="bookVersion" id="bookVersion"
                                   placeholder="请选择书的版本">
                            </input>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="press" class="col-sm-3 control-label">出版社</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="press" id="press"
                                   placeholder="请输入出版社">
                            </input>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="bookPosition" class="col-sm-3 control-label">位置</label>
                        <div class="col-sm-9">
                                <textarea class="form-control" name="bookPosition" id="bookPosition"
                                          placeholder="请输入该书在图书馆的具体位置">
                                </textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <span id="tip"> </span>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <a type="submit" class="btn btn-primary" href="javascript:void(0);" onclick="addOrEdit();">
                        提交
                    </a>

                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</form>


