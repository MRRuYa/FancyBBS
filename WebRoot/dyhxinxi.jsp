<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dyhxinxi.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="css/DYH.css" />


  </head>
  
  <body>
    <div class="div-main">                <!-- 上div -->
      <div class="div-main-body">
      <div class="div-xx-row">
        <div class="col-md-6">
          <img class="div-xx-img div-xx-img-responsive" src="#" alt="#">
        </div>
        <div class="col-md-7">
          <h4>Dj7511</h4>
          <p class="div-JD-section-body-bottom">
            <small>Dj7511是第7226号会员，加入于2016-12-06 13:37</small>
          </p>
          <p>签名：</p>
          <p>个人主页：
            <a href=""></a>
          </p>
          <p>所在地：</p>
        </div>
        <div class="col-md-8"></div>
        <div class="col-md-9"><p></p></div>
      </div>
      </div>
    </div>                                   <!-- 上div -->
    
    <div class="div-main">                   <!-- 中div -->
      <div class="div-main-head1">
        <h3 class="div-title">
          <small>最近添加的主题</small>
        </h3>
      </div>
      <div class="div-main-body">
        <ul class="div-JD-list">
          <li class="div-JD-section-first">
            <div class="div-JD-section-right">
              <span class="div-badge div-badge-node">2</span>
            </div>
            <div class="div-JD-section-body">
               <h4 class="div-JD-section-body-head">
                 <a href="#" class="div-xinxi-mune">新会员TEXT</a>
               </h4>
                <p class="div-small">
                  <span>
                  <a href="#">程序发布</a>
                  </span>&nbsp;•&nbsp;
                  <span>15 天前</span>&nbsp;•&nbsp;
                  <span>最后回复来自
                   <a href="#">Dj7511</a>
                   </span>
                </p>
            </div>
          </li>
        </ul>
        <ul class="div-xx-pagination"></ul>
      </div>
    </div>                                    <!-- 中div -->
    <div class="div-main">                   <!-- 下div -->
      <div class="div-main-head1">
        <h3 class="div-title">
          <small>最近添加的主题</small>
        </h3>
      </div>
      <div class="div-main-body">
        <ul class="div-JD-list">
          <li class="div-JD-section-first div-xinxi-reply">
            <div class="div-JD-section-body">
               <h4 class="div-JD-section-body-head">
                <small>回复了                  
                </small>
                <a href="#" title="DJ7511">DJ7511</a>
                <small>创建的主题                 
                </small>
                <a href="#">新会员TEXT</a>
               </h4>
               <blockquote>text<br />
                 <small>--15天前</small>
               </blockquote>
            </div>
          </li>
        </ul>
      </div>
    </div>                        <!-- 下div -->
  </body>
</html>
