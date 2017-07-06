<%@ page language="java" import="cn.edu.xmu.entity.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>js/my.js"></script>
<script type="text/javascript" src="<%=basePath%>kindeditor/kindeditor-min.js" charset="UTF-8"></script>
<script type='text/javascript' src='/UsrManager/dwr/interface/UserDao.js'></script>
<script type='text/javascript' src='/UsrManager/dwr/engine.js'></script>
<script type='text/javascript' src='/UsrManager/dwr/util.js'></script>


</head>
<body>
	<div class="place">
       <span>Position:</span>
       <ul class="placeul">
          <li><a href="#">User management</a></li>
          <li><a href="#">Edit User</a></li>
       </ul>
    </div>
    
    <div class="formtext">Hi,Welcome to use the function of editing user!</div>
   	 	<form name="publishform" action="<%=basePath%>updateUserServlet" onsubmit="return validate_publish_info(this);" method="post">
        	<ul class="forminfo">     
             <li>
                	<label>Username<b>*</b></label>
                	<input class="dfinput" id="u_name" name="u_name" type="text"  placeholder="Please fill in your name" style="width:518px;"/>
                    <input type="hidden" id="u_id" name="u_id"/>
               </li>
               <li>
                	<label>Password<b>*</b></label>
                	<input class="dfinput" id="u_password" name="u_password" type="password"  placeholder="Please fill in your password" style="width:518px;"/>
               </li>
               <li>
                    <label>Sex<b>*</b></label>
             		<input name="u_sex"  type="radio"  value="male"  />Male&nbsp;
             		<input name="u_sex"  type="radio"  value="female" />Female
               </li>
               <li>
                	<label>Telephone<b>*</b></label>
                	<input class="dfinput" id="u_phone" name="u_phone" type="text"  placeholder="Please fill in your phone number" style="width:518px;"/>
               </li>
               <li>
                	<label>Email<b>*</b></label>
                	<input class="dfinput" id="u_mail" name="u_email" type="text"  placeholder="Please fill in your email" style="width:518px;"/>
               </li>
      			<li><input name="Submit" type="submit" value="Submit" class="loginbtn" />
      			<label>&nbsp;</label><input onClick="window.location.href='getalluser.jsp'" type="button" value="Cancel" class="loginbtn"/></li>
            </ul>
      	</form>
    
</body>
<script type="text/javascript">
var uservalue;
function GetRequest() {
	   var url = location.search; //获取url中"?"符后的字串
	   var theRequest = new Object();
	   if (url.indexOf("?") != -1) {
	      var str = url.substr(1);
	      strs = str.split("&");
	      for(var i = 0; i < strs.length; i ++) {
	         theRequest[strs[i].split("=")[0]]=(strs[i].split("=")[1]);
	      }
	   }
	   return theRequest;
	}
	function getuserinfo(){
		var Request = new Object();
		Request = GetRequest();
		var id = Request['userid'];
		UserDao.getUserRecordById(id,function callback(data){
			var id = data.id;
			uservalue = data.username;
			var password = data.password;
			var phone = data.phone;
			var email = data.email;
			var sex = data.sex;
			$("#u_id").val(id);
			$("#u_name").val(uservalue);
			$("#u_password").val(password);
			$("#u_phone").val(phone);
			$("#u_mail").val(email);
			if(sex == "male")
				$("input[name='u_sex']").get(0).checked=true; 
			else
				$("input[name='u_sex']").get(1).checked=true; 
		});
	}
	getuserinfo();
	
	//注册有效性验证
	function validate_publish_info(publishform) 
	{  
		//用户名格式：限16个字符，支持中英文、数字、减号或下划线
	    var regName = /^[\u4e00-\u9fff\w]{1,16}$/;
		//邮箱格式 可以包含 web.blue@jb51.net,再严格点那么最后的顶级域至少要2个字母，最大以域名“name”为准，那么最大就是4，宽松点就设为5.
	    var regMail = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
	    // 以1开头11位数
		var regMobile = /^1[0-9]{10}$/;
		var flag = false;
		if(publishform.u_name.value=="")  
	    {  
	        alert("Username cannot be empty");  
	        return false;
	    }
		else if(!regName.test(publishform.u_name.value))
		{
			alert("Username contains illegal characters or username length is greater than 16");
			return false;
		}
	    else if(publishform.u_password.value.length<6)  
	    {  
	        alert("Password length must be equal to or greater than 6");  
	        return false;
	    }
	    else if(publishform.u_sex.value=="")  
	    {  
	        alert("Sex cannot be empty");  
	        return false;
	    }
	    else if(!regMobile.test(publishform.u_phone.value))
	    {  
	        alert("The phone format is incorrect");  
	        return false;
	    }
	    else if(!regMail.test(publishform.u_email.value))
	    {  
	        alert("The mail format is incorrect");  
	        return false;
	    }
	    else if(publishform.u_name.value!= uservalue &&publishform.u_name.value!="")
		{
			DWREngine.setAsync(false);
			UserDao.HaveUsername(publishform.u_name.value,function callback(data){
				if(data==1){
					alert("Username is already exits");
					flag = false;
				}else
					flag = true;
			});
			return flag;
		}
	    return true;  
	}
	</script>
</html>