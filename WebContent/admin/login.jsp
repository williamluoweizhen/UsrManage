<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%response.addHeader("P3P","CP=NOI DSP COR NID ADMa OPTa OUR NOR"); %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Welcome to management platform</title>
<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="<%=basePath%>js/jquery.js"></script>
<script src="<%=basePath%>js/cloud.js" type="text/javascript"></script>

<script language="javascript"> 
	function check() {
		var username = document.getElementById("u_name1").value;  
		var password = document.getElementById("u_password1").value;  
		$.ajax({
	        type: 'post',
	        url: "<%=basePath %>AdminLoginServlet",
	        data: {
	        	username:username,
	        	password:password,
	        },
	        success: function(msg){
	        	if(msg == "-1"){
	        		alert("Username or password error!");
	        	}else{
	        		window.location.href="<%=basePath%>admin/main.jsp";
	        	}
	    		
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
	
	        },
			});
	}
		$(function(){
	    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
		$(window).resize(function(){  
	    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	    })  
	});  
</script> 

</head>

<body style="background-color:#1c77ac; background-image:url(<%=basePath%>images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">



    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  


<div class="logintop">    
    <span>Welcome to management platform</span>       
    </div>
    <div class="loginbody">    
    <span class="systemlogo"></span> 
    <div class="loginbox">
    <ul>
    <li><input id="u_name1" name="u_name" type="text" class="loginuser" /></li>
    <li><input id="u_password1" name="u_password" type="password" class="loginpwd" /></li>
    <li><input type="button" class="loginbtn" onclick="check()" value="Login"/></li>
    </ul>
    </div>
    </div>    
</body>

</html>
