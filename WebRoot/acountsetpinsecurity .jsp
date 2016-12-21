<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
<link rel="stylesheet" type="text/css" href="css/SQY.css" />
</head>

<body>

       <div class="sqy-div-panel">
       <div class="sqy-div-panel-heading">
           <h4>账号设置</h4>
           </div>
           <div class="sqy-div-panel-body">
                    <ul class="sqy-nav sqy-nav-tabs">
           <li class="sqy-active">
           <a href="acountsetessentialinformation.jsp">基本信息</a>
           </li>
           <li class="sqy-active">
           <a href="acountsetchangehead.jsp">修改头像</a>
           </li>
           <li class="sqy-active">
           <a href="acountsetpinsecurity .jsp">密码安全</a>
           </li>
           </ul>
           <div class="sqy-setting">
          <form accept-charset="UTF-8" action="http://bbs.startbbs.com/settings/password" class="sqy-form" method="post">
								<input type="hidden" name="stb_csrf_token" value="8d5de1ba431d19fb8a1a42a62708162f">
								<div class="sqy-form-group">
									<label class="sqy-col-md-2 sqy-control-label" for="password">当前密码</label>
									<div class="sqy-col-md-6">
									<input class="sqy-form-control" id="password" name="password" value="" size="50" type="password">
									<span class="sqy-help-block"></span>
									</div>
								</div>
								<div class="sqy-form-group">
									<label class="sqy-col-md-2 sqy-control-label" for="password">新密码</label>
									<div class="sqy-col-md-6">
									<input class="sqy-form-control" id="password" name="password" value="" size="50" type="password">
									<span class="sqy-help-block"></span>
									</div>
								</div>
								<div class="sqy-form-group">
									<label class="sqy-col-md-2 sqy-control-label" for="password">密码确认</label>
									<div class="sqy-col-md-6">
									<input class="sqy-form-control" id="password" name="password" value="" size="50" type="password">
									<span class="sqy-help-block"></span>
									</div>
								</div>

								<div class="sqy-form-group">
									<div class="sqy-col-sm-offset-3 sqy-col-sm-9">
										<button type="submit" name="commit" class="sqy-div-btn sqy-btn-primary">修改密码</button>
									</div>
								</div>
							</form>
           </div>
           </div>
           </div>
        
        <!--中层框架左边 end--> 
        
       
   
	<!--中层框架 end-->
    
  
</body>
</html>
