<%@page import="operating.OperatingUser"%>
<%@page import="entity.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	User user = OperatingUser.getAUserById(1); //test user
	//User user = (User) session.getAttribute("user");
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
<link rel="shortcut icon" href="img/logo.png" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/login-register.css" />
<link rel="stylesheet" type="text/css" href="css/DYH.css" />

<script type="text/javascript">
	function xianshi() {
		document.getElementById("uldown").style.display = "inline";
	}
	function yincang() {
		document.getElementById("uldown").style.display = "none";
	}
</script>
</head>

<body>
	<!--菜单层 start-->
	<div class="index-div-menu">
		<div class="index-div-menu1">
			<!--菜单栏-->
			<div class="index-div-ulmain">
				<ul id="index-ul-mainNav">
					<li><a class="index-a-logo" >FancyBBS</a></li>
					<li><a href="index.jsp.">首页</a></li>
					<li><a href="node.jsp">版块</a></li>
					<li><a href="add.jsp">发表</a></li>
				</ul>
			</div>
			<div class="index-div-control1">
				<!--搜索按钮-->
				<form>
					<input class="index-form-control1" type="text" placeholder="输入关键字回车" />
				</form>
			</div>
			<div class="indec-div-ulmain2">
				<ul class="nav navbar-nav navbar-right">
					<li><a href=""><span class="glyphicon glyphicon-envelope"></span>
					</a>
					</li>
					<li class="dropdown" onMouseMove="xianshi()" onMouseOut="yincang()">
					<a href="index.jsp" class="dropdown-toggle" >
						<%=user.getAccount() %>
						<b class="caret"></b>
					</a>
						<ul id="uldown" class="dropdown-menu" id="dropdown-menu" onMouseOver="xianshi()">
							<li><a href="userhome.jsp?uId=<%=user.getId()%>">个人主页</a>
							</li>
							<li><a href="usermessage.jsp?uId=<%=user.getId()%>">个人资料</a>
							</li>
                            <li class="divider"></li>
							<li><a href="LoginOut">退出</a></li>
						</ul>
				</ul>
			</div>
		</div>
	</div>
	<!--菜单层 end-->

	<div class="div-maincontainer">
		<!--中层框架 start-->
		<div class="div-content">
			<!--中层框架左边 start-->
			<div class="div-contentleft">

				<div class="div-main">
					<!-- 用户信息 -->

					<div class="div-main-body">biaoti</div>
				</div>

				<div class="div-main">
					<!-- 最近创建的主题 -->
					<div class="div-main-head1">最近创建的主题</div>
					<div class="div-main-body">biaoti</div>
				</div>

				<div class="div-main">
					<!--最近回复的主题  -->
					<div class="div-main-head1">最近回复的主题</div>
					<div class="div-main-body">biaoti</div>
				</div>
			</div>
			<!--中层框架左边 end-->

			<!--中层框架右边 start-->
			<div class="div-contentright"></div>
			<!--中层框架右边 end-->
		</div>
		<!--中层框架 end-->

		<!--底部	 start-->
		<div class="index-div-bottommian1">
			<div class="index-div-bottom">
				Copyright &copy 2016 <br /> <span><a href="#">关于我们FancyBBS</a>
				</span>| <span><a href="#">免责声明</a> </span>| <span><a href="#">付费服务</a>
				</span>| <span><a href="#">联系我们</a> </span>| <span><a href="#">商业授权</a>
				</span>| <span><a href="#">赞助开发</a> </span>| <br /> FancyBBS<a href="#">网站统计</a>|
				QQ群XXXX鲁IC备XXX号<br /> Powered by FancyBBS 页面执行时间
			</div>
		</div>
		<!--底部	 end-->
	</div>
</body>
</html>
