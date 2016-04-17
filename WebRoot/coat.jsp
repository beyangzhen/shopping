<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'coat.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="CSS/styles.css">


  </head>

  <body>
  	<%@ page import="java.sql.*" %>
  	<%@ page import="beans.Goods" %>
  	<%@ page import="connDB.ConnDB" %>
  	<%
  		ConnDB connDB = new ConnDB();
  		Goods goodsOne = new Goods();
  		double price = 0;
  		
  		request.setCharacterEncoding("utf-8"); //设置编码 		
    	goodsOne.setId("001");
    	goodsOne.setSize("L");
    	String sql = "select * from goods where id='" + goodsOne.getId() + "' and size='" + goodsOne.getSize() + "'";
    	ResultSet rs = connDB.executeQuery(sql);
    	while(rs.next()) {
    		price = rs.getDouble(3);
    	}
    	connDB.close();
   	%>
  	
    <div id="navigate">
  		<ul>
  			<li id="li"><a id="navigate_item" style="margin-top:10px;" href="main.jsp">首页</a></li>
  		</ul>
  	</div>
  	<div id="goods">
  		<a href="coat1_info.jsp?price=<%=price%>"><img src="Images/coat_1.jpg" width="207px" height="220px" style="border:2px solid lightgray;"></a>
  		<div id="price" style="width:208px; margin-top:10px;"><font size="2px">￥</font><%=price%></div>
  	</div>
  </body>
</html>
