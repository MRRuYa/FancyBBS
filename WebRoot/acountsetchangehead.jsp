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
         <form class="sqy-form" enctype="multipart/form-data" action="   " method="post">
								<input type="hidden" name="stb_csrf_token" value="8d5de1ba431d19fb8a1a42a62708162f">
				  			<fieldset>
				    			<div class="sqy-form-group">
				      				<label class="sqy-col-md-2 sqy-control-label">当前头像</label>
				      				<div class="sqy-col-md-8" >
				      						<img class="large_avatar" src="http://bbs.startbbs.com/uploads/avatar/default/big.png">
				                            <img class="middle_avatar" src="http://bbs.startbbs.com/uploads/avatar/default/normal.png">
				                            <img class="small_avatar" src="http://bbs.startbbs.com/uploads/avatar/default/small.png">
				      				<div class="sqy-alert sqy-alert-info sqy-alert-avatar">
	                                        <strong>注意</strong> 支持 512k 以内的 PNG / GIF / JPG 图片文件作为头像，推荐使用正方形的图片以获得最佳效果。
	                                    </div>
				      				</div>
				    			</div>
				    			
				    			<div class="sqy-form-group">
				      				<label class="sqy-col-md-2 sqy-control-label" for="avatar_file">选择图片</label>
				      				<div class="sqy-col-md-6">
				       					<input type="file" id="avatar_file" name="avatar_file">
				      				</div>
				    			</div>
				    			
				    			<div class="sqy-form-group">
					    			<div class="sqy-col-sm-6">
				    				<button type="submit" name="upload" class="sqy-div-btn sqy-btn-primary">上传新头像</button>
				    				</div>
				    			</div>
				    		</fieldset>
	                            </form>
        
           </div>
           </div>
           </div>
        
</body>
</html>
