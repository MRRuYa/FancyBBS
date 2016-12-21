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
           <form accept-charset="UTF-8" action="http://asus-pc:8080/sqy/acountset essential information.jsp" class="sqy-form" method="post" _hover-ignore="1">
           <input type="hidden" name="stb_csrf_token" value="8d5de1ba431d19fb8a1a42a62708162f">
           <div class="sqy-form-group">
           <label class="sqy-col-md-2 sqy-control-label" for="account">用户名</label>
           <div class="sqy-col-md-6">
           <input class="sqy-form-control"  id="account" name="account" size="50" type="text" value="">
           </div>
           </div>
           <div class="sqy-form-group">
           <label class="sqy-col-md-2 sqy-control-label" for="nickname">用户昵称</label>
           <div class="sqy-col-md-6">
           <input class="sqy-form-control"  id="nickname" name="nickname" size="50" type="text" value=" ">
          <span class="sqy-div-help-block"></span>
           </div>
           </div>
            <div class="sqy-form-group">
           <label class="sqy-col-md-2 sqy-control-label" for="email">用户email地址</label>
           <div class="sqy-col-md-6">
           <input class="sqy-form-control"  id="email" name="email" size="50" type="text" value=" ">
          <span class="sqy-div-help-block"></span>
           </div>
           </div>
            <div class="sqy-form-group">
           <label class="sqy-col-md-2 sqy-control-label" for="sex">用户性别</label>
           <div class="sqy-col-md-6">
           <input class="sqy-form-control"  id="sex" name="sex" size="50" type="text" value=" ">
          <span class="sqy-div-help-block"></span>
           </div>
           </div>
           
         
           <div class="sqy-form-group">
           <label class="sqy-col-md-2 sqy-control-label" for="blank_1">备用字段</label>
           <div class="sqy-col-md-6">
           <textarea class="sqy-form-control" cols="40" id="blank_1" name="blank_1" rows="5"></textarea>
          <span class="sqy-div-help-block"></span>
           </div>
           </div>
           <div class="sqy-form-group">
           <div class="sqy-col-md-6">
           <button type="submit" class="sqy-div-btn sqy-btn-primary">保存</button>
           </div>
           </div>
           </form>
           </div>
           </div>
           </div>
          
        <!--中层框架左边 end--> 
        
       

</body>
</html>
