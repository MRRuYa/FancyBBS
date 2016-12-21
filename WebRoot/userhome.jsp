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
					<li><a class="index-a-logo">FancyBBS</a></li>
					<li><a href="index.jsp.">首页</a></li>
					<li><a href="node.jsp">版块</a></li>
					<li><a href="add.jsp">发表</a></li>
				</ul>
			</div>
			<div class="index-div-control1">
				<!--搜索按钮-->
				<form>
					<input class="index-form-control1" type="text"
						placeholder="输入关键字回车" />
				</form>
			</div>
			<div class="indec-div-ulmain2">
				<ul class="nav navbar-nav navbar-right">
					<li><a href=""><span class="glyphicon glyphicon-envelope"></span>
					</a>
					</li>
					<li class="dropdown" onMouseMove="xianshi()" onMouseOut="yincang()">
						<a href="index.jsp" class="dropdown-toggle"> <%=user.getAccount()%>
							<b class="caret"></b> </a>
						<ul id="uldown" class="dropdown-menu" id="dropdown-menu"
							onMouseOver="xianshi()">
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

				<div class="div-main">	<!-- 上div -->					
					<div class="div-main-body">
						<div class="div-xx-row">
							<div class="col-md-6">
								<img class="div-xx-img div-xx-img-responsive" src="#" alt="#">
							</div>
							<div class="col-md-7">
								<h4><%=user.getNickname() %></h4>
								<p class="div-JD-section-body-bottom">
									<small><%=user.getNickname() %>是第<%=user.getId() %>号会员，加入于<%=user.getRegistrationdate() %></small>
								</p>
								<p>签名：</p>
								<p>
									个人主页： <a href=""></a>
								</p>
								<p>所在地：</p>
							</div>
							<div class="col-md-8"></div>
							<div class="col-md-9">
								<p></p>
							</div>
						</div>
					</div>
				</div>	<!-- 上div -->

				<div class="div-main">	<!-- 中div -->
					<div class="div-main-head1">
						<h3 class="div-title">
							<small>最近发表的帖子</small>
						</h3>
					</div>
					<div class="div-main-body">
						<ul class="div-JD-list">
							<li class="div-JD-section-first">
								<div class="div-JD-section-right">
									<span class="div-badge div-badge-node">2</span>
								</div>
								<div class="div-JD-section-body">
									<h4 class="div-JD-section-body-head">
										<a href="#" class="div-xinxi-mune">新会员TEXT</a>
									</h4>
									<p class="div-small">
										<span> <a href="#">程序发布</a> </span>&nbsp;•&nbsp; <span>15
											天前</span>&nbsp;•&nbsp; <span>最后回复来自 <a href="#">Dj7511</a> </span>
									</p>
								</div></li>
						</ul>
						<ul class="div-xx-pagination"></ul>
					</div>
				</div>	<!-- 中div -->
				

				<div class="div-main">	<!-- 下div -->					
					<div class="div-main-head1">
						<h3 class="div-title">
							<small>最近的回复</small>
						</h3>
					</div>
					<div class="div-main-body">
						<ul class="div-JD-list">
							<li class="div-JD-section-first div-xinxi-reply">
								<div class="div-JD-section-body">
									<h4 class="div-JD-section-body-head">
										<small>回复了 </small> <a href="#" title="DJ7511">DJ7511</a> <small>创建的主题
										</small> <a href="#">新会员TEXT</a>
									</h4>
									<blockquote>
										text<br /> <small>--15天前</small>
									</blockquote>
								</div></li>
						</ul>
					</div>
				</div>	<!-- 下div -->
				
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
