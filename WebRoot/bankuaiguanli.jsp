<%@page import="entity.*"%>
<%@page import="operating.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

User user = OperatingUser.getAUserById(1);	//默认用户，防止没有session对象传入时候出现问题
try {
	user = (User)session.getAttribute("user");		//获取session对象
} catch (Exception e) {
	session.setAttribute("error", "用户登陆错误");
	session.setAttribute("lastpage", "login.jsp");
	
	response.sendRedirect("error.jsp");
}

List<Session> sessionlist = OperatingSession.getAllSession();
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
			var name = document.getElementById("name").value;	//记录板块名字
			var profile = document.getElementById("profile").value;	//记录板块名字
			
			if (name == null || name == '') {
				alert("请输入版块名称");
				return false;
			}else {
				if (profile == null || profile == '') {
					alert("请输入版块主题");
					return false;
				} else {
					return true;
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
					<li><a class="index-a-logo">FancyBBS</a></li>
					<li><a href="index.jsp">首页</a></li>
					<li><a href="node.jsp">版块</a></li>
					<li><a href="add.jsp">发表</a></li>

				</ul>
			</div>
			<div class="indec-div-ulmain2">
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown" onMouseMove="xianshi()" onMouseOut="yincang()">
						<a href="index.jsp" class="dropdown-toggle"> <%=user.getNickname()%>
							<b class="caret"></b> </a>
						<ul id="uldown" class="dropdown-menu" id="dropdown-menu"
							onMouseOver="xianshi()">
							<li><a href="userhome.jsp?uId=<%=user.getId()%>">个人主页</a>
							</li>
							<li><a href="usermessage.jsp?uId=<%=user.getId()%>">个人资料</a>
							</li>
							<li class="divider"></li>
							<%
								if (user.getGrade() > 1) {
							%>
							<li><a href="yonghuguanli.jsp">用户管理</a>
							</li>
							<li><a href="bankuaiguanli.jsp">版块管理</a>
							</li>
							<li class="divider"></li>
							<%
								}
							%>
							<li><a href="LoginOut">退出</a></li>
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

			<div class="div-main">
				<div class="div-main-head1 div-title">板块信息</div>
				<div class="div-main-body">
					<table>
						<tr>
							<td>板块ID</td>
							<td>版块名字</td>
							<td>版块主题</td>
							<td>发帖数</td>
							<td>操作</td>
						</tr>
						<%
							for (Session sessiontemp : sessionlist) {

								/*
								for (int i=0; i<userlist.size(); i++) {
									User usertemp = new User();	//
									usertemp = userlist.get(i);	//userlist[i]*/
						%>
						<tr>
							<td><%=sessiontemp.getId()%></td>
							<td><%=sessiontemp.getName()%></td>
							<td><%=sessiontemp.getProfile()%></td>
							<td><%=sessiontemp.getTopicCount()%></td>
							<td><a href="DeleteSession?sId=<%=sessiontemp.getId()%>">删除</a>
							</td>
						</tr>
						<%
							}
						%>
					</table>
				</div>
			</div>

		</div>
		<!--中层框架左边 end-->
		<div class="div-contentright">
			<!--中层框架右边 start-->
			<div class="div-main">
				<div class="div-main-head1 div-title">添加版块</div>
				<div class="div-main-body">
					<div class="sqy-setting">
						<form class="sqy-form" action="AddSession" method="post"
							onSubmit="return checkSave()">
							<div class="sqy-form-group">
								<label class="sqy-col-md-2 sqy-control-label" for="name">板块名字</label>
								<div class="sqy-col-md-6">
									<input class="sqy-form-control" id="name" name="name" size="50"
										type="text" />
								</div>
							</div>

							<div class="sqy-form-group">
								<label class="sqy-col-md-2 sqy-control-label" for="profile">版块内容</label>
								<div class="sqy-col-md-6">
									<input class="sqy-form-control" id="profile" name="profile"
										size="50" type="text" />
								</div>
							</div>

							<div class="sqy-form-group">
								<div class="sqy-col-md-6">
									<button type="submit" class="sqy-div-btn sqy-btn-primary">添加版块</button>
								</div>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
		<!--中层框架右边 end-->
	</div>
	<!--中层框架 end-->
</body>
</html>
