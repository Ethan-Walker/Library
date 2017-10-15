<%--
  Created by IntelliJ IDEA.
  User: EthanWalker
  Date: 2017/10/13
  Time: 3:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form id="personalForm" onsubmit="return false;" class="form-horizontal" type="form"
      style="margin: 20px;">
    <div class="form-group">
        <label for="username" class="col-sm-3 control-label">用户名</label>
        <div class="col-sm-9">
            <label id="username" class="control-label"></label>
        </div>
    </div>

    <div class="form-group">
        <label for="schoolNumber" class="col-sm-3 control-label">学工号</label>
        <div class="col-sm-9">
            <label  id="schoolNumber"  class="control-label"></label>
        </div>
    </div>

    <div class="form-group">
        <label for="email" class="col-sm-3 control-label">邮箱</label>
        <div class="col-sm-9">
            <label  id="email"  class="control-label"></label>
        </div>
    </div>

    <div class="form-group">
        <label for="phone" class="col-sm-3 control-label">电话</label>
        <div class="col-sm-9">
            <label  id="phone"  class="control-label"></label>
        </div>
    </div>
    <div class="form-group">
        <span class="col-sm-1 control-label"></span>
        <span class="col-sm-1 control-label"></span>
        <span class="col-sm-1 control-label"></span>
        <button type="button" id="updatePersonal" data-toggle="modal" data-target="#updatePersonalModal"
                class="btn btn-primary  ">
            修改个人资料
        </button>
    </div>

</form>

<script>

    $(function(){
       load();
    });
    function load(){
        $.post("/personal-info?random="+Math.random(),function(data){
            $("#username").html(data.username);
            $("#schoolNumber").html(data.schoolNumber);
            $("#email").html(data.email);
            $("#phone").html(data.phone);
        });
    }
</script>



<!-- 修改个人资料模态框示例（Modal） -->
<form id="personalInfoForm" onsubmit="return false;" class="form-horizontal" type="form"
      style="margin: 20px;">
    <div class="modal fade" id="updatePersonalModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="updatePersonalModalLabel" style="text-align: center;">
                        修改个人资料
                    </h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="id" id="id"/>
                    <div class="form-group">
                        <label for="username_" class="col-sm-3 control-label">用户名</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="username_" name="username"
                                   placeholder="请输入用户名">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="password_" class="col-sm-3 control-label">密码</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="password" id="password_"
                                   placeholder="请输入密码">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="schoolNumber_" class="col-sm-3 control-label">学工号</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="schoolNumber" id="schoolNumber_"
                                   placeholder="请输入学工号">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email_" class="col-sm-3 control-label">邮箱</label>
                        <div class="col-sm-9">
                            <input type="email" class="form-control" name="email" id="email_"
                                   placeholder="请输入邮箱地址">
                            </input>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="phone_" class="col-sm-3 control-label">手机号</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="phone" id="phone_"
                                   placeholder="请输入手机号码">
                            </input>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <span id="tip"> </span>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <a type="submit" class="btn btn-primary" href="javascript:void(0);" onclick="updatePersonalInfo()">
                        提交
                    </a>

                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</form>
<script>
    $("#updatePersonalModal").on("shown.bs.modal",function(){

        $.post("/personal-info?random="+Math.random(),function(data){
            $("#username_").val(data.username);
            $("#schoolNumber_").val(data.schoolNumber);
            $("#email_").val(data.email);
            $("#phone_").val(data.phone);
        });
    });

    function updatePersonalInfo(){
        $.ajax(
            {
                url: "/updatePersonalInfo",
                data: $("#personalInfoForm").serialize(),
                type: "post",
                beforeSend: function () {
                    $("#tip").html("<span style='color:blue'>正在处理...</span>");
                    return true;
                },
                success: function (data) {
                    if (data.status == 200) {
                        $("#tip").html("<span style='color:blue'>修改成功</span>");
                        $("#updatePersonalModal").modal("hide");
                        $("#updatePersonalModal").on("hidden.bs.modal", function () {
                            load();
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
</script>
