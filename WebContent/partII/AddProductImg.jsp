<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.tool.Product" errorPage="../error.jsp"%>
    <jsp:useBean id="sql" class="com.tool.SelectSQL" scope="page"/>
    <jsp:useBean id="news" class="com.tool.News" scope="page"/>
    <jsp:useBean id="s" class="com.tool.StringTrans" scope="page"/>
    <jsp:useBean id="down" class="com.tool.NewsPage" scope="page"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%//out.println(session.getAttribute("ok"));
    if(session.getAttribute("ok")!="ok")
    	response.sendRedirect("adminlogin.jsp");
   		 		
    String path = request.getContextPath();  
    String basePath = request.getScheme() + "://"  
            + request.getServerName() + ":" + request.getServerPort()  
            + path + "/";  
   		
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

function setImagePreview(avalue) {
	var docObj=document.getElementById("doc");
	 
	var imgObjPreview=document.getElementById("preview");
	if(docObj.files &&docObj.files[0])
	{
	
	imgObjPreview.style.display = 'block';
	imgObjPreview.style.width = '150px';
	imgObjPreview.style.height = '180px'; 
	//imgObjPreview.src = docObj.files[0].getAsDataURL();
	 	
	imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
	}
	else
	{
	
	docObj.select();
	var imgSrc = document.selection.createRange().text;
	var localImagId = document.getElementById("localImag");
	
	localImagId.style.width = "150px";
	localImagId.style.height = "180px";
	
	try{
	localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
	localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
	}
	catch(e)
	{
	alert("失败");
	return false;
	}
	imgObjPreview.style.display = 'none';
	document.selection.empty();
	}
	return true;
	}
function PostData(Img)
{
	var Pid=$("#pid").val();
	/* var Author=$("#author").val();
	var Content=$("#content").val();
	var button=$("#add").val(); */
		/* alert(Title);
		alert(Author);
		alert(Content);
		alert(Img); */
	//	alert(button);
		
		if(Pid != ""){
			$.post("/NewEnterpriseProject/DoProductImgAdd", {"pid":Pid,"img":Img},function(rst){
				if(rst == "success"){
					alert("添加成功");
					window.location.href= "/NewEnterpriseProject/partII/AddProductImg.jsp";
				}
				else{
					alert("添加失败");
				}
			});
		}else{
			alert("内容不能为空！");
		}
}
function ajaxFileUpload()  
{      
   var imgpath="";
   $.ajaxFileUpload({  
             url:'/NewEnterpriseProject/DoUploadIma',  
             async: false,
             secureuri:false,  
             fileElementId:'doc',               //文件选择框的id属性  
             dataType: 'text/xml',                                     //服务器返回的格式，可以是json  
             success: function (data)             //相当于java中try语句块的用法  
             {              	
            	imgpath=data;
              //	alert(imgpath);       //data是从服务器返回来的值     
              	PostData(imgpath);
             //  $('#result').html('上传图片成功!请复制图片地址<br/>'+data);                  		  
             },  
             error: function (data, status, e)             //相当于java中catch语句块的用法  
             {  
            	 alert(e);
               //  $('#result').html('上传图片失败');  
             }  
           }  
         );  
      //PostData(imgpath);
    //setTimeout(PostData(imgpath),1000);
   	
}  
</script> 
<head>
    <meta charset="UTF-8">
    <title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="../CSS/common.css"/>
    <link rel="stylesheet" type="text/css" href="../CSS/main.css"/>
    <script type="text/javascript" src="../js/libs/modernizr.min.js"></script>
     <script language="javascript" src="<%=basePath%>js/jquery-1.8.3.min.js" ></script>  
    <script language="javascript" src="<%=basePath%>js/ajaxfileupload.js" > </script>   
</head>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="index.jsp" class="navbar-brand">后台管理</a></h1>
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
            <div class="crumb-list"><i class="icon-font"></i><a href="index.jsp">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name"><a href="productmanager.jsp">产品管理</a></span><span class="crumb-step">&gt;</span><span class="crumb-name">添加产品图片</span></div>
        </div>
          <div class="result-wrap">
            <div class="result-content">
                <form action="" method="post" id="myform" name="myform" enctype="multipart/form-data">
                    <table class="insert-tab" width="100%">
                        <tbody>
                            <tr>
                                <th width="120"><i class="require-red">*</i>产品名称:</th>
                            <td>
                                <select name="search-sort" id="pid">
                                 <% 
                                 	Collection<Product> temp=sql.selectProductAll();
           					 		Iterator<Product> it=temp.iterator();
           							 int Count=0;
            				 		while(it.hasNext())
            				 		{
            				 			Product newsl=(Product)it.next();
            				 			out.println("<option value='"+newsl.getID()+"'>"+newsl.getName()+"</option");
            				 			Count++;
            				 		%>
                                </select>
                                 <% }%>
                            </td>
                            </tr>
                            <tr align="center">
								<td height="101" align="center">
								<div  id="localImag">
								<img align="center" id="preview" src="" width="150" height="180" style="display: block; width: 150px; height: 180px;">
								</div>
								</td>
							</tr>
                            <tr>
                           <!-- onchange="javascript:setImagePreview();" <form action="" method="post" enctype="multipart/form-data" name="form_uploadImg"> -->
                                <th><i class="require-red">*</i>图片：</th>
                                <td>
                                <input name="doc" id="doc" type="file" onchange="javascript:setImagePreview();">
                                <!-- <input type="button" id="buttonUpload" onclick="return ajaxFileUpload();" value="上传图片"/> -->
                                </td>
                           <!--  </form> -->
                            </tr>                           
                            <tr>
                                <th></th>
                                <td>
                                    <input id="add" class="btn btn-primary btn6 mr10" value="添加" type="button" onclick="return ajaxFileUpload();">
                                    <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
                                </td>
                            </tr>
                        </tbody></table>
                </form>
            </div>
        </div>
    <!--/main-->
</div>
</body>
</html>