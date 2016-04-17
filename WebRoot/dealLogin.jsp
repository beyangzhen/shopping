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
  		//获取参数
    	user.setUsername(request.getParameter("username"));
    	user.setPassword(request.getParameter("password")); 
    	
    	String sql = "select * from user where username='" + user.getUsername() + "'";
    	ResultSet rs = connDB.executeQuery(sql);	
    	while(rs.next()) {
    		if(user.getPassword().equals(rs.getString(2))) {
    			session.setAttribute("user", rs.getString(1)); //把用户名存到session对象中
    			session.setAttribute("address", rs.getString(4)); //把用户地址存到session对象中
    			request.getRequestDispatcher("main.jsp").forward(request, response);
    		}
    		else {
    			request.getRequestDispatcher("loginFail.jsp").forward(request, response);
    		}
    	}
    	connDB.close();
   	%>
  </body>
</html>
