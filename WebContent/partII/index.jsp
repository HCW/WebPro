<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    	<li><a href="IndentManager.jsp"><i class="icon-font">&#xe006;</i>订单管理</a></li>
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
            <div class="crumb-list"><i class="icon-font"></i><a href="index.html">首页</a></div>
        </div>
        <div class="search-wrap">
            <div class="search-content">
                <form action="#" method="post">
                    <table class="search-tab">
                        <tr>
                            <th width="70">关键字:</th>
                            <td><input class="common-text" placeholder="关键字" name="keywords" value="" id="" type="text"></td>
                            <td><input class="btn btn-primary btn2" name="sub" value="查询" type="submit"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="result-wrap">
            <form name="myform" id="myform" method="post">
                <div class="result-content">
                
                    <div class="list-page"> 
                    2 条 1/1 页
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!--/main-->
</div>
</body>
</html>