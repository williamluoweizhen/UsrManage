<%@ page language="java" contentType="text/html; charset=UTF-8"
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
		<title>login</title>

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
												Please login
											</h4>

											<div class="space-6"></div>

											<form>
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" placeholder="Username" id="u_name1" />
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="Password" id="u_password1" />
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>
													
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" style="width:200px;float:left" placeholder="VerificationCode" id="u_verificationCode1" />
														
															<!-- <i class="ace-icon fa fa-retweet"></i> -->
															<img name="imgcode" style="float:right" src="codes.jsp" onclick="refresh()">
														</span>
													</label>

													<div class="space"></div>

													<div class="clearfix">

														<button type="button" class="width-35 pull-right btn btn-sm btn-primary" onclick="check()">
															<i class="ace-icon fa fa-key"></i>
															<span class="bigger-110">Login</span>
														</button>
													</div>

													<div class="space-4"></div>
												</fieldset>
											</form>

											
										</div><!-- /.widget-main -->

										<div class="toolbar clearfix">
											<div>
											</div>

											<div>
												<a href="#" data-target="#signup-box" class="user-signup-link">
												    Register
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
												Password retrieval
											</h4>

										</div><!-- /.widget-main -->

										<div class="toolbar center">
											<a href="#" data-target="#login-box" class="back-to-login-link">
												Return login
												<i class="ace-icon fa fa-arrow-right"></i>
											</a>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.forgot-box -->

								<div id="signup-box" class="signup-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header green lighter bigger">
												<i class="ace-icon fa fa-users blue"></i>
												Register
											</h4>

											<div class="space-6"></div>
											<p>Input your information:</p>

											<form>
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" placeholder="Username" id="register_name"/>
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="Password" id="register_password"/>
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>

												    <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" placeholder="Telephone" id="register_phone"/>
															<i class="ace-icon fa fa-retweet"></i>
														</span>
													</label>
													
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control" placeholder="Email" id="register_email"/>
															<i class="ace-icon fa fa-envelope"></i>
														</span>
													</label>
													
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input name="u_sex"  type="radio"  value="male"  id="register_sex"/>male&nbsp;
             												<input name="u_sex"  type="radio"  value="female" id="register_sex"/>female
														</span>
													</label>

													<div class="space-24"></div>

													<div class="clearfix">
														<button type="reset" class="width-30 pull-left btn btn-sm">
															<i class="ace-icon fa fa-refresh"></i>
															<span class="bigger-110">Reset</span>
														</button>

														<button type="button" class="width-65 pull-right btn btn-sm btn-success" onclick="RegisterCheck()">
															<span class="bigger-110">Register</span>

															<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
														</button>
													</div>
												</fieldset>
											</form>
										</div>

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
			function check() {
				var username = document.getElementById("u_name1").value;  
				var password = document.getElementById("u_password1").value; 
				var verificationCode = document.getElementById("u_verificationCode1").value; 
				$.ajax({
			        type: 'post',
			        url: "<%=basePath %>LoginServlet",
			        data: {
			        	username:username,
			        	password:password,
			        	verificationCode:verificationCode,
			        },
			        success: function(msg){
			        	if(msg == "-1"){
			        		alert("Username or password error!");
			        	}else if(msg == "-2"){
			        		alert("VerificationCode error");
			        	}else{
			        		//alert(username +": Hello world");
			        		window.location.href="<%=basePath%>front/editpwd.jsp";
			        	}
			    		
					},
					error: function(XMLHttpRequest, textStatus, errorThrown) {
			        },
					});
			}
			function RegisterCheck(){
				var username = document.getElementById("register_name").value;
				var password = document.getElementById("register_password").value;
				var phone = document.getElementById("register_phone").value;
				var email = document.getElementById("register_email").value;
				var sex = $('input:radio[name="u_sex"]:checked').val();
				//用户名格式：限16个字符，支持中英文、数字、减号或下划线
			    var regName = /^[\u4e00-\u9fff\w]{1,16}$/;
				//邮箱格式 可以包含 web.blue@jb51.net,再严格点那么最后的顶级域至少要2个字母，最大以域名“name”为准，那么最大就是4，宽松点就设为5.
			    var regMail = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
			    // 以1开头11位数
				var regMobile = /^1[0-9]{10}$/;
				if(username=="")  
			    {  
			        alert("Username cannot be empty");  
			        return false;
			    }
				else if(!regName.test(username))
				{
					alert("Username contains illegal characters or username length is greater than 16");
					return false;
				}
				else if(password.length<6)  
			    {  
			        alert("Password length must be equal to or greater than 6");  
			        return false;
			    }
			    else if(!regMobile.test(phone))
			    {  
			        alert("The phone format is incorrect");  
			        return false;
			    }
			    else if(!regMail.test(email))
			    {  
			        alert("The mail format is incorrect");  
			        return false;
			    }
				
			    else if(sex==null)  
			    {  
			        alert("Sex cannot be empty");  
			        return false;
			    }
				$.ajax({
			        type: 'post',
			        url: "<%=basePath %>RegisterServlet",
			        data: {
			        	username:username,
			        	password:password,
			        	phone:phone,
			        	email:email,
			        	sex:sex,
			        },
			        success: function(msg){
			        	if(msg == "-1"){
			        		alert("The username is already exits");
			        	}
			        	else{
			        		alert("Register successfully!Now to login!");
			        		location.reload();
			        	}
			    		
					},
					error: function(XMLHttpRequest, textStatus, errorThrown) {
			        },
					});
			}
		</script>
	</body>
</html>
