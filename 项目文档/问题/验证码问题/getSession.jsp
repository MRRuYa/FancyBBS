<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'getSession.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	$(function() {
		//给用户名文本绑定失去焦点事件

		 var vcode="";
			//获取用户输入的用户名
			 
			 var username=$(this).val();
			 //发送 ajax get方式的请求
			 //1、创建xhr
			 var xhr;
			 if(window.XMLHttpRequest){
			 //webkit
			 xhr = new XMLHttpRequest();
			 }else{
			 xhr = new ActiveXObject("Microsoft.XMLHTTP");
			 }
			 //2.发送请求并传递参数
			 xhr.open("GET","地址");
			 xhr.send();
			 //3.处理响应
			 xhr.onreadystatechange=function(){
			 //处理正确且完整响应

				if(xhr.readyState==4 && xhr.status==200){
				vcode= xhr.responseText;
				}			 
			 }
			 
	

	});
</script>
  </head>
  
  <body>
    This is my JSP page. <br>
  </body>
</html>
