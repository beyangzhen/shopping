<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>购物商城</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="CSS/styles.css">
	
	<script type="text/javascript">
		window.onload=function() //用window的onload事件，窗体加载完毕的时候
		{
		    var sm = document.getElementById("submenu1");
			sm.style.display = "none"; //页面打开时不显示 子菜单
			var sm = document.getElementById("submenu2");
			sm.style.display = "none"; //页面打开时不显示 子菜单
			var sm = document.getElementById("submenu3");
			sm.style.display = "none"; //页面打开时不显示 子菜单
			var sm = document.getElementById("submenu4");
			sm.style.display = "none"; //页面打开时不显示 子菜单
			var sm = document.getElementById("submenu5");
			sm.style.display = "none"; //页面打开时不显示 子菜单
			var sm = document.getElementById("submenu6");
			sm.style.display = "none"; //页面打开时不显示 子菜单
		};
	
		function showSubmenu(submenu, menu) {
			var sm = document.getElementById(submenu);
			sm.style.display = "block"; //显示子菜单
			var m = document.getElementById(menu);
			m.style.background = "gray"; //背景块变色
		}
		
		function hideSubmenu(submenu, menu) {
			var sm = document.getElementById(submenu);
			sm.style.display = "none"; //隐藏子菜单
			var m = document.getElementById(menu);
			m.style.background = "#970102"; //背景块变色		
		}
	</script>
		
  </head>
  
  <body style="background-color: whitesmoke;">
  	<%
  		String user = (String)session.getAttribute("user");
    %>
  	
  	<!-- 导航栏 -->
  	<div id="navigate">
  		<% if(user != null) {%>
  			<ul>
  				<li id="li" style="font-size:10px; padding-top:4px;">当前用户：<a user href="userInfor.jsp?user=<%=user%>"><%=user%></a></li>
  				<li id="li" style="margin-left:1030px; font-size:10px; padding-top:4px;"><a href="cancelUser.jsp">注销</a></li>
  				<li id="li" style="font-size:10px; padding-top:4px;"><a href="register.jsp">免费注册</a></li>
  			</ul>
  		<% } else {%>
	  		<ul style="margin-left:1130px;">
	  			<li id="li"><a id="navigate_item" href="login.jsp" style="font-size:10px; padding-top:4px;">亲，登录</a></li>
	  			<li id="li"><a id="navigate_item" href="register.jsp" style="font-size:10px; padding-top:4px;">免费注册</a></li>
	  		</ul>
  		<% } %>
  	</div> 
  	
  	<!-- 菜单栏 -->	
  	<div id="menu">
  		<table>
  			<tr>
  		 	    <td width="160px" id="tdNoborder" style="vertical-align:top">
  		 	    	<!-- 菜单 -->
  		 	    	<div onmouseover="showSubmenu('submenu1', 'menu1');" onmouseout="hideSubmenu('submenu1', 'menu1');">
  	    				<div id="menu1" style="height:26px; text-align:center;"><a href="main.jsp">男装</a></div>
  	    				<!-- 子菜单 -->
  	    				<div id="submenu1" style="background-color:gray; width:160px; x-index:2; position:absolute;"> 
  	    				<!-- x-index和position是让隐藏菜单在其他div的正上方显示 -->							
							<ul style="padding:0px; margin:0px;"> <!-- 消除ul前面默认的空格(table,ul前默认都有空格) -->	
								<li><a form href="coat.jsp">外套</a></li>
								<li><a form href="">毛衣</a></li>
								<li><a form href="">T恤</a></li>
								<li><a form href="">夹克</a></li>
								<li><a form href="">羽绒服</a></li>
							</ul>
						</div>
	  				</div>
	  			</td>
	  			<td width="160px" id="tdNoborder" style="vertical-align:top">
	  				<div onmouseover="showSubmenu('submenu2', 'menu2');" onmouseout="hideSubmenu('submenu2', 'menu2');">
  	    				<div id="menu2" style="height:26px; text-align:center;"><a href="main.jsp">女装</a></div> 	
  	    				<div id="submenu2" style="background-color:gray; width:160px; x-index:2; position:absolute;">			
							<ul style="padding:0px; margin:0px;">
								<li><a form href="">连衣裙</a></li>
								<li><a form href="">毛针织</a></li>
								<li><a form href="">风衣</a></li>
								<li><a form href="">T恤</a></li>
								<li><a form href="">卫衣</a></li>
							</ul>
						</div>    	
	  				</div>
	  			</td>
	  			<td width="160px" id="tdNoborder" style="vertical-align:top">
	  				<div onmouseover="showSubmenu('submenu3', 'menu3');" onmouseout="hideSubmenu('submenu3', 'menu3');">
  	    				<div id="menu3" style="height:26px; text-align:center;"><a href="main.jsp">鞋靴</a></div>	
  	    				<div id="submenu3" style="background-color:gray; width:160px; x-index:2; position:absolute;">			
							<ul style="padding:0px; margin:0px;">
								<li><a form href="">板鞋</a></li>
								<li><a form href="">帆布鞋</a></li>
								<li><a form href="">皮鞋</a></li>
								<li><a form href="">懒人鞋</a></li>
								<li><a form href="">马丁靴</a></li>
							</ul>
						</div>    	
	  				</div>
	  			</td>
	  			<td width="160px" id="tdNoborder" style="vertical-align:top">
	  				<div onmouseover="showSubmenu('submenu4', 'menu4');" onmouseout="hideSubmenu('submenu4', 'menu4');">
  	    				<div id="menu4" style="height:26px; text-align:center;"><a href="main.jsp">箱包</a></div>
		  	    		<div id="submenu4" style="background-color:gray; width:160px; x-index:2; position:absolute;">			
			  				<ul style="padding:0px; margin:0px;">
			  					<li><a form href="">单肩包</a></li>
								<li><a form href="">双肩包</a></li>
								<li><a form href="">斜挎包</a></li>
								<li><a form href="">手提包</a></li>
								<li><a form href="">旅行箱</a></li>
			  				</ul>
		  				</div>
	  				</div>
	  			</td>
	  			<td width="160px" id="tdNoborder" style="vertical-align:top">
	  				<div onmouseover="showSubmenu('submenu5', 'menu5');" onmouseout="hideSubmenu('submenu5', 'menu5');">
			  	    	<div id="menu5" style="height:26px; text-align:center;"><a href="main.jsp">数码</a></div>
				  	    <div id="submenu5" style="background-color:gray; width:160px; x-index:2; position:absolute;">			
					  		<ul style="padding:0px; margin:0px;">
					  			<li><a form href="">手机</a></li>
								<li><a form href="">电脑</a></li>
								<li><a form href="">相机</a></li>
								<li><a form href="">蓝牙耳机</a></li>
								<li><a form href="">U盘 </a></li>
					  		</ul>
				  		</div>
				  	</div>
	  			</td>
	  			<td width="160px" id="tdNoborder" style="vertical-align:top">
	  				<div onmouseover="showSubmenu('submenu6', 'menu6');" onmouseout="hideSubmenu('submenu6', 'menu6');">
			  	    	<div id="menu6" style="height:26px; text-align:center;"><a href="main.jsp">食品</a></div>
				  	    <div id="submenu6" style="background-color:gray; width:160px; x-index:2; position:absolute;">			
					  		<ul style="padding:0px; margin:0px;">
					  			<li><a form href="">坚果</a></li>
								<li><a form href="">巧克力</a></li>
								<li><a form href="">膨化食品</a></li>
								<li><a form href="">牛肉干</a></li>
								<li><a form href="">酸奶 </a></li>
					  		</ul>
				  		</div>
				  	</div>
	  			</td>
	  		</tr>
	  	</table>  	
	</div>
	
	<!-- 内容栏 -->
	<div id="content" style="x-index:1;">
		<div style="font-weight: bold; margin-top:15px;"><font size="4px">特色市场&nbsp;</font><font size="5px" color="lightgray">FEATURED CHANNEL</font></div>
		<div style="background-color:white;"><img src="Images/coat_1.jpg"></div>
		<div style="font-weight: bold; margin-top:15px;"><font size="4px">热门品牌&nbsp;</font><font size="5px" color="lightgray">HOT BRAND</font></div>
		<div style="background-color:white;">
			<a href="main.jsp"><img src="Images/UNIQLO.jpg"></a>
			<a href="main.jsp"><img src="Images/NB.jpg"></a>
			<a href="main.jsp"><img src="Images/NIKE.jpg"></a>
			<a href="main.jsp"><img src="Images/ADIDAS.jpg"></a>
			<a href="main.jsp"><img src="Images/APPLE.jpg"></a>
			<a href="main.jsp"><img src="Images/SAMSUNG.jpg"></a>
			<a href="main.jsp"><img src="Images/Microsoft.jpg"></a>
		</div>
		<div style="font-weight: bold; margin-top:15px;"><font size="4px">热门市场&nbsp;</font><font size="5px" color="lightgray">HOT CHANNEL</font></div>
 	</div>
  </body>
</html>
