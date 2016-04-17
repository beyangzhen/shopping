<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="CSS/styles.css">
	
	<script type="text/javascript">
		function check(form) {
			if(form.username.value == "") {
				alert("请输入账户名！");form.username.focus();return false;
			}
			if(form.password.value == "") {
				alert("请输入密码！");form.password.focus();return false;
			}
		}
	</script>
  </head>
  
  <body style="background-image:url(Images/login_bg.jpg); background-repeat: no-repeat;">
  	<div id="navigate">
  		<ul>
  			<li id="li"><a id="navigate_item" style="margin-top:10px;" href="main.jsp">首页</a></li>
  		</ul>
  	</div>
  	<div id="login">
		<form name="form1" action="dealLogin.jsp" method="post">
		    <ul style="margin-top:60px;">
		    	<li>账户名：<input name="username" type="text" size="18" style="height:26px"></li>
		    	<li>密&nbsp;码：<input name="password" type="password" size="18" style="height:26px"></li>
		    	<li><a form href="register.jsp" style="margin-left:160px;">免费注册</a></li>
		    	<li><input name="submit1" type="submit" value="登&#9;录" id="loginButton" onclick="return check(form1);"><br><br>
		    		<input name="submit3" type="reset" value="重置" id="resetButton">&nbsp;
		    		<input name="submit4" type="button" value="关闭" onClick="window.close();" id="closeButton"></li>
		    </ul>
	    </form>
	</div>
	<div class="footer" style="margin-top: 88px;">
    CopyRight &copy; 2015 www.jxust-nc.cn 江西理工大学南昌校区<br>
             本站请使用IE9.0或以上版本 1024*768为最佳显示效果</div>
  </body>
</html>
