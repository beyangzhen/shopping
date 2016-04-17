<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'coat1_info.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="CSS/styles.css">
	
	<script type="text/javascript">
		function checkLogin() {
			alert("请先登录！");
			window.location.href = "login.jsp";
		}
		
		function gainAmount() {
			var amount = document.getElementById("amount").value;
			window.location.href = "pay.jsp?amount=amount";
		}
	</script>
	
  </head>
  
  <body>  
  	<%@ page import="java.sql.*" %>
  	<%@ page import="beans.Goods" %>
  	<%@ page import="connDB.ConnDB" %>
  	<%
  		ConnDB connDB = new ConnDB();
  		Goods goodsOne = new Goods();
  		int amount = 0;
  		
  		request.setCharacterEncoding("utf-8"); //设置编码 		
    	goodsOne.setId("001");
    	goodsOne.setSize("L");
    	String sql = "select * from goods where id='" + goodsOne.getId() + "' and size='" + goodsOne.getSize() + "'";
    	ResultSet rs = connDB.executeQuery(sql);
    	while(rs.next()) {
    		amount = rs.getInt(5);
    	}
    	connDB.close();
   	%>
   	
   	<%
   		//获取用户名
   		String user = (String)session.getAttribute("user");
    %>
   	
   	<%
   		//获取上个页面URL中传来的价格参数
  		double price = 0;
  		price = Double.parseDouble(request.getParameter("price")); //String类型转化为double类型
  	%>
  	<div id="navigate">
  		<ul>
  			<li id="li"><a id="navigate_item" style="margin-top:10px;" href="main.jsp">首页</a></li>
  		</ul>
  	</div>
    <div id="goodsInfo">
    	<table cellpadding="0" cellspacing="30">
    		<tr>
    			<td id="tdNoborder">
    				<img src="Images/coat_1.jpg" width="414px" height="440px">
    			</td>
    			<td id="tdNoborder" style="vertical-align:top;">
    				<div style="background-color:gainsboro; height:80px; color:#970102; font-size:29px; font-weight:bold;">
    					<font size="2px" color="gray" style="font-weight:normal;">价格</font>
    					<font size="5px" style="margin-left:170px;">￥</font><%=price%>
    				</div>
    				<div style="margin-top:130px;">
    					<form id="form" name="form1" action="pay.jsp?id=001&price=<%=price%>" method="post">
		    				<font size="2px" color="gray">尺码&nbsp;&nbsp;</font>
			    				<input name="size" type="radio" value="S">165/84A/S&nbsp;
			    				<input name="size" type="radio" value="M">170/92A/M&nbsp;
			    				<input name="size" type="radio" value="L" checked>175/100A/L&nbsp;
			    				<input name="size" type="radio" value="XL">180/108B/XL&nbsp;<br><br><br>
		    				<font size="2px" color="gray">数量&nbsp;&nbsp;&nbsp;</font><input id="amount" name="amount" type="text" size="3" style="height:26px;"><font size="2px" color="gray">&nbsp;件 &nbsp;库存<%=amount%>件</font><br><br><br><br>
		    				<%if(user != null) {%>
		    					<input name="buy" type="submit" value="立即购买" id="buyButton" onClick="gainAmount();">
		    				<%} else {%>
		    					<input name="buy" type="button" value="立即购买" id="buyButton" onClick="checkLogin();">
		    				<%}%>
		    			</form>
	    			</div>
    			</td>
    		</tr>
    	</table>
    </div>
  </body>
</html>
