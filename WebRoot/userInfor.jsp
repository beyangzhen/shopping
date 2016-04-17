<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的商城</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="CSS/styles.css">


  </head>
  
  <body>
  	<%@ page import="java.sql.*" %>
  	<%@ page import="beans.User" %>
  	<%@ page import="connDB.ConnDB" %>
  	<%
  		ConnDB connDB = new ConnDB();
  		User user = new User();
  		String password = "";
  		String phone = "";
  		String address = "";
  		double account = 0;
  		
  		request.setCharacterEncoding("utf-8"); //设置编码 	
  		//获取"url中传递的参数"进行查询
  		String username = new String(request.getParameter("user").getBytes("ISO-8859-1"),"utf-8"); 			
    	String sql = "select * from user where username='" + username + "'";
    	ResultSet rs = connDB.executeQuery(sql);	
    	while(rs.next()) {
    		username = rs.getString(1);
    		password = rs.getString(2);
    		phone = rs.getString(3);
    		address = rs.getString(4);
    		account = rs.getDouble(5);
    	}
    	
    	connDB.close();
   	%>
  	
  	<div id="navigate">
  		<ul>
  			<li id="li"><a id="navigate_item" style="margin-top:10px;" href="main.jsp">首页</a></li>
  		</ul>
  	</div>
  	<div id="userInfor">
  		<ul style="margin:0px;"> <!-- 消除ul前面默认的空格(table,ul前默认都有空格) -->
  			<li>用户名：<%=username%></li>
  			<li>密码：<%=password%></li>
  			<li>电话号码：<%=phone%></li>
  			<li>收货地址：<%=address%></li>
  			<li>账户余额：<%=account%></li>
  		</ul>
  	</div>
  </body>
</html>
