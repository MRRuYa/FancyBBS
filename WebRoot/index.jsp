<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>FancyBBS</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="FancyBBS,BBS,论坛">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  
  <body>
  	<!--菜单层 start-->
  	<div class="index-div-menu">
		<div class="index-div-menu1">	<!--菜单栏-->
            <div class="index-div-ulmain">
			<ul id="index-ul-mainNav">
				<li>
					<a class="index-a-logo" href="#">FancyBBS</a>
				</li>
				<li>
					<a href="#">首页</a>
				</li>
				<li>
					<a href="#">版块</a>
				</li>
				<li>
					<a href="#">发表</a>
				</li>
				<li>
					<a href="#">菜单5</a>
				</li>
				<li>
					<a href="#">菜单6</a>
				</li>
			</ul>
            </div>
            
            <div class="index-div-control1">	<!--搜索按钮-->
            	<form>
                	<input class="index-form-control1" type="text" placeholder="输入关键字回车"/>
                </form>
            </div>
            
            <div class="indec-div-ulmain2">
                <ul id="index-ul-reandlo">		<!--登录注册-->
                    <li><a href="#">登录</a></li>
                    <li><a href="#">注册</a></li>
                </ul>
            </div>
            
		</div>
    </div>
    <!--菜单层 end-->
    
    <!--内容 start-->
    
    <!--内容 end-->
    <div class="index-content-div">
    </div>

	<!--底部	 start-->    
    <div class="index-div-bottommian">
        <div class="index-div-bottom">
         	Copyright &copy 2016 <br/>	
           <a href="#">关于我们FancyBBS</a> 
           <a href="#">免责声明</a> 
           <a href="#">付费服务</a>  
           <a href="#">联系我们</a> 
           <a href="#">商业授权</a>  
           <a href="#">赞助开发</a><br/>
           FancyBBS<a href="#">网站统计</a>
           QQ群XXXX鲁IC备XXX号<br/>
           Powered by FancyBBS 页面执行时间
        </div>
	</div>
	<!--底部	 end-->   

  </body>
</html>
