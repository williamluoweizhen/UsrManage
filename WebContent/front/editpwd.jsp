<%@ page language="java" import="java.util.*,cn.edu.xmu.entity.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%response.addHeader("P3P","CP=NOI DSP COR NID ADMa OPTa OUR NOR"); %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>Modify Password</title>

		<meta name="description" content="User login page" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="assets/font-awesome/4.2.0/css/font-awesome.min.css" />

		<!-- text fonts -->
		<link rel="stylesheet" href="assets/fonts/fonts.googleapis.com.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="assets/css/ace.min.css" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="assets/css/ace-part2.min.css" />
		<![endif]-->
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

		<!--[if lt IE 9]>
		<script src="assets/js/html5shiv.min.js"></script>
		<script src="assets/js/respond.min.js"></script>
		<![endif]-->
	</head>

	<body class="login-layout light-login" >
		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container">
							<div class="center">
								<h1>
									<i class="ace-icon fa fa-leaf green"></i>
									<span class="red">User</span>
									<span class="grey" id="id-text2">Login</span>
								</h1>
								<h4 class="blue" id="id-company-text">&copy; ChinaNetCenter</h4>
							</div>

							<div class="space-6"></div>

							<div class="position-relative">
								<div id="login-box" class="login-box visible widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger">
												<i class="ace-icon fa fa-coffee green"></i>
												Login successfully
											</h4>

											<div class="space-6"></div>

											<form>
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															 <%User a = (User)session.getAttribute("user");
															 if(a != null && a.getRole().equals("normaluser")) {%>
															 <p><%=((User)session.getAttribute("user")).getUsername() %>: Hello world!</p>
															 <%}else{ 
															        response.sendRedirect("main.jsp");
                                                             }%>
														</span>
													</label>
													<div class="space"></div>
													<div class="clearfix">
													</div>

													<div class="space-4"></div>
												</fieldset>
											</form>

											
										</div><!-- /.widget-main -->

										<div class="toolbar clearfix">
											<div>
												<a href="main.jsp" class="forgot-password-link">
												   <i class="ace-icon fa fa-arrow-left"></i>
												    Return Login
												</a>
											</div>

											<div>
												<a href="#" data-target="#forgot-box" class="forgot-password-link">
													Modify Password
													<i class="ace-icon fa fa-arrow-right"></i>
												</a>
											</div>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.login-box -->

								<div id="forgot-box" class="forgot-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header red lighter bigger">
												<i class="ace-icon fa fa-key"></i>
												Password Reset
											</h4>

											<div class="space-6"></div>

											<form>
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="old password" id="oldpassword1" />
															<i class="ace-icon fa fa-lock"></i>
														</span>
														</br>
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="new password" id="newpassword1" />
															<i class="ace-icon fa fa-lock"></i>
														</span>
														</br>
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="confirm new password" id="newpassword2" />
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>

													<div class="clearfix">
														<button type="button" class="width-35 pull-right btn btn-sm btn-danger" onclick="Modify()">
															<i class="ace-icon fa fa-lightbulb-o"></i>
															<span class="bigger-110">Reset</span>
														</button>
													</div>
												</fieldset>
											</form>
										</div><!-- /.widget-main -->

										<div class="toolbar clearfix">
										    <a href="editpwd.jsp" class="back-to-login-link">
												<i class="ace-icon fa fa-arrow-left">
												Back
												</i>
											</a>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.forgot-box -->

								<div id="signup-box" class="signup-box widget-box no-border">
									<div class="widget-body">
										

										<div class="toolbar center">
											<a href="#" data-target="#login-box" class="back-to-login-link">
												<i class="ace-icon fa fa-arrow-left"></i>
												Return login
											</a>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.signup-box -->
							</div><!-- /.position-relative -->
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script src="assets/js/jquery.2.1.1.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script src="assets/js/jquery.1.11.1.min.js"></script>
<![endif]-->

		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='assets/js/jquery.min.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='assets/js/jquery1x.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			jQuery(function($) {
			 $(document).on('click', '.toolbar a[data-target]', function(e) {
				e.preventDefault();
				var target = $(this).data('target');
				$('.widget-box.visible').removeClass('visible');//hide others
				$(target).addClass('visible');//show target
			 });
			});	
			function Modify() {
				var oldpassword = document.getElementById("oldpassword1").value;  
				var newpassword = document.getElementById("newpassword1").value; 
				var newpassword2 = document.getElementById("newpassword2").value; 
				if(newpassword.length < 6 || newpassword2.length < 6)  
			    {  
			        alert("Password length must be equal or greater than 6");  
			        return false;
			    }
				else if(newpassword!=newpassword2)  
			    {  
			        alert("The password for the two input is different");  
			        return false;
			    }
				$.ajax({
			        type: 'post',
			        url: "<%=basePath %>ModifyServlet",
			        data: {
			        	oldpassword:oldpassword,
			        	newpassword:newpassword,
			        	newpasswordagain:newpassword2,
			        },
			        success: function(msg){
			        	if(msg == "-1"){
			        		alert("oldpassword is error!");
			        	}else if(msg == "1"){
			        		alert("Modify successfully!Now to login!");
			        		window.location.href="<%=basePath%>front/main.jsp";
			        	}
			    		
					},
					error: function(XMLHttpRequest, textStatus, errorThrown) {
			        },
					});
			}
		</script>
	</body>
</html>
