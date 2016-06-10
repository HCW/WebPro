<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="../error.jsp"%>
<%@page import="com.tool.StringTrans"%>
<jsp:useBean id="sql" scope="page" class="com.tool.SelectSQL"/>
<jsp:useBean id="s" scope="page" class="com.tool.StringTrans"/>
<jsp:useBean id="news" scope="page" class="com.tool.News"/>
<jsp:setProperty property="*" name="news"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
//String id=new String(request.getParameter("id").getBytes("ISO-8859-1"),"UTF-8");
String title=new String(request.getParameter("title").getBytes("ISO-8859-1"),"UTF-8");
String content=new String(request.getParameter("content").getBytes("ISO-8859-1"),"UTF-8");
String author=new String(request.getParameter("author").getBytes("ISO-8859-1"),"UTF-8");
if(title!=null&&author!=null&&content!=null){
int i=sql.Insert(title,author,content);
System.out.println(i);

String x=null;
if(i==1){
	x="恭喜，添加完毕！";

}
else{
	x="添加失败";
}
session.setAttribute("test",x);
response.sendRedirect("news.jsp");
}
%>
</body>
</html>