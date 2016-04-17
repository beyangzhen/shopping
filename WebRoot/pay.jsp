<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>支付</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="CSS/styles.css">


  </head>
  
  <body>
  	<%
  		String address = (String)session.getAttribute("address"); //获取session对象中的用户地址
  		String id = request.getParameter("id"); //获取之前页面URl传来需购买的商品id
  		double price = Double.parseDouble(request.getParameter("price")); //获取之前页面URl传来需购买的商品price
  		int amount = Integer.parseInt(request.getParameter("amount")); //获取之前页js中URl传来的购买商品amount
   		//获取上个页面提交来选中的radio的value
   		String size = request.getParameter("size"); 
    %>
    <%
    	double money = price * amount;
    %>
    
    <div id="navigate">
  		<ul>
  			<li id="li"><a id="navigate_item" style="margin-top:10px;" href="main.jsp">首页</a></li>
  		</ul>
  	</div>
  	<div id="address">
  		<font size="3px" style="font-weight:bold;">收货地址</font>
  		<div style="margin-top:5px;"><font size="3px" color="gray">&nbsp;&nbsp;<%=address%></font></div>
  	</div>
  	<div id="order">
    	<font size="2px" color="#970102" style="font-weight:bold;">订单信息</font>
    	<div style="margin-top:4px;"><font size="2px" color="gray">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品&nbsp;&nbsp;尺码&nbsp;&nbsp;单价&nbsp;&nbsp;数量&nbsp;&nbsp;小计<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=id%>&nbsp;&nbsp;&nbsp;<%=size%>&nbsp;&nbsp;&nbsp;<%=price%>&nbsp;&nbsp;<%=amount%>&nbsp;&nbsp;<%=money%></font></div>
    </div>
    <div id="money">	
    	<font size="5px" color="gray" style="font-weight:bold;">实付款：<font color="#970102">￥<%=money%></font></font> 
	</div>  	
	<div style="text-align:center;">
		<form name="form1" action="dealPay.jsp?id=<%=id%>&size=<%=size%>&money=<%=money%>" method="post">
			<input id="payButton" name="pay" type="submit" value="支付">
		</form>
	</div>
  </body>
</html>
