<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>

    <!-- Basic Page Needs
  ================================================== -->
    <meta charset="utf-8">
    <title>Login</title>
    <link href="<%=basePath%>css/front.css" rel="stylesheet" type="text/css" />
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Mobile Specific Metas
  ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS
  ================================================== -->

    <!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

</head>
<body>
    <div class="container">
        <div class="flat-form">
            <ul class="tabs">
                <li>
                    <a href="#login" class="active">Login</a>
                </li>
                <li>
                    <a href="#register">Register</a>
                </li>
            </ul>

            <div id="login" class="form-action show">
                <h1>Please Login</h1>
                <p>
                    After logging in, you will see a more wonderful world.
                </p>
                <form action="<%=basePath%>LoginServlet" method="post">
                    <ul>
                        <li>
                            <input name="u_name" type="text" placeholder="Username" id="u_name" />
                        </li>
                        <li>
                            <input name="u_password" type="password" placeholder="Password" id="u_password" />
                        </li>
                        <li>
                            <input name="u_verificationCode" type="text" style="width:360px" id="u_verificationCode" placeholder="Verification Code">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img  name="imgcode" src="codes.jsp" onclick="refresh()" style="height:30px;">
                            
                        </li>
                        <li>
                            <input type="submit"  value="Login" class="button" />
                        </li>
                    </ul>
                </form>
            </div>
            <!--/#login.form-action-->
            <div id="register" class="form-action hide">
                <h1>Register</h1>
                <p>
                    You should totally sign up for our super awesome service.
                </p>
                <form name="registerform" action="<%=basePath%>RegisterServlet" onsubmit="return validate_register_info(this);" method="post">
                    <ul>
                        <li>
                            <input name="u_name" type="text" placeholder="Username" />
                        </li>
                        <li>
                            <input name="u_password" type="password" placeholder="Password" />
                        </li>
                        <li>
                            <input name="u_phone" type="text" placeholder="Phone number" />
                        </li>
                        <li>
                            <input name="u_email" type="text" placeholder="Email" />
                        </li>
                        <li>
             				<input name="u_sex"  type="radio"  value="male"  />male&nbsp;
             				<input name="u_sex"  type="radio"  value="female" />female
                        </li>
                        <li><br></br></li>
                        <li>
                            <input type="submit" value="Sign Up" class="button" />
                        </li>
                    </ul>
                </form>
            </div>
            <!--/#register.form-action-->
            <div id="reset" class="form-action hide">
                <h1>Reset Password</h1>
                <p>
                    To reset your password enter your old and new password.
                </p>
                <form name="resetform" action="<%=basePath%>ModifyServlet" method="post" onsubmit="return validate_reset_info(this);">
                    <ul>
                        <li>
                            <input name="oldpassword" type="password" placeholder="old password" />
                        </li>
                        <li>
                            <input name="newpassword" type="password" placeholder="new password" />
                        </li>
                        <li>
                            <input name="newpasswordagain" type="password" placeholder="confirm new password" />
                        </li>
                        <li>
                            <input type="submit" value="Send" class="button" />
                        </li>
                    </ul>
                </form>
            </div>
            <!--/#register.form-action-->
        </div>
    </div>
    <script class="cssdeck" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
</body>
<script language="javascript">
//注册有效性验证
function validate_register_info(registerform) 
{  
	//用户名格式：限16个字符，支持中英文、数字、减号或下划线
    var regName = /^[\u4e00-\u9fff\w]{1,16}$/;
	//邮箱格式 可以包含 web.blue@jb51.net,再严格点那么最后的顶级域至少要2个字母，最大以域名“name”为准，那么最大就是4，宽松点就设为5.
    var regMail = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
    // 以1开头11位数
	var regMobile = /^1[0-9]{10}$/;
	if(registerform.u_name.value=="")  
    {  
        alert("Username cannot be empty");  
        return false;
    }
	else if(!regName.test(registerform.u_name.value))
	{
		alert("Username contains illegal characters or username length is greater than 16");
		return false;
	}
    else if(registerform.u_password.value.length<6)  
    {  
        alert("Password length must be equal to or greater than 6");  
        return false;
    }
    else if(!regMobile.test(registerform.u_phone.value))
    {  
        alert("The phone format is incorrect");  
        return false;
    }
    else if(!regMail.test(registerform.u_email.value))
    {  
        alert("The mail format is incorrect");  
        return false;
    }
    else if(registerform.u_sex.value=="")  
    {  
        alert("Sex cannot be empty");  
        return false;
    }
    return true;  
} 
//重置密码有效性验证
function validate_reset_info(resetform) 
{  
	if(resetform.newpassword.value!=resetform.newpasswordagain.value)  
    {  
        alert("The password for the two input is different");  
        return false;
    }
    return true;  
} 
(function( $ ) {
	  // constants
	  var SHOW_CLASS = 'show',
	      HIDE_CLASS = 'hide',
	      ACTIVE_CLASS = 'active';
	  
	  $( '.tabs' ).on( 'click', 'li a', function(e){
	    e.preventDefault();
	    var $tab = $( this ),
	         href = $tab.attr( 'href' );
	  
	     $( '.active' ).removeClass( ACTIVE_CLASS );
	     $tab.addClass( ACTIVE_CLASS );
	  
	     $( '.show' )
	        .removeClass( SHOW_CLASS )
	        .addClass( HIDE_CLASS )
	        .hide();
	    
	      $(href)
	        .removeClass( HIDE_CLASS )
	        .addClass( SHOW_CLASS )
	        .hide()
	        .fadeIn( 550 );
	  });
	})( jQuery );  
</script> 
</html>


