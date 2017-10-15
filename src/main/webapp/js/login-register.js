/*
 *
 * login-register modal
 * Autor: Creative Tim
 * Web-autor: creative.tim
 * Web script: #
 * 
 */
function showRegisterForm(){
    $('.loginBox').fadeOut('fast',function(){
        $('.registerBox').fadeIn('fast');
        $('.login-footer').fadeOut('fast',function(){
            $('.register-footer').fadeIn('fast');
        });
        $('.modal-title').html('注册');
    });
    $('.error').removeClass('alert alert-danger').html('');
       
}
function showLoginForm(){
    $('#loginModal .registerBox').fadeOut('fast',function(){
        $('.loginBox').fadeIn('fast');
        $('.register-footer').fadeOut('fast',function(){
            $('.login-footer').fadeIn('fast');    
        });
        
        $('.modal-title').html('登录');
    });
     $('.error').removeClass('alert alert-danger').html(''); 
}

function openLoginModal(){
    showLoginForm();
    setTimeout(function(){
        $('#loginModal').modal('show');    
    }, 230);
    
}
function openRegisterModal(){
    showRegisterForm();
    setTimeout(function(){
        $('#loginModal').modal('show');    
    }, 230);
    
}

function shakeModal(){
    $('#loginModal .modal-dialog').addClass('shake');

    $('input[type="password"]').val('');
    setTimeout( function(){
        $('#loginModal .modal-dialog').removeClass('shake');
    }, 1000 );
}

function loginAjax(){
       // Remove this comments when moving to server
    $.post( "/login",$("#login").serialize(), function( data ) {
        $(".error").removeClass("alert alert-danger").html("");
            if(data.status ==200){
                $(".success").addClass('alert alert-success').html("<strong>登陆成功,正在跳转至首页...</strong>")
                setTimeout(function(){
                    window.location.replace("/");
                },1000);
            } else {
                $('.error').addClass('alert alert-danger').html("用户名或者密码错误");
                 shakeModal(); 
            }
        });

}

function registerAjax(){
    $(".error").removeClass("alert alert-danger").html("");
    $.post( "/register", $('#register').serialize(), function( data ) {
        if(data.status == 200){
            $(".success").addClass('alert alert-success').html("<strong>注册成功,正在跳转至首页...</strong>")
            setTimeout(function(){
                window.location.replace("/");
            },1000);
        } else {
            shakeModal();
            $('.error').addClass('alert alert-danger').html("注册失败");
        }
    });
}
$(function(){
    $(".alert").alert('close');
});
