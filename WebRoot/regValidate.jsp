<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="beans.User" %>
<%@ page import="connDB.ConnDB" %>
<%
	response.setContentType("text/xml"); //生成req.responseXML.getElementsByTagName("msg")[0]对应的XML
	response.setHeader("Cache-Control", "no-store"); //HTTP1.1
	response.setHeader("Pragma", "no-cache"); //HTTP1.0
	response.setDateHeader("Expires", 0); //prevents catching at proxy server
	request.setCharacterEncoding("utf-8"); //设置编码 
	System.out.println(request.getParameter("id")); //获取url中传递的id值 
	//数据库验证
	int result = 0;
    ConnDB connDB = new ConnDB();
  	User user = new User();	
    user.setUsername(request.getParameter("id")); 
    String sql = "select * from user";
    ResultSet rs = connDB.executeQuery(sql);	
    while(rs.next()) {
    	if(user.getUsername().equals(rs.getString(1))) {
    		result = 1;
    	}   	
    }
    connDB.close();
    if(1 == result) {
   		response.getWriter().write("<msg>invalid</msg>"); 
   	} else if(0 == result) {
   		response.getWriter().write("<msg>valid</msg>");  	 
   	}
%>
