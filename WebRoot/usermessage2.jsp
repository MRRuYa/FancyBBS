<%@page import="entity.*"%>
<%@page import="operating.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String realPath = request.getRealPath("/");// 取得互联网程序的绝对地址
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
			var account = document.getElementById("account").value;	//记录用户名
			var nickName = document.getElementById("nickName").value;	//记录用户昵称
			var email = document.getElementById("email").value;	//记录用户email
			var sex = document.getElementById("sex").value;	//记录用户性别
			
			var nickName1 = /^[1-3]$/;		//昵称1-20字符
			var email1 = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;	//验证email					
			var sex = /^['男'|'女']$/;
			 
			
			if (nickName1.test(nickNmae) != true) {		//验证昵称是否符合要求
				alert("昵称应为1-20位字符组成");
				return false;
			}
			
			if (email1.test(email) != true) {		//验证昵称是否符合要求
				alert("邮箱格式不正确");
				return false;
			} 
			
			if (sex1.test(sex) != true) {		//验证性别
				alert("性别只有男女");
				return false;	
			}
			
			if (nickName == null || nickName == '') {
				alert("请输入昵称");
				return false;
			}else {
				if (email == null || email == '') {
					alert("请输入电子邮箱");
					return false;
				} else {
					if (sex == null || sex == '') {
						alert("请输入性别");
						return false;
					} else{
						return true;						
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
							<a class="sqy-nav-a">修改头像</a>
						</li>
						<li class="sqy-active">
							<a class="sqy-nav-a2" href="usermessage3.jsp?uId=<%=user.getId() %>">修改密码</a>
						</li>
					</ul>
					<div class="sqy-setting">
				
						<form class="sqy-form" enctype="multipart/form-data" action=" ChangeUserPhoto?uId=<%=user.getId() %>"	 method="post" >
							<fieldset>
								<div class="sqy-form-group">
									<label class="sqy-col-md-2 sqy-control-label">当前头像</label>
									<div class="sqy-col-md-8">
										<img class="large_avatar"	src="<%=user.getPhoto()%>">
										<img class="middle_avatar"	 src="<%=user.getPhoto()%>">
										<img class="small_avatar" src="<%=user.getPhoto()%>">
										<div class="sqy-alert sqy-alert-info sqy-alert-avatar">
											<strong>注意</strong> 仅仅支持 512k 以内的 JPG
											图片文件作为头像，推荐使用正方形的图片以获得最佳效果。
										</div>
									</div>
								</div>
		
								<div class="sqy-form-group">
									<label class="sqy-col-md-2 sqy-control-label" for="avatar_file">选择图片</label>
									<div class="sqy-col-md-6">
										<input type="file" id="avatar_file" name="avatar_file"  />
									</div>
								</div>
		
								<div class="sqy-form-group">
									<div class="sqy-col-sm-6">
										<input type="submit" class="sqy-div-btn sqy-btn-primary" id="submit" name="upload" value="上传新头像"  />
									</div>
									<br>
    								<!--  <div id="preview" class="usermessage2-dj-preview"> 
    								<div id="tip1"></div>
									<div id="tip2"></div>
									</div>-->
								</div>
							</fieldset>
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
