<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dealPay.jsp' starting page</title>
    
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
  	<%@ page import="beans.Goods" %>
  	<%@ page import="connDB.ConnDB" %>
  	<%
  		ConnDB connDB = new ConnDB();
  		Goods goodsOne = new Goods();
  		
  		//设置编码 
  		request.setCharacterEncoding("utf-8"); 
		response.setCharacterEncoding("utf-8");	  		
  		
  		double money = Double.parseDouble(request.getParameter("money"));
    	goodsOne.setId(request.getParameter("id")); //获取之前页面URL传来需购买的商品id
    	goodsOne.setSize(request.getParameter("size")); //获取之前页面URL传来需购买的商品size
    	
    	String sql1 = "update goods set amount=amount-1 where id='" + goodsOne.getId() + "' and size='" + goodsOne.getSize() + "'";
    	int result1 = connDB.executeUpdate(sql1);
    	String sql2 = "update user set account=account-299 where username='" + (String)session.getAttribute("user") + "'";
    	int result2 = connDB.executeUpdate(sql2);
    	if(2 == result1 + result2) {
    		response.getWriter().println("您已经支付成功啦！");
    	}
    	
    	connDB.close();
   	%>
  </body>
</html>
