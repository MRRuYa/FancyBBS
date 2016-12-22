<%@page import="operating.*"%>
<%@page import="entity.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

User user = OperatingUser.getAUserById(1);
List<Topic> list = OperatingTopic.getAllTopic();	//获取topic结果集
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

<body>
<!--菜单层 start-->
<div class="index-div-menu">
    <div class="index-div-menu1"> <!--菜单栏-->
        <div class="index-div-ulmain">
            <ul id="index-ul-mainNav">
                <li> <a class="index-a-logo">FancyBBS</a> </li>
                <li> <a href="login.jsp">首页</a> </li>
                <li> <a href="login.jsp">版块</a> </li>
                <li> <a href="login.jsp">发表</a> </li>
            </ul>
        </div>
        <div class="indec-div-ulmain2">
            <ul id="index-ul-reandlo">
                <!--登录注册-->
                <li><a href="login.jsp">登录</a></li>
                <li><a href="register.jsp">注册</a></li>
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
					<h3 class="div-title">
						欢迎访问FancyBBS开源微社区 
					</h3>
				</div>

				<%
					for (int i =0; i<(list.size()>10?10:list.size()); i++) {
						Topic topic = list.get(i);
						Session session2 = OperatingSession.getASessionByATopic(topic);
						if (topic.getFlag() == 1) {		//先输出置顶
				%>
				<div class="div-main-body">
					<!-- 内容 -->
					<div class="div-JD-list">
						<div class="div-JD-section-first">
							<a class="div-JD-section-left"
								href="login.jsp"> <img
								class="div-JD-img" src="<%=user.getPhoto()%>" alt="admin" />
								<!-- 用户头像 --> </a>
							<div class="div-JD-section-body">
								<h4 class="div-JD-section-body-head">
									<a href="login.jsp"><%=topic.getTopic()%></a>
									<!-- 帖子标题 -->
									<%
										if (topic.getFlag() == 1) {
									%>
											<span class="div-badge div-badge-node">置顶</span>
									<%
										}
									 %>
								</h4>
								<p class="div-JD-section-body-bottom"><!-- 获取topic所在session -->
									<span> <a href="login.jsp"><%=session2.getName()%>
										<!-- 版块标题 --> </span>&nbsp;•&nbsp; <span> <a
										href="login.jsp"><%=user.getNickname()%></a>
										<!-- 用户 --> </span>&nbsp;•&nbsp; <span>7 天前</span>&nbsp;•&nbsp;
									<!-- 最后用户 -->
									<span>最后回复来自 <a
										href="login.jsp"><%=OperatingUser.getAUserById(topic.getLastReplyUseID())
					.getNickname()%></a>
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
				<%
					for (int i =0; i<(list.size()>30?30:list.size()); i++) {
						Topic topic = list.get(i);
						Session session2 = OperatingSession.getASessionByATopic(topic);
						if (topic.getFlag() == 0) {		//正常帖子排序
				%>
				<div class="div-main-body">
					<!-- 内容 -->
					<div class="div-JD-list">
						<div class="div-JD-section-first">
							<a class="div-JD-section-left"
								href="login.jsp"> <img
								class="div-JD-img" src="<%=user.getPhoto()%>" alt="admin" />
								<!-- 用户头像 --> </a>
							<div class="div-JD-section-body">
								<h4 class="div-JD-section-body-head">
									<a href="login.jsp"><%=topic.getTopic()%></a>
									<!-- 帖子标题 -->
									<%
										if (topic.getFlag() == 1) {
									%>
											<span class="div-badge div-badge-node">置顶</span>
									<%
										}
									 %>
								</h4>
								<p class="div-JD-section-body-bottom"><!-- 获取topic所在session -->
									<span> <a href="login.jsp"><%=session2.getName()%>
										<!-- 版块标题 --> </span>&nbsp;•&nbsp; <span> <a
										href="login.jsp"><%=user.getNickname()%></a>
										<!-- 用户 --> </span>&nbsp;•&nbsp; <span>7 天前</span>&nbsp;•&nbsp;
									<!-- 最后用户 -->
									<span>最后回复来自 
									<a	href="login.jsp"><%=OperatingUser.getAUserById(topic.getLastReplyUseID()).getNickname()%></a>
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
	          		请登录或注册
	        		<div class="div-main-footer div-JD-section-body-bottom"></div>
	      		</div>
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
    
    <!--底部	 
    <div class="index-div-bottommian1">
        <div class="index-div-bottom"> Copyright &copy 2016 <br/>
            <span><a href="guanyuwomen.jsp">关于我们FancyBBS</a></span>| 
            <span><a href="mianzeshengming.jsp">免责声明</a></span>
            <br/>
            FancyBBS
            QQ号751152833<br/>
            Powered by FancyBBS
       </div>
    </div>
    底部	 end--> 
</div>
</body>
</html>
