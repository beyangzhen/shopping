<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dealRegister.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script>
		function toPage() {
			//用onClick事件跳转到其他页面
			window.location.href = "login.jsp"; 
		}
	</script>

  </head>
  
  <body>
    <%@ page import="java.sql.*" %>
  	<%@ page import="beans.User" %>
  	<%@ page import="connDB.ConnDB" %>
  	<%
  		ConnDB connDB = new ConnDB();
  		User user = new User();
  		
  		//设置编码 
  		request.setCharacterEncoding("utf-8"); 	
  		response.setCharacterEncoding("utf-8");	
  			
    	user.setUsername(request.getParameter("username"));
    	user.setPassword(request.getParameter("password1")); 
    	user.setPhone(request.getParameter("phone")); 
    	user.setAddress(request.getParameter("address")); 
    	 
    	String sql = "insert into user(username,password,phone,address ) values('" + user.getUsername() + "','" + user.getPassword() + "','" + user.getPhone() + "','" + user.getAddress() + "')";
    	int result = connDB.executeUpdate(sql);	
    	if(1 == result) {
    		response.getWriter().println("恭喜！注册成功了！");
    	}
    	connDB.close();
    %>
    <input name="submit" type="button" value="返回" onClick="toPage()">
  </body>
</html>
