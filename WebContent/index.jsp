 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.tool.Product,com.tool.mbUser" errorPage="../error.jsp"%>
    <jsp:useBean id="sql" class="com.tool.SelectSQL" scope="page"/>
    <jsp:useBean id="news" class="com.tool.News" scope="page"/>
    <jsp:useBean id="s" class="com.tool.StringTrans" scope="page"/>
    <jsp:useBean id="down" class="com.tool.NewsPage" scope="page"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>华威材料有限公司</title>
<link rel="stylesheet" type="text/css" href="Assets/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="Assets/css/common.css"/>
<link rel="stylesheet" type="text/css" href="Assets/css/index.css">
<script type="text/javascript" src="Assets/js/jquery-1.8.3.min.js"></script>
<!--幻灯片-->
<script type="text/javascript" src="Assets/plugins/banner/js/jquery.nav.js"></script>
<link rel="stylesheet" type="text/css" href="Assets/plugins/banner/css/nav.css">
<!--幻灯片-->
<!--动态-->
<script type="text/javascript" src="Assets/plugins/news/js/jQuery.textSlider.js"></script>
<!--动态-->
<!--产品展示-->
<script type="text/javascript" src="Assets/js/jquery.tools.packed.js"></script>
<!--产品展示-->
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
        	
        	//User.getName()!=null&&User.getPwd()!=null
        	if(session.getAttribute("flag")!=null)
        	{
        		if(User!=null&&User.getName()!=null&&User.getPwd()!=null)
        		{
        %>
        <a href="">欢迎您，<%=User.getName()%></a>
        <a href="ExitLogin.jsp">退出登录</a>
        <%
        	   }
        		else
        		{%>
        		 <a href="Login.jsp">会员登陆</a> <a href="Login.jsp"> 会员注册</a> 
        		<% 
        		}
        	}
        	else
        	{
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
        <li><a href="">关于我们</a></li>
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
<div class="banner_tu">
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
                <!-- <a href="#" onClick="return false;">2</a>
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
<!--新闻中心-->
<!-- <div class="news clearfix">
	<div class="title">
        <span>新闻中心：</span>
    </div>
	<div id="scrollDiv">
      <div class="scrollText">
        <ul style="margin-top: 0px; ">
          <li><a href="">智能手表的主要用途包括哪些？<span>2016-06-13</span></a></li>
          <li><a href="">机械手表的主要用途包括哪些？<span>2016-06-13</span></a></li>
          <li><a href="">石英的主要用途包括哪些？<span>2014-06-13</span></a></li>
          <li><a href="">电子手表的主要用途包括哪些？<span>2014-06-13</span></a></li>
        </ul>
      </div>
    </div>
    <div class="more"><a href=""><img src="Assets/images/more.png" alt=""/></a></div>
    <script type="text/javascript">
    $(document).ready(function(){
        $("#scrollDiv").textSlider({line:1,speed:500,timer:3000});
    });
    </script> 
</div> -->
<div class="main">
<!--新闻中心-->
<div class="space_hx">&nbsp;</div>
<div class="z1 clearfix">
	<!--公司简介-->
    <div class="z1_a">
    	<div class="box_h">
        	<span>公司简介</span>
        </div>
        <dl class="z1_m">
        	<dt><img src="Assets/upload/pic1.jpg" alt=""/></dt>
            <dd>华威手表所代表的活力、年轻、时尚、多功能的品牌形象已深入民心。华威科技公司一向以技能领先于同行为己任，历年都会有技能的突破。 将高、精、尖的科技结合新型液晶技能，恰当地运用于腕上时计，不断地提高腕上计时的发展水平--华威一贯以来所倡导的"腕上科技"精神在中国国内也被得以沿袭和传播。</dd>
            <dd class="more"><a href="">了解更多</a></dd>
        </dl>
    </div>
    <!--公司简介-->
    <!--联系我们-->
    <div class="contact">
    	<div class="box_h">
        	<span>联系我们</span>
        </div>
        <ul class="contact_m">
        	<li>
        	  <h3>&nbsp;</h3>
        	  <span class="banner_tu">华威科技有限公司</span></li>
        	<li><span>联系人：</span>刘先生</li>
            <li><span>电话：</span>0000-88888888</li>
            <li><span>手机：</span>13888888888</li>
            <li><span>传真：</span>0000-88888888</li>
            <li><span>E-mail：</span>xxxx@xx.com</li>
            <li><span>地址：</span>广东省深圳市</li>
			<li><a href="http://wpa.qq.com/msgrd?V=1&Uin=2279490418&Site=湛蓝包装材&Menu=yes
"><img src="Assets/images/qq.png" alt=""/></a></li>
        </ul>
    </div>
    <!--联系我们-->
</div>
<div class="space_hx">&nbsp;</div>
<!--产品展示-->
<div class="pro">
	<div class="box_h">
        <span>产品展示</span>
        <a href=""><img src="Assets/images/more.png" alt=""/></a>
    </div>
    <div class="pro_m">
    	<div class="box mainPhoto">
            <!-- <span class="goleft nextPage"><a href="javascript:void(0)"><img src="Assets/images/prev.png" /></a></span> -->
            <div class="go slidegrid">
            	<ul class="slideitems">
                	<li>
                    	<ul class="clearfix">
                    	 <% 
                        Collection<Product> temp=sql.selectProductAll();
                        Iterator<Product> it=temp.iterator();
                        int Count=0;
                        while(it.hasNext())
                        {
                        	Product product=(Product)it.next();
                        	out.println("<li>");
                        	out.println("<a href='pro_detail.jsp?id="+product.getID()+"'><img src='"+product.getImgPath()+"' /></a>");
                        	out.println("<span><a href=''>"+product.getName()+"</a></span>");                 
                        	out.println(" </li>");                      	
                        	Count++;
                        }
                        %>
                        </ul>
                    </li>
                </ul>
            </div>
            
            <!-- <span class="goright prevPage"><a href="javascript:void(0)"><img src="Assets/images/next.png" /></a></span> -->
            </div> 
            <script>
            $(function(){
            $('.mainPhoto .slidegrid').scrollable({size:1,circular:true,next:'.nextPage',prev:'.prevPage'}).autoscroll();
            });	
            </script>
    </div>
</div>
<!--产品展示-->
<!--友情链接-->
<div class="friendship">
	<span>友情链接：</span>
    <a href="">阿里巴巴</a>
    <a href="">中国制造网</a>
    <a href="">企发商务平台</a><a href="">自助贸易网</a>
    <a href="">中国供应商</a></div>
<!--友情链接-->
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
</div>
<!--底部-->
</body>
</html>
