<%@page import="entity.*"%>
<%@page import="operating.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
	
	User user = OperatingUser.getAUserById(1);	//默认用户，防止没有session对象传入时候出现问题
	try {
		user = (User)session.getAttribute("user");		//获取session对象
	} catch (Exception e) {
		session.setAttribute("error", "用户登陆错误");
		session.setAttribute("lastpage", "login.jsp");
		
		response.sendRedirect("error.jsp");
	}

	List<Topic> list = OperatingTopic.getAllTopic();
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

	<div class="div-maincontainer">
		<!--中层框架 start-->
		<div class="div-content">
			<!--中层框架左边 start-->
			<div class="div-contentleft">
				<div class="div-main">
					<!-- 下div -->
					<div class="div-main-head1">
						<!-- 标题 -->
						<h3 class="div-title">欢迎访问FancyBBS开源微社区</h3>
					</div>

					<%
						for (Topic topic : list) {
							User user2 = OperatingUser.getAUserById(topic.getuId()); //获取发帖人
							Session session2 = OperatingSession.getSessionById(topic.getsId()); //获取topic所在session						
							if (topic.getFlag() == 1) { //先输出置顶
					%>
					<div class="div-main-body">
						<!-- 内容 -->
						<div class="div-JD-list">
							<div class="div-JD-section-first">
								<%
									if (user.getGrade() > 1) { //管理员可以取消置顶
								%>
								<div class="div-JD-section-right">
									<!-- 删除按钮 -->
									<span class="div-badge div-badge-node"> <a
										href="CancelTopTopic?tId=<%=topic.getId()%>">取消</a>
									</span>
								</div>
								<!-- 删除按钮 -->
								<%
									}
								%>
								<%
									if (user.getGrade() > 1 || user.getId() == user2.getId()) { //本人和管理员可以删除
								%>
								<div class="div-JD-section-right">
									<!-- 删除按钮 -->
									<span class="div-badge div-badge-node"> <a
										href="DeleteTopic?tId=<%=topic.getId()%>">删除</a>
									</span>
								</div>
								<!-- 删除按钮 -->
								<%
									}
								%>
								<a class="div-JD-section-left"
									href="userhome.jsp?uId=<%=user2.getId()%>"> <img
									class="div-JD-img" src="<%=user2.getPhoto()%>" alt="admin" />
									<!-- 用户头像 --> </a>
								<div class="div-JD-section-body">
									<h4 class="div-JD-section-body-head">
										<a href="topic.jsp?id=<%=topic.getId()%>"><%=topic.getTopic()%></a>
										<!-- 帖子标题 -->
										<%
											if (topic.getFlag() == 1) {
										%>
										<span class="div-badge div-badge-node">置顶</span>
										<%
											}
										%>
									</h4>
									<p class="div-JD-section-body-bottom">
										<!-- 获取topic所在session -->
										<span> <a href="article.jsp?sId=<%=session2.getId()%>"><%=session2.getName()%>
												<!-- 版块标题 -->
										</span>&nbsp;•&nbsp; <span> <a
											href="userhome.jsp?uId=<%=user2.getId()%>"><%=user2.getNickname()%></a>
											<!-- 用户 --> </span>&nbsp;•&nbsp; <span><%=topic.getLastReplayTime()%></span>&nbsp;•&nbsp;
										<!-- 最后用户 -->
										<span>最后回复来自 <a
											href="userhome.jsp?uId=<%=topic.getLastReplyUseID()%>"><%=OperatingUser.getAUserById(topic.getLastReplyUseID()).getNickname()%></a> </span>
									</p>
								</div>
							</div>
						</div>
					</div>
					<%
						}
						}
					%>
					<%
						for (Topic topic : list) {
							User user2 = OperatingUser.getAUserById(topic.getuId()); //获取发帖人
							Session session2 = OperatingSession.getSessionById(topic.getsId()); //获取topic所在session
							if (topic.getFlag() == 0) { //正常帖子排序
					%>
					<div class="div-main-body">
						<!-- 内容 -->
						<div class="div-JD-list">
							<div class="div-JD-section-first">
								<%
									if (user.getGrade() > 1) { //管理员可以置顶
								%>
								<div class="div-JD-section-right">
									<!-- 置顶按钮 -->
									<span class="div-badge div-badge-node"> <a
										href="TopTopic?tId=<%=topic.getId()%>">置顶</a>
									</span>
								</div>
								<!-- 置顶按钮 -->
								<%
									}
								%>
								<%
									if (user.getGrade() > 1 || user.getId() == user2.getId()) { //本人可以删除
								%>
								<div class="div-JD-section-right">
									<!-- 删除按钮 -->
									<span class="div-badge div-badge-node"> <a
										href="DeleteTopic?tId=<%=topic.getId()%>">删除</a>
									</span>
								</div>
								<!-- 删除按钮 -->
								<%
									}
								%>
								<a class="div-JD-section-left"
									href="userhome.jsp?uId=<%=user2.getId()%>"> <img
									class="div-JD-img" src="<%=user2.getPhoto()%>" alt="admin" />
									<!-- 用户头像 --> </a>
								<div class="div-JD-section-body">
									<h4 class="div-JD-section-body-head">
										<a href="topic.jsp?id=<%=topic.getId()%>"><%=topic.getTopic()%></a>
										<!-- 帖子标题 -->
										<%
											if (topic.getFlag() == 1) {
										%>
										<span class="div-badge div-badge-node">置顶</span>
										<%
											}
										%>
									</h4>
									<p class="div-JD-section-body-bottom">
										<!-- 获取topic所在session -->
										<span> <a href="article.jsp?sId=<%=session2.getId()%>"><%=session2.getName()%>
												<!-- 版块标题 -->
										</span>&nbsp;•&nbsp; <span> <a
											href="userhome.jsp?uId=<%=user2.getId()%>"><%=user2.getNickname()%></a>
											<!-- 用户 --> </span>&nbsp;•&nbsp; <span><%=topic.getLastReplayTime()%></span>&nbsp;•&nbsp;
										<!-- 最后用户 -->
										<span>最后回复来自 <a
											href="userhome.jsp?uId=<%=topic.getLastReplyUseID()%>"><%=OperatingUser.getAUserById(topic.getLastReplyUseID()).getNickname()%></a>
										</span>
									</p>
								</div>
							</div>
						</div>
					</div>
					<%
						}
						}
					%>
				</div>
			</div>
			<!--中层框架左边 end-->

			<!--中层框架右边 start-->
			<div class="div-contentright">
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
		</div>
		<!--中层框架右边 end-->
	</div>
	<!--中层框架 end-->

	<!--底部	
		<div class="index-div-bottommian1">
			<div class="index-div-bottom">
				Copyright &copy 2016 <br /> <span><a href="#">关于我们FancyBBS</a>
				</span>| <span><a href="#">免责声明</a> </span>| <span><a href="#">付费服务</a>
				</span>| <span><a href="#">联系我们</a> </span>| <span><a href="#">商业授权</a>
				</span>| <span><a href="#">赞助开发</a> </span>| <br /> FancyBBS<a href="#">网站统计</a>|
				QQ群XXXX鲁IC备XXX号<br /> Powered by FancyBBS 页面执行时间
			</div>
		</div>
		底部	 end-->
	</div>
</body>
</html>
