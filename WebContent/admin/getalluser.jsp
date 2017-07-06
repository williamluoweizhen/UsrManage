<%@page import="cn.edu.xmu.table.UserTable"%>
<%@page import="cn.edu.xmu.daoimpl.UserDaoImpl"%>
<%@page import="cn.edu.xmu.dao.UserDao"%>
<%@ page language="java" import="java.util.*,cn.edu.xmu.entity.*,cn.edu.xmu.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User List</title>
<link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".delete").click(function(){
		var id = $(this).attr("id").toString().substring(6);
		$("#ifDelete").show();
		$("#confirmDelete").attr("name",id);
	});
	
	$(".edit").click(function(){
		var id = $(this).attr("id").toString().substring(4);
		window.location.href="updateuser.jsp?userid="+id;
	});
	
	//确认删除
	$("#confirmDelete").click(function(){
		/*删除菜单*/
		var id = $(this).attr("name");
		 $.ajax({
	            type: 'post',
	            url: "<%=basePath %>deleteUsrServlet",
	            data: {
	            	userid:id,
	            },
	            success: function(msg){
	            	if(msg == "1"){
	            		//alert("删除成功");
	            		$("#menuContent"+id).remove();
	            		location.reload();
	            	}
	        		
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
	            },
	 		});
		 $("#ifDelete").hide();
	});
	//取消删除
	$("#cancelDelete").click(function(){
		$("#ifDelete").hide();
	});
});
</script>
</head>
<body>
	<%	
		int pageSize =10;
		UserDao userDao = new UserDaoImpl();
		Map param = new HashMap();
		int rowcount = userDao.getUserCount(param);
		//计算页数
		int pageCount;
		if(rowcount%pageSize!=0){
			if(rowcount<pageSize){
				pageCount = 1;	
			}
			else{
				pageCount = (rowcount/pageSize==0)?(rowcount/pageSize):(rowcount/pageSize+1);	
			}
		}
		else{
			pageCount = (rowcount/pageSize==0)?0:rowcount/pageSize;
		}
		
		String currentPage_s=request.getParameter("currentPage");//reques获取当前页码  
		int currentPage=1;       //初始化为第一页  
		if(currentPage_s!=null){        
		      currentPage=Integer.valueOf(currentPage_s);  
		}  
		if(currentPage<1){  
		      currentPage=1;  
		}  
		if(currentPage>pageCount){  
		      currentPage=pageCount;  
		}  
		if(currentPage!=0)
		{
		int start = (currentPage-1)*pageSize;
		int end = currentPage*pageSize;
		System.out.print("start="+start);
		System.out.print("end="+end);
		//改变当前页的值，调用查询数据的方法，返回数据集合  
		List<User> userList=userDao.findForPage(start, pageSize,UserTable.U_ID,"desc", param);
	%>

	<div class="place">
    <span>Position:</span>
    <ul class="placeul">
    <li><a href="#">User management</a></li>
    <li><a href="#">User List</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th>Username</th>
        <th>Sex</th>
        <th>Telephone</th>
        <th>Email</th>
        <th>Operation</th>
        </tr>
        </thead>
        <tbody>
        
        <%
			if(!userList.isEmpty() && userList.size() > 0){
 			for(User user : userList){
 				int id = user.getId();
 				String name = user.getUsername();
 				String password = user.getPassword();
 				String sex = user.getSex();
 				String phone = user.getPhone();
 				String email = user.getEmail();
 		%>
 		<tr id="menuContent<%=user.getId() %>">
        <td><input class="newsuneditable" id="title<%=user.getId() %>" value="<%=name %>" readonly="readonly"></input></td>
        <td><input class="newsuneditable" id="title<%=user.getId() %>" value="<%=sex %>" readonly="readonly"></input></td>
        <td><input class="newsuneditable" id="title<%=user.getId() %>" value="<%=phone %>" readonly="readonly"></input></td>
        <td><input class="newsuneditable" id="title<%=user.getId() %>" value="<%=email %>" readonly="readonly"></input></td>
        <td class="newseditable">
			<a href="#" class="tablelink delete" id="delete<%=user.getId() %>"> Delete</a>
			<a href="#" class="tablelink edit" id="edit<%=user.getId() %>"> Edit</a>
			</td>
 		</tr> 
 		<%
 			}}}
        %>
        </tbody>
    </table>
    
   
    <div class="pagin">
    	<div class="message"> All <i class="blue"> <%=rowcount %> </i>records!(10 records per page)</div>
         <ul class="paginList">
        <li class="paginItem"><a href=getalluser.jsp?currentPage=1 target='_self' >Home</a></li>
        <li class="paginItem"><a href=getalluser.jsp?currentPage=<%=currentPage-1%> target='_self'> < </a></li>
        <li class="paginItem"><a href=getalluser.jsp?currentPage=<%=currentPage+1%> target='_self'> > </a></li>
        <li class="paginItem"><a href=getalluser.jsp?currentPage=<%=pageCount%> target='_self' >Last</a></li>
        </ul> 
    </div>
  
    <div class="tip" style="display: none;" id="ifDelete">
    	<div class="tiptop"><span>Tips</span><a></a></div>
      <div class="tipinfo">
        <span><img src="<%=basePath %>images/ticon.png" /></span>
        <div class="tipright">
        <p>Are you sure to delete this menu item?</p>
        <cite>If yes, click the OK button, or cancel.</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="OK" id="confirmDelete" />&nbsp;
        <input name="" type="button"  class="cancel" value="Cancel" id="cancelDelete"/>
        </div>
    </div>
    
    </div>
    
    <script type="text/javascript">
    $('.tablelist tbody tr:odd').addClass('odd');
	</script>
	
</body>
</html>