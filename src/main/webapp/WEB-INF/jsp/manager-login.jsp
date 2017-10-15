<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>图书馆管理人员登录界面</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <script src="../js/jquery.min.js"></script>


    <style type="text/css">
        html, body {
            height: 100%;
        }

        .box {
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#6699FF', endColorstr='#6699FF'); /*  IE */
            background-image: linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
            background-image: -o-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
            background-image: -moz-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
            background-image: -webkit-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
            background-image: -ms-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);

            margin: 0 auto;
            position: relative;
            width: 100%;
            height: 100%;
        }

        .login-box {
            width: 100%;
            max-width: 400px;
            height: 400px;
            position: absolute;
            top: 50%;

            margin-top: -200px;
            /*设置负值，为要定位子盒子的一半高度*/

        }

        @media screen and (min-width: 400px) {
            .login-box {
                left: 50%;
                /*设置负值，为要定位子盒子的一半宽度*/
                margin-left: -200px;
            }
        }

        .form {
            width: 100%;
            max-width: 400px;
            height: 275px;
            margin: 25px auto 0px auto;
            padding-top: 25px;
        }

        .login-content {
            height: 300px;
            width: 100%;
            max-width: 400px;
            background-color: rgba(255, 250, 2550, .6);
            float: left;
        }

        .input-group {
            margin: 0px 0px 30px 0px !important;
        }

        .form-control,
        .input-group {
            height: 40px;
        }

        .form-group {
            margin-bottom: 0px !important;
        }

        .login-title {
            padding: 20px 10px;
            background-color: rgba(0, 0, 0, .6);
        }

        .login-title h1 {
            margin-top: 10px !important;
        }

        .login-title small {
            color: #fff;
        }

        .link p {
            line-height: 20px;
            margin-top: 30px;
        }

        .btn-sm {
            padding: 8px 24px !important;
            font-size: 16px !important;
        }
    </style>

</head>

<body>
<div class="box">
    <div class="login-box">
        <div class="login-title text-center">
            <h1>
                <small>图书馆管理人员登录</small>
            </h1>
        </div>
        <div class="login-content ">
            <div class="form">
                <form id="manager-form">
                    <div class="form-group">
                        <div class="col-xs-12  ">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                <input type="text" id="username" name="username" class="form-control" placeholder="用户名">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12  ">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <input type="password" id="password" name="password" class="form-control"
                                       placeholder="密码">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="msg" style="margin-top:-10px; margin-bottom: 10px;text-align: center;font-size:18px;opacity:0;">哈哈 </div>
                    </div>
                    <div class="form-group form-actions">
                        <div class="col-xs-4 col-xs-offset-4 ">
                            <input type="button" class="btn btn-sm btn-info" value="登录" onclick="managerLogin()"/>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>


<script>
    function managerLogin() {
        $(".msg").css("opacity","0"); // 隐藏错误信息
        $.post("/manager/login", $('#manager-form').serialize(), function (data) {
            if (data.status == 200) {
                $(".msg").css("opacity","1");
                $(".msg").html("登陆成功,正在跳转...");
                setTimeout(function(){
                    window.location.href = "/manager";
                },1000);
            } else {
                $(".msg").css("opacity","1");
                $(".msg").html("用户名或密码错误");
            }
        });
    }

</script>

</body>

</html>
