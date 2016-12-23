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

  </head>
 	<script type="text/javascript">
		function xianshi() {
			document.getElementById("uldown").style.display = "inline";
		}
		function yincang() {
			document.getElementById("uldown").style.display = "none";
		}
	</script>
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
	
	<div class="div-content">	<!--中层框架 start-->
		<div class="div-contentleft">	<!--中层框架左边 start-->
		</div>	<!--中层框架左边 end-->
		<div class="div-contentright">	<!--中层框架右边 start-->	
		</div>	<!--中层框架右边 end-->
	</div>	<!--中层框架 end-->
  </body>
</html>
