<%@page import="operating.*"%>
<%@page import="entity.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
	User user = (User) session.getAttribute("user");
	
	//获取user
	int uId = Integer.parseInt(request.getParameter("uId"));
	User lookuser = OperatingUser.getAUserById(uId); 	
	
	List<Topic> topics = OperatingTopic.getAllTopicByAUser(user);
	List<Reply> replies = OperatingReply.getAllReplyByAUser(user);
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

				<div class="div-main">	<!-- 上div -->					
					<div class="div-main-body">
						<div class="div-xx-row">
							<div class="col-md-6">
								<img class="img-djtest-userhome" src="<%=lookuser.getPhoto() %>" width="65px" height="65px"/>
							</div>
							<div class="col-md-7">
								<h4><%=lookuser.getAccount()%></h4>
								<p class="div-JD-section-body-bottom">
									<%=lookuser.getNickname() %>是第<%=lookuser.getId() %>号会员，加入于<%=lookuser.getRegistrationdate() %>
								</p>
								<p>昵称：<%=lookuser.getNickname() %></p>
								<p>性别：<%=lookuser.getSex() %></p>
								<p>email：<%=lookuser.getEmail() %></p>
								
							</div>
							<div class="col-md-8"></div>
							<div class="col-md-9">
								<p></p>
							</div>
						</div>
					</div>
				</div>	<!-- 上div -->

				<div class="div-main">	<!-- 中div -->
					<div class="div-main-head1">		<!-- 标题 -->
						<h3 class="div-title">
							<small>最近发表的帖子</small>
						</h3>
					</div>	<!-- 标题 -->
					<%
						for (Topic topic:topics) {
							Session session2 = OperatingSession.getSessionById(topic.getsId());	//获取帖子所的版块
							User user2 = OperatingUser.getAUserById(topic.getuId());		//获取帖子的发帖人
							User user3 = OperatingUser.getAUserById(topic.getLastReplyUseID());	//获取帖子的最后的发帖人
					%>
					
					<div class="div-main-body">	<!-- 帖子内容 -->
						<ul class="div-JD-list">
							<li class="div-JD-section-first">
								<%
									if (user.getGrade() > 1 && topic.getFlag() != 1) {
								%>
								<div class="div-JD-section-right">	<!-- 置顶按钮 -->
									<span class="div-badge div-badge-node">
									<a href="TopTopic?tId=<%=topic.getId()%>">置顶</a></span>
								</div>	<!-- 置顶按钮 -->
								<%
									}
								%>	
								<%
									if (user.getGrade() > 1 && topic.getFlag() == 1) {
								%>
								<div class="div-JD-section-right">	<!-- 置顶按钮 -->
									<span class="div-badge div-badge-node">
									<a href=CancelTopTopic?tId=<%=topic.getId()%>">取消</a></span>
								</div>	<!-- 置顶按钮 -->
								<%
									}
								%>	
								<%
									if (user.getId() == lookuser.getId() || user.getGrade() >1) {	//本人或管理员查看
								%>
									<div class="div-JD-section-right">	<!-- 删除按钮 -->
										<span class="div-badge div-badge-node">
										<a href="DeleteTopic?tId=<%=topic.getId()%>">删除</a></span>
									</div>	<!-- 删除按钮 -->
								<%
									}
								%>
							
								<div class="div-JD-section-right">
									<span class="div-badge div-badge-node"><%=topic.getReplyCount() %></span>	<!-- 回复数 -->
								</div>
								<div class="div-JD-section-body">
									<h4 class="div-JD-section-body-head">
										<a href="topic.jsp?id=<%=topic.getId() %>" class="div-xinxi-mune"><%=topic.getTopic() %></a>	<!-- 贴子标题 -->
									</h4>
										<%
											if (topic.getFlag() == 1) {
										%>
												<span class="div-badge div-badge-node">置顶</span>
										<%
											}
										 %>
									<p class="div-small">
										<span> <a href="article.jsp?sId=<%=session2.getId()%>"><%=session2.getName() %></a> </span>&nbsp;•&nbsp; <span><%=topic.getTime() %>
											</span>&nbsp;•&nbsp; <span>最后回复来自 <a href="userhome.jsp?uId=<%=user3.getId()%>"><%=user3.getNickname() %></a> </span>
									</p>
								</div></li>
						</ul>
						<ul class="div-xx-pagination"></ul>
					</div>	<!-- 帖子内容 -->
					
					<% 
						}
					 %>
				</div>	<!-- 中div -->
				

				<div class="div-main">	<!-- 下div -->					
					<div class="div-main-head1">
						<h3 class="div-title">
							<small>最近的回复</small>
						</h3>
					</div>
					
					<%
						for (int i=0; i<(replies.size()>5?5:replies.size()); i++) {
						Reply reply = replies.get(i);
						Topic topic2 = OperatingTopic.getATopicById(reply.gettId());	//获取回复的主贴
						User user2 = OperatingUser.getAUserById(topic2.getuId());	//获取回复主贴的创建用户
						
						
					%>
					<div class="div-main-body">
						<ul class="div-JD-list">
							<li class="div-JD-section-first div-xinxi-reply">
								<div class="div-JD-section-body">
									<% 
										if (user.getId() == lookuser.getId() || user.getGrade() >1) {	//本人或管理员查看
									%>
										<div class="div-JD-section-right">	<!-- 删除按钮 -->
											<span class="div-badge div-badge-node">
											<a href="DeleteReply?id=<%=reply.getId()%>">删除</a></span>
										</div>	<!-- 删除按钮 -->
									<%
										}
									%>
									<h4 class="div-JD-section-body-head">
										<small>回复了 </small> <a href="userhome.jsp?uId=<%=user2.getId() %>" ><%=user2.getNickname() %> </a><small>创建的帖子
										</small> <a href="topic.jsp?id=<%=topic2.getId()%>"><%=topic2.getTopic() %></a>
									</h4>
									<blockquote>
										<%=reply.getContent() %><br /> <small><%=reply.getTime() %></small>
									</blockquote>
								</div></li>
						</ul>
					</div>
					
					<%
						}
					 %>
					
					
				</div>	<!-- 下div -->
				
			</div>
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

		<!--底部	 start
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
