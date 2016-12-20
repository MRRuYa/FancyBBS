<<<<<<< HEAD
=======
<%@page import="entity.Topic"%>
<%@page import="operating.OperatingTopic"%>
<%@page import="entity.Session"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="database.BBSDatabase"%>
>>>>>>> origin/master
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
<<<<<<< HEAD
=======
int sId = Integer.parseInt(request.getParameter("sId"));
Session session2 = new Session();
session2.setId(sId);

List<Topic> list = OperatingTopic.getTopicBySession(session2);
>>>>>>> origin/master
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
                <li> <a class="index-a-logo" href="#">FancyBBS</a> </li>
                <li> <a href="#">首页</a> </li>
                <li> <a href="#">版块</a> </li>
                <li> <a href="#">发表</a> </li>
                <li> <a href="#">菜单5</a> </li>
                <li> <a href="#">菜单6</a> </li>
            </ul>
        </div>
        <div class="index-div-control1"> <!--搜索按钮-->
            <form>
                <input class="index-form-control1" type="text" placeholder="输入关键字回车"/>
            </form>
        </div>
        <div class="indec-div-ulmain2">
            <ul id="index-ul-reandlo">
                <!--登录注册-->
                <li><a href="login.html">登录</a></li>
                <li><a href="register.html">注册</a></li>
            </ul>
        </div>
    </div>
</div>
<<<<<<< HEAD
<!--菜单层 end--> 

<div class="div-maincontainer">
	<!--中层框架 start-->
    <div class="div-content"> 
        <!--中层框架左边 start-->
        <div class="div-contentleft"> 
          <div class="div-main">
              <div class="div-main-head1">
                <h3 class="div-title">节点：程序发布
                  <span class="div-JD-section-right">
                                                                                 话题
                    <span class="div-badge div-article-badge">
                      485
                    </span>
                  </span>
                </h3>
              </div>
              <div class="div-main-body">biaoti</div>
          </div>
          <div class="div-main">
              <div class="div-main-head1">
                <h3 class="div-title">
                                                                话题列表
                  <small>(版主:K,元芳)</small>
                  <span class="div-JD-section-right">
                    <a class="div-lable div-article-lable" href="add.jsp">快速发表</a>
                  </span>
                </h3>
              </div>
                 <div class="div-main-body">
                   <div class="div-JD-list">
                     <div class="div-JD-section-first">
                       <a class="div-JD-section-left" href="#">
                         <img class="div-JD-img" src="#" alt="admin">
                       </a>
                     <div class="div-JD-section-body">
                       <h4 class="div-JD-section-body-head">
                        <a href="#">开源轻社区startbbs v1.2.3发布</a>
                        <span class="div-badge div-badge-node">置顶</span>
                       </h4>
                       <p class="div-JD-section-body-bottom">
                         <span>
                           <a href="#">程序发布</a>
                         </span>&nbsp;•&nbsp;
                         <span>
                           <a href="#">admin</a>
                         </span>&nbsp;•&nbsp;
                         <span>7 天前</span>&nbsp;•&nbsp;
                         <span>最后回复来自 <a href="#">diguotravel</a>
                         </span>
                       </p>                 
                     </div>
                     </div>
                   </div>
                 </div>
          </div>  
        </div>
        <!--中层框架左边 end--> 
          
        <!--中层框架右边 start-->
        <div class="div-contentright"> 
          <div class="div-main">
            <div class="div-main-body">
              <div class="div-row">
                <div class="col-md-1">
                  <a href="#">
                    <img alt="#" class="div-article-img" src="#" />
                  </a>
                </div>
                <div class="col-md-2">
                  <ul class="div-list-unstyled">
	            	<li><a href="#" title="#">Dj7511</a></li>
	            	<li>用户组：普通会员</li>
	            	<li>积分：326</li>
	              </ul>
                </div>
              </div>
              <div class="div-row2 div-text-center">
                <div class="col-md-3">
	              <p1><a href="#">0</a></p1><br />
	              <p1><a href="#">收藏</a></p1>
                </div>
                <div class="col-md-3">
	              <p1><a href="#">0</a></p1><br />
	              <p1><a href="#">关注</a></p1>
                </div>
              </div>
            </div>
            <div class="div-main-footer div-JD-section-body-bottom">
                                                 暂无提醒
            </div>
          </div>
        </div>
        <!--中层框架右边 end--> 
    </div>
	<!--中层框架 end-->
    
    <!--底部	 start-->
	<div class="index-div-bottommian1">
        <div class="index-div-bottom"> Copyright &copy 2016 <br/>
            <span><a href="#">关于我们FancyBBS</a></span>| 
            <span><a href="#">免责声明</a></span>| 
            <span><a href="#">付费服务</a></span>| 
            <span><a href="#">联系我们</a></span>|
            <span><a href="#">商业授权</a></span>| 
            <span><a href="#">赞助开发</a></span>|
            <br/>
            FancyBBS<a href="#">网站统计</a>|
            QQ群XXXX鲁IC备XXX号<br/>
            Powered by FancyBBS 页面执行时间 
    	</div>
	</div>
	<!--底部	 end-->
</div>



=======
<!--菜单层 end-->
<div class="div-maincontainer"> 
    <!--中层框架 start-->
    <div class="div-content">
        <div class="div-contentleft"> 
            <!--中层框架左边 start-->
            
            <div class="div-main">
                <div class="div-main-head2">
                    <h3 class="div-title">FancyBBS <span class="div-JD-section-right"> 话题总数 <span class="div-badge div-badge-node"> 3156 </span> </span> </h3>
                </div>
                <div class="div-main-body">FancyBBS|采用java语言开发、基于MVC架构的开源论坛系统</div>
            </div>
            <div class="div-main">
                <div class="div-main-head2">版块列表</div>
                <div class="div-main-body">
                    <%
                    for (Topic topic:list) {
		            %>
                    <div class="div-JD-list">
                        <div class="div-JD-section-first"> 
                        	<a class="div-JD-section-left" href="#"> <img class="div-JD-img" src="img/node/" alt="<%=topic.getTopic()%>"> </a> 
                        	<span class="div-JD-section-right div-JD-section-text-right">                            
                            <p><%=topic.getReplyCount() %>个回复</p>
                            <p><%=topic.getClickCount() %>点击量</p>
                            </span>
                            <div class="div-JD-section-body">
                                <h4 class="div-JD-section-body-head"> <a href="#"><%=topic.getTopic() %></a> </h4>
                                <p class="div-JD-section-body-bottom"> <%=topic.getContents() %></p>
                                <p class="div-JD-section-body-bottom"> 版主:K,元芳 </p>
                            </div>
                        </div>
                    </div>
                    <%
               		 }
           			%>
                </div>
            </div>
            
            <div class="div-main">	<!-- 回帖区域 -->
                <div class="div-main-head1">139回复</div>
                <div class="div-main-body">biaoti</div>
            </div>
            
            <div class="div-main">	<!-- 回复编辑 -->
                <div class="div-main-head1">回复</div>
                <div class="div-main-body">biaoti</div>
            </div>
        </div>
        <!--中层框架左边 end--> 
        
        <!--中层框架右边 start-->
        <div class="div-contentright">
            <div class="div-main">
                <div class="div-main-head1">biaoti</div>
                <div class="div-main-body">biaoti</div>
            </div>
        </div>
        <!--中层框架右边 end--> 
    </div>
    <!--中层框架 end--> 
    
    <!--底部	 start-->
    <div class="index-div-bottommian1">
        <div class="index-div-bottom"> Copyright &copy 2016 <br/>
            <span><a href="#">关于我们FancyBBS</a></span>| <span><a href="#">免责声明</a></span>| <span><a href="#">付费服务</a></span>| <span><a href="#">联系我们</a></span>| <span><a href="#">商业授权</a></span>| <span><a href="#">赞助开发</a></span>| <br/>
            FancyBBS<a href="#">网站统计</a>|
            QQ群XXXX鲁IC备XXX号<br/>
            Powered by FancyBBS 页面执行时间 </div>
    </div>
    <!--底部	 end--> 
</div>
>>>>>>> origin/master
</body>
</html>
