<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="../error.jsp"%>
    <jsp:useBean id="s" class="com.tool.StringTrans"/>
    <jsp:useBean id="sql" class="com.tool.SelectSQL"/>
    <jsp:useBean id="news" class="com.tool.News"/>
    <jsp:setProperty property="*" name="news"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
/* String id=news.getId().trim();
String title=news.getTitle().trim();
String content=news.getContent().trim();
String author=news.getAuthor().trim(); */
request.setCharacterEncoding("UTF-8");

String name=new String(request.getParameter("mname").getBytes("ISO-8859-1"),"UTF-8");

System.out.println("name:"+name);

String id=new String(request.getParameter("id").getBytes("ISO-8859-1"),"UTF-8");
String title=new String(request.getParameter("title").getBytes("ISO-8859-1"),"UTF-8");
String content=new String(request.getParameter("content").getBytes("ISO-8859-1"),"UTF-8");
String author=new String(request.getParameter("author").getBytes("ISO-8859-1"),"UTF-8");
System.out.println("title:"+title);
int i=sql.updateNews(title,content,author,id);
if(i==1){
%>
	<script language="javascript">
    alert("修改成功!");
     window.close();
    </script>
<%
	response.sendRedirect("newsBrowse.jsp");
}
else
{
%>
<script language="javascript">
    alert("修改失败!");
     window.close();
    </script>
<% 
}
%>
</body>
</html>