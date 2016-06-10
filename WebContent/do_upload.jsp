<%@ page language="java" pageEncoding="utf-8"
  import="java.util.*,java.io.*"%>
<%@ page import="com.jspsmart.upload.SmartUpload"%>
<%@ page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page import="javax.imageio.ImageIO"%>
<%@ page import="java.awt.image.BufferedImage"%>
<%@ page import="com.sun.image.codec.jpeg.JPEGImageEncoder"%>
<%@ page import="com.sun.image.codec.jpeg.JPEGCodec"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%
String str=request.getParameter("file");
out.println(str);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>处理上传图片的JSP</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
  </head>

  <body>
  </body>
</html>