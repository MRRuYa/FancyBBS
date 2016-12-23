<%@page import="operating.*"%>
<%@page import="entity.*"%>
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
	
	int id = Integer.parseInt(request.getParameter("id"));		//传递帖子的id
	Topic topic1 = OperatingTopic.getATopicById(id);	//通过id获取帖子
	Session session1 = OperatingSession.getSessionById(topic1.getsId());		//获取帖子所在版块
	User user1 = OperatingUser.getAUserById(topic1.getuId());	//获取发帖人user
	User user2 = OperatingUser.getAUserById(topic1.getLastReplyUseID());	//获取最后回复发帖人user
	
	List<Reply> replylist = OperatingReply.getReplyByTopic(topic1);		//获取该帖子的回帖
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
<link rel="shortcut icon" href="img/logo.png" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/login-register.css" />
<link rel="stylesheet" type="text/css" href="css/DYH.css" />

<script type="text/javascript" src="fckeditor/fckeditor.js"></script>
<!--FCKEditor-->
<script type="text/javascript">	
window.onload = function()	{
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
<script type="text/javascript">
	function checkadd() {	
		if (document.getElementById("contents").value.length == 0) {
					alert("请输入帖子内容");
					return false;
				} else {
					return true;
				}
			/*
		var topic = document.getElementById("topic").value;		//记录帖子标题
		var	 node_id = document.getElementById("node_id").value;		//记录帖子所在版块id		
		//var contnet = document.getElementById("contents");	//记录帖子内容
		//var contents = content.innerText;
		//var contnets = document.getElementById("contents").innerText;
		//var ctopic = ;		//标题约束规则
		//var content = ；		//内容约束规则

		if (topic == null || topic == '') {
			alert("请输入帖子标题");
			return false;		
		} else {
			if (node_id == -1) {
				alert("请选择帖子所在版块");
				return false;
			} else {
				if (document.getElementById("contents").value.length == 0) {
					alert("请输入帖子内容");
					return false;
				} else {
					return true;
				}
			}
		}*/
	};
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

	<div class="div-maincontainer">
		<!--中层框架 start-->
		<div class="div-content">
			<!--中层框架左边 start-->
			<div class="div-contentleft">


				<div class="div-main">	<!-- div上 -->
					<div class="div-main-head2">	<!-- 标题 -->
						<div class="div-JD-section-right">
							<a href="userhome.jsp?uId=<%=user1.getId()%>"> <img class="div-topic-img" src="<%=user1.getPhoto() %>" alt="admin">
							</a>
						</div>
						<p>
							<a href="index,jsp">首页</a> / <a href="article.jsp?sId=<%=session1.getId()%>"><%=session1.getName() %></a>
						</p>
						<h2 class="div-title div-topic-title"><%=topic1.getTopic() %></h2>
						<small class="div-JD-section-body-bottom"> 
							<span>By
								<a href="userhome.jsp?uId=<%=topic1.getLastReplyUseID()%>"><%=user1.getNickname() %></a> 
							</span>&nbsp;•&nbsp; 
							<span><%=topic1.getLastReplayTime() %></span>&nbsp;•&nbsp; 	<!-- 最后回复时间 -->
							<!-- <span><%/*topic1.getClickCount()*/ %>次点击</span> 	 点击次数 -->
							<!--  <span>• 
								<a	href="#" class="div-reply">回复</a> 
							</span> 
							<span> 
								<a href="#" title="点击收藏">收藏</a> 
							</span> -->
							</small>
					</div>		<!-- 标题 -->
					
					<div class="div-main-body">	<!-- 内容 -->
						<p><%=topic1.getContents() %></p>
					</div>	<!-- 内容 -->
					<div class="div-main-footer"></div>
				</div>	<!-- div上 -->
				
				
				<div class="div-main">	<!-- div中 -->
					<div class="div-main-head1">		<!-- 标题 -->
						<h5>
							<span><%=topic1.getReplyCount() %></span> <span> 回复 | 直到<%=topic1.getLastReplayTime() %></span>
						</h5>
					</div>		<!-- 标题 -->
					<%
						User usertemp = new User();
						int floor = 1;
						for (Reply reply : replylist) {
							usertemp = OperatingUser.getAUserById(reply.getuId());	//获取此回复的用户
					%>
					<div class="div-main-body">
						<div class="div-row">
							<div class="col-md-4">
								<a href="userhome.jsp?uId=<%=usertemp.getId()%>"> <img class="div-topic-img" src="<%=usertemp.getPhoto() %>"	 alt="<%=usertemp.getNickname()%>"> </a>
							</div>									
							<div class="col-md-5 div-topic-reply-body">
								<% 
										if (user.getId() == usertemp.getId() || user.getGrade() >1) {	//本人或管理员查看
									%>
										<div class="div-JD-section-right">	<!-- 删除按钮 -->
											<span class="div-badge div-badge-node">
											<a href="DeleteReply?id=<%=reply.getId()%>">删除</a></span>
										</div>	<!-- 删除按钮 -->
									<%
										}
									%>
								<h5>
									<span> <a href="userhome.jsp?uId=<%=usertemp.getId()%>"><%=usertemp.getNickname() %></a>&nbsp;&nbsp;<%=reply.getTime() %> </span> <span
										class="div-JD-section-right"># - <%=floor %></span>
								</h5>
								<p><%=reply.getContent() %></p>
							</div>
						</div>
					</div>
					
					<%
					floor++;
						}
					 %>
				</div>	<!-- div中 -->
				
				<div class="div-main">	<!-- div下 -->
					<div class="div-main-head1">		<!-- 标题 -->
						<h5>
							<span>回复</span>
						</h5>
					</div>		<!-- 标题 -->
					
					<div class="div-main-body">		<!-- 内容 -->
						<form action="AddReply?tId=<%=topic1.getId() %>" method="post" onSubmit="return checkadd()">
							<div class="add-form-group">
	                        	<textarea class="add-form-control" id="contents" name="contents"  rows="10" ></textarea>
	                   	 	</div>
	                   	 	<button type="submit" >回复</button>
	                   	 </form>							
					</div>		
				</div>	<!-- 内容 -->
			</div><!-- div下 -->
			<!--中层框架左边 end-->

			<!--中层框架右边 start-->
			<div class="div-contentright">
				<div class="div-main">
		        	<div class="div-main-body">
		          		<div class="div-row">
		            		<div class="col-md-1"> <a href="userhome.jsp?uId=<%=user.getId()%>"> <img class="div-article-img" src="<%=user.getPhoto() %>" /> </a> </div>
		            			<div class="col-md-2">
					              <ul class="div-list-unstyled">
					                <li><a href="userhome.jsp?uId=<%=user.getId()%>" ><%=user.getAccount() %></a></li>
					                <li>昵称：<%=user.getNickname() %></li>
					                <li>积分：<%=user.getPoint() %></li>
					                <li>权限：
					                <%
					                if(user.getGrade()==1) { %>
					                	会员
					               <%	
					                } else if (user.getGrade()==2) {
					                %>
					                	管理员
					                <%	
					                } else {
					                %>
					                	未知
					                <%
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

</body>
</html>
