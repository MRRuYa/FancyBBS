<%@page import="operating.*"%>
<%@page import="entity.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="database.BBSDatabase"%>
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
	
	//统计贴子总数
	List<Session> sessionListTemp = OperatingSession.getAllSession();
	int topicTotalCount = 0;
	for (Session sessiontemp : sessionListTemp) {
		topicTotalCount +=sessiontemp.getTopicCount();
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
        <div class="div-contentleft"> 
            <!--中层框架左边 start-->
            
            <div class="div-main">
                <div class="div-main-head2">
                    <h3 class="div-title">FancyBBS <span class="div-JD-section-right"> 贴子总数 <span class="div-badge div-badge-node"> <%=topicTotalCount %> </span> </span> </h3>
                </div>
                <div class="div-main-body">FancyBBS|采用java语言开发、基于MVC架构的开源论坛系统</div>
            </div>
            <div class="div-main">
                <div class="div-main-head2">版块列表</div>
                <div class="div-main-body">
                    <%
                    List<Session> list=OperatingSession.getAllSession();
                    for(int i=0;i<list.size();i++){
                    	Session session2 = list.get(i);
                    %>
                    <div class="div-JD-list">
                        <div class="div-JD-section-first"> 
                        	<a class="div-JD-section-left" href="article.jsp?sId=<%=session2.getId()%>"> <img class="div-JD-img" src="img/node/<%=session2.getId() %>.jpg" alt="<%=session2.getName()%>"> </a> 
                        	<span class="div-JD-section-right div-JD-section-text-right">                            
                            	<p><%=session2.getTopicCount() %>个帖子/</p>
                            </span>
                            <div class="div-JD-section-body">
                                <h4 class="div-JD-section-body-head"> <a href="article.jsp?sId=<%=session2.getId()%>"><%=session2.getName() %></a> </h4>
                                <p class="div-JD-section-body-bottom"> <%=session2.getProfile() %></p>
                            </div>
                        </div>
                    </div>
                    <%
               		 }                	
           			%>
                </div>
            </div>
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
    
    <!--底部	 
    <div class="index-div-bottommian1">
        <div class="index-div-bottom"> Copyright &copy 2016 <br/>
            <span><a href="#">关于我们FancyBBS</a></span>| <span><a href="#">免责声明</a></span>| <span><a href="#">付费服务</a></span>| <span><a href="#">联系我们</a></span>| <span><a href="#">商业授权</a></span>| <span><a href="#">赞助开发</a></span>| <br/>
            FancyBBS<a href="#">网站统计</a>|
            QQ群XXXX鲁IC备XXX号<br/>
            Powered by FancyBBS 页面执行时间 </div>
    </div>
    底部	 end--> 
</div>
</body>
</html>
