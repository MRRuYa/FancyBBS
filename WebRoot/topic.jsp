<%@page import="operating.OperatingReply"%>
<%@page import="entity.Reply"%>
<%@page import="operating.OperatingSession"%>
<%@page import="entity.Session"%>
<%@page import="operating.OperatingTopic"%>
<%@page import="entity.Topic"%>
<%@page import="operating.OperatingUser"%>
<%@page import="entity.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";

	int id = Integer.parseInt(request.getParameter("id"));		//传递帖子的id
	Topic topic1 = OperatingTopic.getAllTopicById(id);	//获取当前topic对象
	Session session1 = OperatingSession.getSessionById(topic1.getsId());		//获取帖子所在版块
	User user1 = OperatingUser.getAUserById(topic1.getuId());	//获取发帖人user
	User user2 = OperatingUser.getAUserById(topic1.getLastReplyUseID());	//获取最后回复发帖人user
	
	List<Reply> replylist = OperatingReply.getReplyByTopic(topic1);		//获取该帖子的回帖
	
	User user = OperatingUser.getAUserById(2); 	//test user
	//User user = (User)session.getAttribute("user");		//获取当前USER对象
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

<script type="text/javascript" src="fckeditor/fckeditor.js"></script>
<!--FCKEditor-->
<script type="text/javascript">	window.onload = function()	{
		// Automatically calculates the editor base path based on the _samples directory.
		// This is usefull only for these samples. A real application should use something like this:
		// oFCKeditor.BasePath = '/fckeditor/' ;	// '/fckeditor/' is the default value.
		
		//var sBasePath = document.location.href.substring(0,document.location.href.lastIndexOf('_samples')) ;
		var sBasePath = "<%=basePath + "fckeditor/"%>";
		var oFCKeditor = new FCKeditor('contents');
		oFCKeditor.ToolbarSet = "DjDesign"; //自定义的ui
		oFCKeditor.Height = 300;
		oFCKeditor.BasePath = sBasePath;
		oFCKeditor.ReplaceTextarea();
	}
</script>
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
			<div class="div-contentleft">
				<!--中层框架左边 start-->
				<div class="div-main">
					<div class="div-main-head2">
						<!-- 顶部标题 -->
						<div class="div-JD-section-right">	<!-- 用户头像 -->
							<a href="userhome.jsp?uId=<%=user1.getId()%>"> <img class="div-topic-img" src="<%=user1.getPhoto() %>" alt="<%=user1.getNickname() %>">
							</a>
							</div>
							<p>	<!-- 所在版块 -->
							<a href="index.jsp">首页</a> / <a href="article.jsp?sId=<%=session1.getId()%>"><%=session1.getName() %></a>
						</p>
						<h2 class="div-title div-topic-title"><%=topic1.getTopic() %></h2>	<!-- 帖子标题 -->
						<small class="div-JD-section-body-bottom"> 
							<span>By	<!-- 发帖人昵称 -->
								<a href="userhome.jsp?uId=<%=user1.getId()%>"><%=user1.getNickname() %></a> 
							</span>&nbsp;•&nbsp; 
							<span><%=topic1.getTime() %></span>&nbsp;•&nbsp; <!-- 发帖时间 -->
							<span><%=topic1.getClickCount() %></span> 	<!-- 点击量 -->
							<span>• <a href="#" class="div-reply">回复</a> </span> <span> <a href="#"
								title="点击收藏">收藏</a> </span> </small>
					</div>

					<div class="div-main-body">
						<!-- 内容 -->
						<p><%=topic1.getContents() %></p>
						<p class="div-topic-tag">
						
							<a href="#">undefined</a>&nbsp; <a href="#">下一步</a>&nbsp; <a
								href="#">收件箱</a>&nbsp; <a href="#">用户组</a>&nbsp;
						</p>
					</div>

					<div class="div-main-footer"></div>
				</div>


				<div class="div-main">
					<!-- 回复表 -->
					<div class="div-main-head1">		<!-- 标题 -->
						<h5>
							<span><%=topic1.getReplyCount() %></span> 
							<span> 回复 | 直到<%=topic1.getLastReplayTime() %></span> 
							<a	href="#" class="div-JD-section-right"> 
								<span	class="div-JD-section-body-bottom">添加回复</span> 
							</a>
						</h5>
					</div>
					
					<div class="div-main-body">		<!-- 内容 -->
						<%
						User usertemp = new User();	//用于保存回复表中的用户
						for (Reply reply : replylist) {
							usertemp = OperatingUser.getAUserById(reply.getuId());
						%>
						
						<div class="div-row">
							<div class="col-md-4">	<!-- 用户头像 -->
								<a href="userhome.jsp?uId=<%=usertemp.getId()%>"> <img class="div-topic-img" src="<%=user1.getPhoto() %>"	 alt="<%=user1.getNickname() %>"> </a>
							</div>
							<div class="col-md-5 div-topic-reply-body">
								<h5>
									<span> 
										<a href="userhome.jsp?uId=<%=usertemp.getId()%>"><%=usertemp.getNickname() %></a><!-- 回复人 -->
										&nbsp;&nbsp;
										<%=reply.getTime() %> <!-- 回复时间 -->
									</span> 
									<span	class="div-JD-section-right">#1 - 
										<a href="#"	class="clickable">回复</a> </span>
								</h5>
								<p><%=reply.getContent() %></p>
							</div>
						</div>
						<%						
						}
						%>
						
						
						<div class="div-row">
							<div class="col-md-4">
								<a href="#"> <img class="div-topic-img" src="#"	alt="diguotravel_avatar"> </a>
							</div>
							<div class="col-md-5 div-topic-reply-body">
								<h5>
									<span> <a href="#">diguotravel</a>&nbsp;&nbsp;8 天前 </span> <span
										class="div-JD-section-right">#1 - <a href="#"
										class="clickable">回复</a> </span>
								</h5>
								<p>确实不错的一个系统。希望能够一直更新下去。。。。</p>
							</div>
						</div>
						
					</div>
				</div>

				<div class="div-main">
					<!-- 回复框 -->
					<div class="div-main-head1">
						<h5>
							<span>回复</span>
						</h5>
					</div>
					<div class="div-main-body">
						<form action="AddReply" method="post" onSubmit="return checkadd()">
							<div class="add-form-group">
								<textarea class="add-form-control" id="contents" name="contents"
									rows="10"></textarea>
								<button type="submit">创建</button>
							</div>

						</form>
					</div>
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
</body>
</html>
