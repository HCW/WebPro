<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="sql" scope="page" class="com.tool.SelectSQL"/>
<jsp:useBean id="user" scope="page" class="com.tool.User"/>
<jsp:setProperty property="*" name="user"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>处理管理员登录</title>
</head>
<body>
<%
String name=request.getParameter("user");
String password=request.getParameter("pwd");
out.println("handle.jsp:");
out.println(name);
out.println(password);
boolean temp=sql.CheckLogin(name,password);
out.println(temp);
if(sql.CheckLogin(name,password))
{
	session.setAttribute("ok","ok");
	response.sendRedirect("index.jsp");
}
 else{
%>
<script type="text/javascript">
	window.alert("登录失败");
	window.location.href='adminlogin.jsp'

</script>	
<%  
/* session.setAttribute("ok","ok");
response.sendRedirect("index.jsp"); */
}
%>  
</body>
</html>