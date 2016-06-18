<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<title>登录注册</title> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
<script type="text/javascript" src="login/js/jquery-1.9.0.min.js"></script>
 <script type="text/javascript" src="login/images/login.js"></script>
<link href="login/css/login2.css" rel="stylesheet" type="text/css" />
</head>
<body>
<h1>登录注册<sup>2016</sup></h1>

<div class="login" style="margin-top:50px;">
    
    <div class="header">
        <div class="switch" id="switch"><a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">快速登录</a>
			<a class="switch_btn" id="switch_login" href="javascript:void(0);" tabindex="8">快速注册</a><div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: 0px;"></div>
        </div>
    </div>    
  
    
    <div class="web_qr_login" id="web_qr_login" style="display: block; height: 235px;">    

            <!--登录-->
            <div class="web_login" id="web_login">
               
               
               <div class="login-box">
    
            
			<div class="login_form">
				<form action="" name="loginform" accept-charset="utf-8" id="login_form" class="loginForm" method="post"><input type="hidden" name="did" value="0"/>
               <input type="hidden" name="to" value="log"/>
                <div class="uinArea" id="uinArea">
                <label class="input-tips" for="u">帐号：</label>
                <div class="inputOuter" id="uArea">
                    
                    <input type="text" id="username" name="username" class="inputstyle"/>
                </div>
                </div>
                <div class="pwdArea" id="pwdArea">
               <label class="input-tips" for="p">密码：</label> 
               <div class="inputOuter" id="pArea">
                    
                    <input type="password" id="pwd" name="pwd" class="inputstyle"/>
                </div>
                </div>
               
                <div style="padding-left:50px;margin-top:20px;"><input type="button" value="登 录" style="width:150px;" class="button_blue" onclick="Login()"/></div>
              </form>
           </div>
           
            	</div>
               
            </div>
            <!--登录end-->
  </div>

  <!--注册-->
    <div class="qlogin" id="qlogin" style="display: none; ">
   
    <div class="web_login"><form name="form2" id="regUser" accept-charset="utf-8"  action="" method="post">
	      <input type="hidden" name="to" value="reg"/>
		      		       <input type="hidden" name="did" value="0"/>
        <ul class="reg_form" id="reg-ul">
        		<div id="userCue" class="cue">快速注册请注意格式</div>
                <li>
                	
                    <label for="user"  class="input-tips2">用户名：</label>
                    <div class="inputOuter2">
                        <input type="text" id="susername" name="susername" maxlength="16" class="inputstyle2"/>
                    </div>
                    
                </li>
                
                <li>
                <label for="passwd" class="input-tips2">密码：</label>
                    <div class="inputOuter2">
                        <input type="password" id="spwd"  name="pwd" maxlength="16" class="inputstyle2"/>
                    </div>
                    
                </li>
                <li>
                <label for="passwd2" class="input-tips2">确认密码：</label>
                    <div class="inputOuter2">
                        <input type="password" id="spwd2" name="pwd2" maxlength="16" class="inputstyle2" />
                    </div>
                    
                </li>
                
                <li>
                 <label for="qq" class="input-tips2">邮箱：</label>
                    <div class="inputOuter2">
                       
                        <input type="text" id="mail" name="mail" maxlength="10" class="inputstyle2"/>
                    </div>
                   
                </li>
                
                <li>
                    <div class="inputArea" style="padding-left:130px;margin-top:20px;">
                    <!-- class="button_blue" -->
                        <input  type="button" id="reg"  class="button_blue"  value="    注册     " onclick="SignUp()"/>
                    </div>
                    
                </li><div class="cl"></div>
            </ul></form>
           
    
    </div>
   
    
    </div>
    <!--注册end-->
</div>
</body>
<script type="text/javascript">
function Login(){
	var UserName=$("#username").val();
	var Pwd=$("#pwd").val();
	
	$.post("/NewEnterpriseProject/DoLogin", {"username":UserName,"pwd":Pwd},function(rst){
		if(rst == "success"){
				//alert("添加成功");
				window.location.href= "/NewEnterpriseProject/index.jsp";
		}
		else{
				alert("登录失败，账号或密码错误！");
			}
		});		
}

function SignUp(){
	var UserName=$("#susername").val();
	var Pwd=$("#spwd").val();
	var Pwd2=$("#spwd2").val();
	var Mail=$("#mail").val();
	 if(Pwd!=Pwd2)
		 {
		   alret(Pwd);
			alert("密码不一致，请重新输入！");
			
			alret(Pwd2);
		 }
	else
		{ 
			$.post("/NewEnterpriseProject/DoSignUp", {"user":UserName,"pwd":Pwd,"mail":Mail},function(rst){
				if(rst == "success"){
						alert("注册成功");
						window.location.href= "/NewEnterpriseProject/Login.jsp";
				}
				else{
						alert("注册失败，请重新注册！");
					}
				});	
	}
}
</script>
</html>