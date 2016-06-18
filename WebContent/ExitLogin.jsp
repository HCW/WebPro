<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*,com.tool.mbUser"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	mbUser User=new mbUser();
	User.setID(null);
	User.setName(null);
	User.setPwd(null);
	session.setAttribute("LoginSuccess", User);
	response.sendRedirect("index.jsp");
%>
</body>
</html>