<%@ page language="java" import="java.util.*,cn.edu.xmu.entity.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%response.addHeader("P3P","CP=NOI DSP COR NID ADMa OPTa OUR NOR");%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Management</title>
<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
</head>
<body>
  <div class="mainindex">
	    	<div class="welinfo">
		    <span><img src="<%=basePath%>images/sun.png" alt="天气" /></span>
		    <b>Hi,Welcome to management platform!</b><br/>
		    <b>Please click on the right toolbar to enter management.</b>
		    </div>
  </div>
</body>
</html>
