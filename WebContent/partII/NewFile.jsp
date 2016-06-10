<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jspsmart.upload.SmartUpload"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	/* SmartUpload su=new SmartUpload();
	su.service(request, response);
	String str[]=su.getRequest().getParameterValues("myform");
	out.print(str.length); */
	
	String str=new String(request.getParameter("mname").getBytes("ISO-8859-1"),"UTF-8");
	out.print(str);
%>
</body>
</html>