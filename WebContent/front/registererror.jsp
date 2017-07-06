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
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
	                    <a href="#login" class="active">Tips:</a>
	                </li>
	            </ul>
            <div id="login" class="form-action show">
                <p>
                	<h1><%=request.getAttribute("errormsg") %>!</h1>
                	<br/>
                	<input type="button"  onClick="location.href='front/index.jsp'"value="Back" class="button" />
                </p>
            </div>       
        </div>
    </div>
    <script class="cssdeck" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
</body>
</html>


