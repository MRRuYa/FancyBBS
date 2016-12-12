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
		<div class="index-div-menu1">
			<a href="index.html"><img id="index-img-logo" width="83px" height="80px" src="img/logo.png" /></a>
            <div class="index-div-ulmain">
			<ul id="index-ul-mainNav">
				<li>
					<a href="#">菜单1</a>
				</li>
				<li>
					<a href="#">菜单2</a>
				</li>
				<li>
					<a href="#">菜单3</a>
				</li>
				<li>
					<a href="#">菜单4</a>
				</li>
				<li>
					<a href="#">菜单5</a>
				</li>
				<li>
					<a href="#">菜单6</a>
				</li>
				<li>
					<a href="#">菜单7</a>
				</li>
			</ul>
            </div>
		</div>
    </div>
    <!--菜单层 end-->

  </body>
</html>
