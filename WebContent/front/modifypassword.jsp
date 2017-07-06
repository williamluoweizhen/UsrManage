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
            </ul>
			<div id="reset" class="form-action show">
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

           
            
            
        </div>
    </div>
    <script class="cssdeck" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
</body>
<script language="javascript">
//重置密码有效性验证
function validate_reset_info(resetform) 
{
	if(resetform.newpassword.value.length < 6 || resetform.newpasswordagain.value.length < 6)  
    {  
        alert("Password length must be equal or greater than 6");  
        return false;
    }
	else if(resetform.newpassword.value!=resetform.newpasswordagain.value)  
    {  
        alert("The password for the two input is different");  
        return false;
    }
    return true;  
} 
</script> 
</html>


