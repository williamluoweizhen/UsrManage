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
<title>Add User</title>
<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>css/select.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>js/my.js"></script>
<script type="text/javascript" src="<%=basePath%>kindeditor/kindeditor-min.js" charset="UTF-8"></script>
<script type='text/javascript' src='/UsrManager/dwr/interface/UserDao.js'></script>
<script type='text/javascript' src='/UsrManager/dwr/engine.js'></script>
<script type='text/javascript' src='/UsrManager/dwr/util.js'></script>
<script language="javascript">
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
    else if(publishform.u_name.value!="")
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
</head>
<body>
	<div class="place">
       <span>Position:</span>
       <ul class="placeul">
          <li><a href="#">User management</a></li>
          <li><a href="#">Add User</a></li>
       </ul>
    </div>
    
    <div class="formtext">Hi,Welcome to use the function of adding user!</div>
   	 	<form name="publishform" action="<%=basePath%>publishUserServlet" onsubmit="return validate_publish_info(this);" method="post">
        	<ul class="forminfo">     
             <li>
                	<label>Username<b>*</b></label>
                	<input class="dfinput" name="u_name" type="text"  placeholder="Please fill in your name" style="width:518px;"/>
               </li>
               <li>
                	<label>Password<b>*</b></label>
                	<input class="dfinput" name="u_password" type="password"  placeholder="Please fill in your password" style="width:518px;"/>
               </li>
               <li>
                    <label>Sex<b>*</b></label>
             		<input name="u_sex"  type="radio"  value="male"  />Male&nbsp;
             		<input name="u_sex"  type="radio"  value="female" />Female
               </li>
               <li>
                	<label>Telephone<b>*</b></label>
                	<input class="dfinput" name="u_phone" type="text"  placeholder="Please fill in your phone number" style="width:518px;"/>
               </li>
               <li>
                	<label>Email<b>*</b></label>
                	<input class="dfinput" name="u_email" type="text"  placeholder="Please fill in your email" style="width:518px;"/>
               </li>
      			<li><label>&nbsp;</label><input name="Submit" type="submit" value="Submit" class="loginbtn"/></li>
            </ul>
      	</form>
    
</body>
</html>