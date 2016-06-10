<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>侧边菜单</title>
<link href="../CSS/style.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" height="625"  border="0">
  <tr>
    <td valign="top" bgcolor=“#5CACEE”><table width="100%" height="550"  border="0">
      <tr align="center" valign="bottom">
        <td height="40" colspan="2" class="hczi">新闻管理</td>
      </tr>
      <tr>
         <td height="32">&nbsp;</td>
      <td width="62%" valign="bottom" class="hczi"><a href=news.jsp target=hello class="lunzi">新闻添加</a></td>
      </tr>
      <tr>
        <td height="32">&nbsp;</td>
      <td height="32" class="hczi"><a href=newsBrowse.jsp target=hello class="lunzi">新闻浏览</a></td>
      </tr>
      <tr align="center">
        <td height="47" colspan="2" class="hczi">用户管理</td>
      </tr>
      <tr>
        <td height="21">&nbsp;</td>
      <td height="21" class="lunzi"><a href=adminmanager.jsp target=hello class="lunzi">管理员管理</a></td>
      </tr>
      <tr>
        <td height="21">&nbsp;</td>
      <td height="21" class="lunzi"><a href=memberManager.jsp target=hello class="lunzi">会员管理</a></td>
      </tr>
      <tr align="center">
        <td height="27" colspan="2" class="hczi">产品管理</td>
      </tr>
      <tr>
        <td height="26">&nbsp;</td>
      <td valign="bottom" class="hczi"><a href=productinsert.jsp target=hello class="lunzi">添加产品</a></td>
      </tr>
      <tr>
        <td height="21">&nbsp;</td>
      <td height="21" class="hczi"><a href=productmanager.jsp target=hello class="lunzi">产品操作</a></td>
      </tr>
       <tr align="center">
        <td height="47" colspan="2" class="hczi">订单管理</td>
      </tr>
      <tr>
        <td height="21">&nbsp;</td>
      <td height="21" class="lunzi"><a href=productinsert.jsp target=hello class="lunzi">添加订单</a></td>
      </tr>
      <tr>
        <td height="21">&nbsp;</td>
      <td height="21" class="lunzi"><a href=logout.jsp target=hello class="lunzi">订单操作</a></td>
      </tr>
      <tr align="center">
        <td height="47" colspan="2" class="hczi">留言管理</td>
      </tr>
      <tr>
        <td height="21">&nbsp;</td>
      <td height="21" class="lunzi"><a href=messageManager.jsp target=hello class="lunzi">管理留言</a></td>
      </tr>
      <tr align="center">
        <td height="47" colspan="2" class="hczi">注销管理</td>
      </tr>
      <tr>
        <td height="21">&nbsp;</td>
      <td height="21" class="lunzi"><a href=logout.jsp target="_top" class="lunzi">后台管理员注销</a></td>
      </tr>
      <!-- <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr> -->
      </table>
	</td>
  </tr>
</table>
</body>
</html>
