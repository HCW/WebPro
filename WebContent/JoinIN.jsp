<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.tool.mbUser" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新闻详情</title>
<link rel="stylesheet" type="text/css" href="Assets/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="Assets/css/common.css"/>
<link rel="stylesheet" type="text/css" href="Assets/css/thems.css">
<script type="text/javascript" src="Assets/js/jquery-1.8.3.min.js"></script>
<!--幻灯片-->
<link rel="stylesheet" type="text/css" href="Assets/plugins/banner/css/nav.css">
<script type="text/javascript" src="Assets/plugins/banner/js/jquery.nav.js"></script>
<!--幻灯片-->
<!--[if lte IE 9]>
<link rel="stylesheet" type="text/css" href="Assets/css/ie.css"/>
<script type="text/javascript" src="Assets/js/css3-mediaqueries.js"></script>
<script type="text/javascript" src="Assets/js/html5.js"></script>
<style type="text/css">
body{
	behavior:url(Assets/css/css3pie.htc);
    behavior:url(Assets/css/csshover.htc);
}
</style>
<![endif]-->
<!--[if IE 6]>
<script type="text/javascript" src="Assets/js/DD_belatedPNG_0.0.7a.js"></script>
<script>
  DD_belatedPNG.fix('.news .title, .news .more img , .box_h , fieldset, img , .left_nav .lei li');
</script>
<![endif]-->

</head>
<body>
<!--头部-->
<div class="head_bg">
  <div class="head_bg">
    <div class="header clearfix">
      <div class="logo"> <a href=""><img src="Assets/images/logo.png" alt=""/></a> </div>
      <dl class="tel clearfix">
        <dt><a href=""><img src="Assets/images/tel.png" alt="" width="55" height="55"/></a></dt>
        <dd>加盟热线：0000-88888888</dd>
        <dd>&nbsp;</dd>
        
         <dd> 
        <%
        	//boolean Flag=false;
        	//session.setAttribute("flag", Flag);
        	mbUser User=(mbUser)session.getAttribute("LoginSuccess");
        	int LoginStatus=0;
        	String Name="";
        	String ID="";
        	//User.getName()!=null&&User.getPwd()!=null
        	if(session.getAttribute("flag")!=null)
        	{
        		if(User!=null&&User.getName()!=null&&User.getPwd()!=null)
        		{
        			LoginStatus=1;
        			Name=User.getName();
        			ID=User.getID();
        %>
        <a href="">欢迎您，<%=User.getName()%></a>
        <a href="ExitLogin.jsp">退出登录</a>
        <%
        	   }
        		else
        		{
        			LoginStatus=0;
        		%>
        		 <a href="Login.jsp">会员登陆</a> <a href="Login.jsp"> 会员注册</a> 
        		<% 
        		}
        	}
        	else
        	{
        		LoginStatus=0;
        %>
         <a href="Login.jsp">会员登陆</a> <a href="Login.jsp"> 会员注册</a> 
         <%} %>
        <a href="JoinIN.jsp">加盟</a>
        </dd>
      </dl>
    </div>
  </div>
</div>
<!--头部-->
<!--导航条-->
<div class="nav_bg">
	<ul class="nav clearfix">
    	<li><a href="index.jsp">首页</a></li>
        <li class="line">&nbsp;</li>
        <li><a href="JoinIN.jsp">关于我们</a></li>
        <li class="line">&nbsp;</li>
        <li><a href="pro_list.jsp">产品展示</a></li>
        <li class="line">&nbsp;</li>
        <li><a href="news_list.jsp">新闻中心</a></li>
        <li class="line">&nbsp;</li>
        <li><a href="message.jsp">在线留言</a></li>
        <li class="line">&nbsp;</li>
        <li><a href="JoinIN.jsp">联系我们</a></li>
    </ul>
</div>
<!--导航条-->
<!--幻灯片-->
<div class="banner_tu clearfix">
	<div id="inner">
        <div class="hot-event">
            <div class="event-item" style="display: block;">
                <a target="_blank" href="" class="banner">
                    <img src="Assets/upload/banner.jpg" class="photo" alt="" />
                </a>
            </div>
            <div class="event-item" style="display: none;">
                <a target="_blank" href="" class="banner">
                    <img src="Assets/upload/banner.jpg" class="photo" alt="" />
                </a>
            </div>
            <div class="event-item" style="display: none;">
                <a target="_blank" href="" class="banner">
                    <img src="Assets/upload/banner.jpg" class="photo" alt="" />
                </a>
            </div>
            <div class="event-item" style="display: none;">
                <a target="_blank" href="" class="banner">
                    <img src="Assets/upload/banner.jpg" class="photo" alt="" />
                </a>
            </div>
            <div class="event-item" style="display: none;">
                <a target="_blank" href="" class="banner">
                    <img src="Assets/upload/banner.jpg" class="photo" alt="" />
                </a>
            </div>
            
            <div class="switch-tab">
                <a href="#" onClick="return false;" class="current">1</a>
               <!--  <a href="#" onClick="return false;">2</a>
                <a href="#" onClick="return false;">3</a>
                <a href="#" onClick="return false;">4</a>
                <a href="#" onClick="return false;">5</a> -->
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $('#inner').nav({ t: 3000, a: 500 });
    </script>
</div>
<!--幻灯片-->
<div class="main">
<!--产品展示-->
<div class="pro_list clearfix">
  <div class="left_nav">
    <div class="box_h"> <span>产品类别</span></div>
    <ul class="lei">
      <li><span><a href="">机械手表</a></span></li>
      <li><span><a href="">智能手表</a></span></li>
      <li><span><a href="">石英手表</a></span></li>
      <li><span><a href="">电波手表</a></span></li>
    </ul>
    <div class="space_hx">&nbsp;</div>
    <!--联系我们-->
    <div class="contact">
      <div class="box_h"> <span>联系我们</span></div>
      <ul class="contact_m">
        <li><span class="banner_tu">华威科技有限公司</span></li>
        <li><span>联系人：</span>刘先生</li>
        <li><span>电话：</span>0000-88888888</li>
        <li><span>手机：</span>13888888888</li>
        <li><span>传真：</span>0000-88888888</li>
        <li><span>E-mail：</span>xxxx@xx.com</li>
        <li><span>地址：</span>广东省深圳市</li>
        <li></li>
        <li><a href="http://wpa.qq.com/msgrd?V=1&Uin=2279490418&Site=湛蓝包装材&Menu=yes
    "><img src="Assets/images/qq.png" alt=""/></a></li>
      </ul>
    </div>
    <!--联系我们-->
  </div>
  <div class="pro_m">
    	<div class="box_h">
        	<span>新闻列表</span>
        </div>
        <div class="pro_md">
        	<h1>加盟代理</h1>
            <div class="time"></div>
            <div class="ctn">
           	  <p>回顾30年多来的成绩，华威一步步稳健发展，规模不断扩大，营业额逐年递增，这一切与中国的经济腾飞分不开，与中国消费者的喜爱与支持紧密相连。<br>
       	      今后，华威将一如既往地秉持&ldquo;创造贡献&rdquo;的经营理念，通过创新产品来改善人们的日常生活，为人们带去欢乐与惊喜。进一步加大中国地区推广力度，并针对日新月异的中国市场，从中国消费者的具体需求出发，推出更多贴近中国市场的产品。华威也将同时关注环境保护，忠实地履行社会责任，积极为社会做贡献。</p>
           	  <p>加盟热线：</p>
           	  <p>全产品：400-700-6655</p>
           	  <p>电话受理时间：9：00-18：00(国定假日除外)</p>
            </div>
            <div class="space_hx">&nbsp;</div>
            <!--导向页-->
            <!--导向页-->
        </div>
    </div>
</div>
<!--产品展示-->
</div>
<!--底部-->
<div class="foot">
	<p class="f_nav">
    	<a href="index.jsp">网站首页</a>|
        <a href="JoinIN.jsp">关于我们</a>|
        <a href="pro_list.jsp">产品展示</a>|
        <a href="news_list.jsp">新闻中心</a>|
        <a href="message.jsp">在线留言</a>|
        <a href="">联系我们</a>
    </p>
  <p><span>联系电话：0000-88888888 </span> <span>刘先生：1388888888</span> <span>地址：广东省深圳市</span> </p>
    <p>&copy;Copyright 2016-2017.All Rights Reserved.华威科技有限公司 版权所有</p>
    <p><!--底部-->
    </p>
</div></body>
</html>
