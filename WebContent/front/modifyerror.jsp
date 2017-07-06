<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="author" content="">

    <!-- Mobile Specific Metas
  ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">


</head>
<body>
    <div class="container">
    	<div class="flat-form">
	    <ul class="tabs">
	                <li>
	                    <a href="#login" class="active">Tips:</a>
	                </li>
	            </ul>
            <div id="login" class="form-action show">
                <p>
                	<h1><%=request.getAttribute("errormsg") %></h1>
                	</br>
                	<input type="button" onClick="location.href='front/modifypassword.jsp'"value="Continue" class="button" />
                </p>
            </div>       
        </div>
    </div>
    <script class="cssdeck" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
</body>
</html>


