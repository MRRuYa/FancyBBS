<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dyhtopic.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="css/DYH.css" />


  </head>
  
  <body>
     <div class="div-main">
       <div class="div-main-head2">
                <div class="div-JD-section-right">
           <a href="#">
             <img class="div-topic-img" src="#" alt="admin">
           </a>
         </div>
         <p>
           <a href="#">首页</a> / 
           <a href="#">程序发布</a>
         </p>
         <h2 class="div-title div-topic-title">
                                        开源轻社区startbbs v1.2.3发布
         </h2>
         <small class="div-JD-section-body-bottom">
           <span>By 
           <a href="#">admin</a>
           </span>&nbsp;•&nbsp;
           <span>2015-01-24 23:37:00</span>&nbsp;•&nbsp;
           <span>30338次点击</span>
           <span>• 
           <a href="#" class="div-reply">回复</a>
           </span>
		   <span>
		   <a href="#" title="点击收藏">收藏</a>
		   </span>
         </small>
       </div>
       <div class="div-main-body">
                                     内容+链接
         <p class="div-topic-tag">
		   <a href="#">undefined</a>&nbsp;
		   <a href="#">下一步</a>&nbsp;
		   <a href="#">收件箱</a>&nbsp;
		   <a href="#">用户组</a>&nbsp;
		 </p>
       </div>
       <div class="div-main-footer"></div>
     </div>
     <div class="div-main">
       <div class="div-main-head1">
         <h5>
           <span>139</span>
           <span> 回复 | 直到2016-12-20 20:20</span>
           <a href="#" class="div-JD-section-right">
           <span class="div-JD-section-body-bottom">添加回复</span>
           </a>
         </h5>
       </div>
       <div class="div-main-body">
           <div class="div-row">
             <div class="col-md-4">
               <a href="#">
                 <img class="div-topic-img" src="#" alt="diguotravel_avatar">
               </a>
             </div>
             <div class="col-md-5 div-topic-reply-body">
               <h5>
                 <span>
                   <a href="#">diguotravel</a>&nbsp;&nbsp;8 天前
                 </span>
                 <span class="div-JD-section-right">#1 -
                   <a href="#" class="clickable">回复</a>
                 </span>
               </h5>
              <p>
                                    确实不错的一个系统。希望能够一直更新下去。。。。                                    
              </p>
		     </div>
           </div>

       </div>
     </div>
  </body>
</html>
