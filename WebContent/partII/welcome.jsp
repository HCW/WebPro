<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" errorPage="../error.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
 <jsp:useBean id="a" class="com.tool.SelectSQL" scope="page"/>
 <%@ page language="java" import="java.util.*"%>
 <%@page import="com.tool.User"%> 
<html>
<head>

<link href="../CSS/style.css" rel="stylesheet" type="text/css">
</head>
<body  bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" height="118"  border="0" background="../images/ht05.gif">
 <%
  String name=null;
  Collection<User> ret=a.getRet();

  Iterator<User> it=ret.iterator();
  while(it.hasNext()){
  	User user=(User)it.next();
  	name=user.getName();
  }
  %> 
  <tr>
    <td width="652">&nbsp;</td>
    <td align="right" width="340"><span class="lunzi">欢迎光临! </span><span class="hczi"><%=name%></span></td>
  </tr>
</table>


</body>
</html>