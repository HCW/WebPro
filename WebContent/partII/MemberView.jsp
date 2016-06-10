<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.tool.mbUser" errorPage="../error.jsp"%>
    <jsp:useBean id="sql" class="com.tool.SelectSQL" scope="page"/>
    <jsp:useBean id="news" class="com.tool.News" scope="page"/>
    <jsp:useBean id="s" class="com.tool.StringTrans" scope="page"/>
    <jsp:useBean id="down" class="com.tool.NewsPage" scope="page"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%//out.println(session.getAttribute("ok"));
    if(session.getAttribute("ok")!="ok")
    	response.sendRedirect("adminlogin.jsp");
   		%>
<html>
<script type="text/javascript" > 
function show(c_Str) 
{
	if(document.all(c_Str).style.display=='none') 
{document.all(c_Str).style.display='block';} 
else{document.all(c_Str).style.display='none';}

} 
function high(){ 
if (event.srcElement.className=="k"){ 
event.srcElement.style.background="336699" 
event.srcElement.style.color="white" 
} 
} 
function low(){ 
if (event.srcElement.className=="k"){ 
event.srcElement.style.background="99CCFF" 
event.srcElement.style.color="" 
} 
} 
</script> 
<head>
    <meta charset="UTF-8">
    <title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="../CSS/common.css"/>
    <link rel="stylesheet" type="text/css" href="../CSS/main.css"/>
     <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../js/libs/modernizr.min.js"></script>
</head>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="index.html" class="navbar-brand">后台管理</a></h1>
        </div>
    </div>
</div>
<div class="container clearfix">
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
		<table>	
        <div class="sidebar-content">
            <ul class="sidebar-list">
                <tr class="sidebar-list">
				<td>
				<li>
                   <div onclick=show("a0")> <a href="#"><i class="icon-font">&#xe003;</i>常用操作</a> </div>
                    <div id="a0" style="display:none">
					<ul class="sub-menu">
                        <li><a href="NewaManager.jsp"><i class="icon-font">&#xe008;</i>新闻管理</a></li>
                        <li><a href="messageManager.jsp"><i class="icon-font">&#xe005;</i>留言管理</a></li>
                        <li><a href="productmanager.jsp"><i class="icon-font">&#xe006;</i>产品管理</a></li>
                    	<li><a href="administer-订单查询.html"><i class="icon-font">&#xe006;</i>订单管理</a></li>
                    </ul>
					</div>
                </li>
				</td>
				</tr>
                <tr class="sidebar-list">
				<td>
				<li>
                   <div onclick=show("a1")> <a href="#"><i class="icon-font">&#xe003;</i>用户管理</a> </div>
                    <div id=a1 style="display:none">
					<ul class="sub-menu">
                        <li><a href="adminmanager.jsp"><i class="icon-font">&#xe008;</i>管理员管理</a></li>
                        <li><a href="memberManager.jsp"><i class="icon-font">&#xe005;</i>会员管理</a></li>
                    </ul>
					</div>
                </li>
				</td>
				</tr>
				<tr class="sidebar-list">
				<td>
				<li>
                   <div onclick=show("a3")> <a href="#"><i class="icon-font">&#xe018;</i>系统操作</a> </div>
                    <div id=a3 style="display:none">
					<ul class="sub-menu">
                         <li><a href="logout.jsp"><i class="icon-font">&#xe017;</i>系统注销</a></li>
                    </ul>
					</div>
                </li>
				</td>
				</tr>
           </ul>
        </div>
		</table>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="index.jsp">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name"><a href="memberManager.jsp">会员管理</a></span><span class="crumb-step">&gt;</span><span class="crumb-name">查看会员信息</span></div>
        </div>
          <div class="result-wrap">
            <div class="result-content">
                <form action="" method="post" id="myform" name="myform" enctype="multipart/form-data">
                    <table class="insert-tab" width="100%">
                        <tbody>
                         <%
						String id = request.getParameter("id");
						Collection<mbUser> temp = sql.selectmbUserIN(id);
						Iterator<mbUser> it = temp.iterator();

						session.setAttribute("id", id);
						
						while (it.hasNext()) {
							mbUser user = (mbUser) it.next();
						
					  %>
                            <tr>
                                <th><i class="require-red">*</i>用户名：</th>
                                <td>
                                    <input class="common-text required" id="name" name="title" size="50" value="<%=user.getName()%>" type="text" readonly="true">
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>密码：</th>
                                <td>
                                    <input class="common-text required" id="pwd" name="author" size="50" value="<%=user.getPwd()%>" type="text" readonly="true">
                                </td>
                            </tr>
                            <tr>
                                <th>地址：</th>
                                <td>
                                    <input class="common-text required" id="addr" name="author" size="50" value="<%=user.getAddr()%>" type="text" readonly="true">
                                </td>
                            </tr>
                            <tr>
                                <th>邮件：</th>
                                <td>
                                    <input class="common-text required" id="mail" name="author" size="50" value="<%=user.getMail()%>" type="text" readonly="true">
                                </td>
                            </tr>
                            <tr>
                                <th>手机号码：</th>
                                <td>
                                    <input class="common-text required" id="phone" name="author" size="50" value="<%=user.getPhone()%>" type="text" readonly="true">
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
                                </td>
                            </tr>
                            <%} %>
                        </tbody></table>
                </form>
            </div>
        </div>
    <!--/main-->
</div>
</body>
</html>