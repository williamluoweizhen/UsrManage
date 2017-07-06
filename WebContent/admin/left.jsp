<%@ page language="java" import="java.util.*,cn.edu.xmu.entity.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Management</title>
<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="<%=basePath%>js/jquery.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	
</script>


</head>

<body style="background:#f0f9fd;">

	<div class="lefttop"><span></span>Management</div>    
    <dl class="leftmenu">                   
    <dd><div class="title"><span></span>User management</div>
    <ul class="menuson">
        <li><cite></cite><a href="<%=basePath%>admin/publishuser.jsp" target="rightFrame">Add User</a><i></i></li>
        <li><cite></cite><a href="<%=basePath%>admin/getalluser.jsp"  target="rightFrame">User List</a><i></i></li>
    </ul>    
    </dd>      
    </dl>
    
</body>
</html>
