<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>FancyBBS|登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="shortcut icon" href="img/logo.png" /> 
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="stylesheet" type="text/css" href="css/login-register.css" />

    <style>
		p.p-landr-tipmessage {	/*提示消息*/
			margin: 0px auto;
			color: #F00;
			font-size: 15px;
			position: relative; top: 10px;
		}
	</style>
  </head>
  
  <body>
    <!--菜单层 start-->
	<div class="index-div-menu">
	    <div class="index-div-menu1"> <!--菜单栏-->
	        <div class="index-div-ulmain">
	            <ul id="index-ul-mainNav">
	                <li> <a class="index-a-logo" href="#">FancyBBS</a> </li>
	                <li> <a href="index.jsp">首页</a> </li>
	                <li> <a href="node.jsp">版块</a> </li>
	                <li> <a href="add.jsp">发表</a> </li>
	            </ul>
	        </div>
	        <div class="index-div-control1"> <!--搜索按钮-->
	            <form>
	                <input class="index-form-control1" type="text" placeholder="输入关键字回车"/>
	            </form>
	        </div>
	        <div class="indec-div-ulmain2">
	            <ul id="index-ul-reandlo">
	                <!--登录注册-->
	                <li><a href="login.jsp">登录</a></li>
	                <li><a href="register.jsp">注册</a></li>
	            </ul>
	        </div>
	    </div>
	</div>
	<!--菜单层 end--> 
  
  	<!--登录 start-->
    <div class="div-container">	 <!--container 框架-->
   		<div class="div-loginandregister-adiv">
    		<a id="a-header">登录</a>           
        	<a id="a-header1" href="register.jsp">注册</a>
        </div>
        
    	<div class="div-loginandregister-main">		<!--form控件-->
        <form id="form1" name="form1" method="post" action="CheckLogin" onSubmit="return checklogin()">
        	<div class="div-logininandregister-inputmain">		<!--用户名-->
            	<label id="loginlable1">用户名</label>
                <input name="account" id="login-account" type="text" placeholder="请输入用户名" />
            </div>
            
            <div class="div-logininandregister-inputmain" >	<!--密码-->
            	<label id="loginlable1">密码</label>
                <a id="a-loginin-password" href="#">忘记密码?</a>
                <input name="password" id="login-password" type="password" placeholder="请输入密码" />
            </div>
            
            <div class="div-logininandregister-inputmain" >	<!--验证码-->
            	<label id="loginlable1">验证码</label>
                <input name="vcode" id="login-vcode" width="80px"  type="text" placeholder="点击图片刷新" />
                <a href="login.jsp"><img id="rc" src="GetCaptcha" nclick="changeCode()" title="看不清？单击换一张图片" alt="点击更换"/></a>
                <div id="yzm1" style="width:10" style="display:none"></div>	<!-- 隐藏层 -->            
				
                <p name="tipmessage" id="tipmessage" class="p-landr-tipmessage"><%=(String)session.getAttribute("vcode")%>test</p>	<!--提示信息-->
            </div>
            <!--  
            <div class="div-logininandregister-other">	
            	<input type="checkbox" name="rememberpassword" />记住密码
            </div>
            -->
            <div class="div-loginin-submit">	<!--提交按钮-->
            	<button name="submit" id="div-loginin-submit1" type="submit">登&nbsp;&nbsp;录</button>
            </div>
            
        </form>
        </div>
    </div>
    <!--登录 end-->
    
    <!--底部	 start-->    
    <div class="index-div-bottommian">
        <div class="index-div-bottom">
         	Copyright &copy 2016 <br/>	
           <span><a href="#">关于我们FancyBBS</a></span>|
           <span><a href="#">免责声明</a></span>| 
           <span><a href="#">付费服务</a></span>| 
           <span><a href="#">联系我们</a></span>|
           <span><a href="#">商业授权</a></span>|
           <span><a href="#">赞助开发</a></span>|<br/>
           FancyBBS<a href="#">网站统计</a>|
           QQ群XXXX鲁IC备XXX号<br/>
           Powered by FancyBBS 页面执行时间
        </div>
	</div>
	<!--底部	 end-->  
  
  </body>
</html>

<script type="text/javascript">
		function checklogin() {
			var vcode="";		  
			 //发送 ajax get方式的请求
			 //1、创建xhr
			 var xhr;
			 if(window.XMLHttpRequest){
			 //webkit
			 xhr = new XMLHttpRequest();
			 }else{
			 xhr = new ActiveXObject("Microsoft.XMLHTTP");
			 }
			 //2.发送请求并传递参数
			 
			 xhr.open("GET","getSession");
			 xhr.send();
			 //3.处理响应
			 xhr.onreadystatechange=function(){
			 //处理正确且完整响应

				if(xhr.readyState==4 && xhr.status==200){
				vcode= xhr.responseText;
				alert(vcode);
				}			 
			 }
		
			var account = document.getElementById("login-account").value;		//记录用户名
			var password = document.getElementById("login-password").value;		//记录密码
			var vcodeget = document.getElementById("login-vcode").value;		//记录验证码
			
			var message = document.getElementById("tipmessage");
			alert(vcodeget + "huoqu");
          	if(account == null || account == '') {
          		alert("请输入用户名!");
          		return false;              
           	} else {
           		if(password == null || password == '') {
           			alert("请输入登录密码!");
           			return false;	                
         		} else {
	         		if(vcodeget == null || vcodeget == '') {
	         			alert("请输入验证码!");
	         			return false;
					} else {
						if(vcodeget.is(vcodet)) {
							alert("验证码不正确!");
		                	return false;
		                } else {
		                	return true;
		                }
		           
					}
         		}
           	}
           	

           	
        };
    </script>
