<%@page import="entity.*"%>
<%@page import="operating.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	User user = OperatingUser.getAUserById(1); //默认用户，防止没有session对象传入时候出现问题
	try {
		user = (User) session.getAttribute("user"); //获取session对象
	} catch (Exception e) {
		session.setAttribute("error", "用户登陆错误");
		session.setAttribute("lastpage", "login.jsp");
		response.sendRedirect("error.jsp");
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>FancyBBS</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/login-register.css" />
<link rel="stylesheet" type="text/css" href="css/DYH.css" />
<link rel="stylesheet" type="text/css" href="css/SQY.css" />

</head>
<script type="text/javascript">
	function xianshi() {
		document.getElementById("uldown").style.display = "inline";
	}
	function yincang() {
		document.getElementById("uldown").style.display = "none";
	}
</script>
<!-- 表单验证js -->
    <script type="text/javascript">
		function checkSave() {	
			var password = document.getElementById("password").value;	//现有密码
			var password1 = document.getElementById("password1").value;	//新密码
			var password2 = document.getElementById("password2").value;	//新密码确认
			
			if (password == null || password == '') {
				alert("请输入现有密码");
				return false;
			} else {
				if (password1 == null || password2 == '') {
					alert("请输入新密码");
					return false;
				} else {
					if (password2 == null || password2 == '') {
						alert("请输入新密码");
						return false;
					} else {
						if (password2 != password1) {
							alert("两次输入的密码不正确");
							return false;
						} else {
							return true;
						}
					}
				}
			}	      	
        };
    </script>
    <!-- 表单验证js -->
<body>
	<!--菜单层 start-->
	<div class="index-div-menu">
		<div class="index-div-menu1">
			<!--菜单栏-->
			<div class="index-div-ulmain">
				<ul id="index-ul-mainNav">
					<li><a class="index-a-logo">FancyBBS</a>
					</li>
					<li><a href="index.jsp">首页</a>
					</li>
					<li><a href="node.jsp">版块</a>
					</li>
					<li><a href="add.jsp">发表</a>
					</li>
					
				</ul>
			</div>
			<div class="indec-div-ulmain2">
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown" onMouseMove="xianshi()" onMouseOut="yincang()">
						<a href="index.jsp" class="dropdown-toggle"> <%=user.getNickname()%>
							<b class="caret"></b> </a>
						<ul id="uldown" class="dropdown-menu" id="dropdown-menu"	onMouseOver="xianshi()">
							<li><a href="userhome.jsp?uId=<%=user.getId()%>">个人主页</a></li>
							<li><a href="usermessage.jsp?uId=<%=user.getId()%>">个人资料</a></li>
							<li class="divider"></li>
							<%
							if (user.getGrade() > 1) {
							%>
								<li><a href="yonghuguanli.jsp">用户管理</a></li>
								<li><a href="bankuaiguanli.jsp">版块管理</a></li>
								<li class="divider"></li>
							<%
							}
							 %>
							<li><a href="LoginOut">退出</a>
							</li>
						</ul>
				</ul>
			</div>
		</div>
	</div>
	<!--菜单层 end-->

	<div class="div-content">
		<!--中层框架 start-->
		<div class="div-contentleft">
			<!--中层框架左边 start-->
			<div class="sqy-div-panel">
				<!-- 内容开始 -->
				<div class="sqy-div-panel-heading">
					<h4>个人资料</h4>
				</div>
				<div class="sqy-div-panel-body">
					<ul class="sqy-nav">
						<li class="sqy-active">
							<a class="sqy-nav-a2" href="usermessage.jsp?uId=<%=user.getId() %>">基本信息</a></li>
						<li class="sqy-active">
							<a class="sqy-nav-a2" href="usermessage2.jsp?uId=<%=user.getId() %>">修改头像</a>
						</li>
						<li class="sqy-active">
							<a class="sqy-nav-a" >修改密码</a>
						</li>
					</ul>
					<div class="sqy-setting">
						<form action="ChangeUserPassword?uId=<%=user.getId() %>" class="sqy-form"	method="post" onSubmit="return checkSave()">
							<div class="sqy-form-group">
								<label class="sqy-col-md-2 sqy-control-label" for="password">当前密码</label>
								<div class="sqy-col-md-6">
									<input class="sqy-form-control" id="password" name="password"   size="50" type="password"> 
								</div>
							</div>
							<div class="sqy-form-group">
								<label class="sqy-col-md-2 sqy-control-label" for="password">新密码</label>
								<div class="sqy-col-md-6">
									<input class="sqy-form-control" id="password1" name="password1" size="50" type="password">
								</div>
							</div>
							<div class="sqy-form-group">
								<label class="sqy-col-md-2 sqy-control-label" for="password">密码确认</label>
								<div class="sqy-col-md-6">
									<input class="sqy-form-control" id="password2" name="password2" 	size="50" type="password"> 
								</div>
							</div>
		
							<div class="sqy-form-group">
								<div class="sqy-col-sm-offset-3 sqy-col-sm-9">
									<button type="submit" name="commit"	class="sqy-div-btn sqy-btn-primary">修改密码</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- 内容结束 -->
		</div>
		<!--中层框架左边 end-->

		<div class="div-contentright">
			<!--中层框架右边 start-->
			<div class="div-main">
				<div class="div-main-body">
					<div class="div-row">
						<div class="col-md-1">
							<a href="userhome.jsp?uId=<%=user.getId()%>"> <img
								class="div-article-img" src="<%=user.getPhoto()%>" /> </a>
						</div>
						<div class="col-md-2">
							<ul class="div-list-unstyled">
								<li><a href="userhome.jsp?uId=<%=user.getId()%>"><%=user.getAccount()%></a>
								</li>
								<li>昵称：<%=user.getNickname()%></li>
								<li>积分：<%=user.getPoint()%></li>
								<li>权限： <%
									if (user.getGrade() == 1) {
								%> 会员 <%
									} else if (user.getGrade() == 2) {
								%> 管理员 <%
									} else if (user.getGrade() == 3) {
								%> Holy!God~ <%
									} else {
								%> 未知 <%
									}
								%>
								</li>
							</ul>
						</div>
					</div>

				</div>
				<div class="div-main-footer div-JD-section-body-bottom"></div>
			</div>

			<div class="div-main">
				<div class="div-main-footer div-JD-section-body-bottom">广告</div>
				<div class="div-main-body">
					<img alt="广告" src="img/guanggao.png" width="270px" height="300px" />
				</div>
			</div>
		</div>
		<!--中层框架右边 end-->
	</div>

	<!--中层框架 end-->
</body>
</html>
