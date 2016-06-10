<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.tool.News" errorPage="../error.jsp"%>
    <jsp:useBean id="sql" class="com.tool.SelectSQL" scope="page"/>
    <jsp:useBean id="news" class="com.tool.News" scope="page"/>
    <jsp:useBean id="s" class="com.tool.StringTrans" scope="page"/>
    <jsp:useBean id="down" class="com.tool.NewsPage" scope="page"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../CSS/style.css" rel="stylesheet" type="text/css">


<script type="text/javascript">

function Jumping(){
	document.PageForm.submit();
	return;
}
function gotoPage(pagenum){
	document.PageForm.current.value=pagenum;
	document.PageForm.submit();
	return;
}

function suredelete(){
    if(confirm("确定删除吗")){
        location.href="确认后跳转的页面";
    }else{
        location.href="取消后跳转的页面";
    }
}
</script>

</head>
<body  bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<p align="center">新闻浏览</p>
<%
int curPage;
int current;
int MaxPage,MinPage;
down.setpageSize(10);
MaxPage=down.getTotalPage();
MinPage=1;
if(request.getParameter("current")==null){
	current=1;
}
else{
	current=Integer.parseInt(request.getParameter("current"));	
}

down.setCurrentPage(current);
if(current>MaxPage){
	current=MaxPage;
	//out.println("test1");
}
if(current<MinPage){
	current=MinPage;
	//out.println("test2");
}
%>

<div align="left">
  <p align="right"></p>
  <p align="right"></p>
  <form action="newsBrowse.jsp" name="PageForm" method="post">
    <table width=100% border="1" align="left" cellspacing="0" bordercolor="#FFFFFF">
	<tr bgcolor="#D4E7F8">
	  <td width=30%><div align="center" class="whitezi"><strong>名称</strong></div></td>
		<td width=70% colspan="5"><div align="center" class="whitezi"><strong>操作</strong></div></td>
	</tr>
<%
Collection<News> temp=sql.selectNewsFy(current-1);
Iterator<News> it=temp.iterator();
int count=0;

//out.println(it.hasNext());

while(it.hasNext())
{
	News newsl=(News)it.next();
	if(count%2==0)
	out.println("<tr bordercolor='#FFFFFF' bgcolor='#E4EFFA'>");
	else
	out.println("<tr bgcolor='FFFFFF' bordercolor='#E4EFFA'>");
	
	out.println("<td><div align='center' class='zczi'>"+newsl.getTitle()+"</div></td>");
	out.println("<td><div align='center'><strong><a href='newsEdit.jsp?id="+newsl.getId()+"' class='zczi'>修改</a></div></td>");
	out.println("<td><div align='center'><strong><a href='#' onclick=window.open('newsDel.jsp?id="+newsl.getId()+"','newwindow','width=200,height=174,top=400,left=240') class='zczi'>删除</a></div></td>");
	out.println("<td colspan='3'><div align='center'><strong><a href='newsview.jsp?id="+newsl.getId()+"'class='zczi'>查看</a></div></td>");
	out.println("</tr>");
	count++;
}
%>

<p align="center">&nbsp;</p>
	<%
	if(down.getTotalPage()!=1){
	 %>
	<tr bgcolor="#6699FF">
		<td width=19%><div align="center" class="whitezi"><a href="javascript:gotoPage(1)">首页</a></div></td>
		<td width=22%><div align="center" class="whitezi"><a href=javascript:gotoPage(<%=down.getCurrentPage()-1 %>)>上一页</a></div></td>
	  <td width=22% align="center"><span class="whitezi"><a href=javascript:gotoPage(<%=down.getCurrentPage()+1 %>)>下一页</a></span></td>
      <td width=22% align="center"><span class="whitezi"><a href=javascript:gotoPage(<%=down.getTotalPage() %>)>尾页</a></span></td>
      <td width=15% colspan="2"><div align="center" class="whitezi">
        <select name="current" onChange="Jumping()">
        <%for(int i=1;i<=down.getTotalPage();i++){ 
        	if(i==down.getCurrentPage()){
        %>
        <option selected value=<%=i %>><%=i %></option>
    		<%}else{ %>
        <option value=<%=i %>><%=i %></option>
        <%}} %>
        </select>
      </div></td>
	   
	</tr>
	<tr>
        <td colspan="2">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
	<%} %>

</table>
</form>
</div>
</body>
</html>