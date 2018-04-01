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
	
	List<Session> list=OperatingSession.getAllSession();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>FancyBBS|发表主题</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="shortcut icon" href="img/logo.png" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/login-register.css" />
<link rel="stylesheet" type="text/css" href="css/DYH.css" />
<script type="text/javascript" src="fckeditor/fckeditor.js"></script><!--FCKEditor-->
<script type="text/javascript"><!--FCKEditor-->
	window.onload = function()	{
		// Automatically calculates the editor base path based on the _samples directory.
		// This is usefull only for these samples. A real application should use something like this:
		// oFCKeditor.BasePath = '/fckeditor/' ;	// '/fckeditor/' is the default value.
		
		//var sBasePath = document.location.href.substring(0,document.location.href.lastIndexOf('_samples')) ;
		var sBasePath = "<%=basePath + "fckeditor/"%>";
		var oFCKeditor = new FCKeditor( 'contents' ) ;
		oFCKeditor.ToolbarSet = "DjDesign";		//自定义的ui
		oFCKeditor.Height = 300 ;
		oFCKeditor.BasePath	= sBasePath ;
		oFCKeditor.ReplaceTextarea() ;
	}
</script>
<script type="text/javascript">
	function checkadd() {	
		var topic = document.getElementById("topic").value;		//记录帖子标题
		var	 node_id = document.getElementById("node_id").value;		//记录帖子所在版块id		
		//var contnet = document.getElementById("contents");	//记录帖子内容
		//var contents = content.innerText;
		//var contnets = document.getElementById("contents").innerText;
		//var ctopic = ;		//标题约束规则
		//var content = ；		//内容约束规则

		if (topic == null || topic == '') {
			alert("请输入帖子标题");
			return false;		
		} else {
			if (node_id == -1) {
				alert("请选择帖子所在版块");
				return false;
			} else {
				if (document.getElementById("contents").value.length == 0) {
					alert("请输入帖子内容");
					return false;
				} else {
					return true;
				}
			}
		}
	};
</script>
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

<!--中层框架 start-->
<div class="div-content"> 
    <!--中层框架左边 start-->
    <div class="div-contentleft">
        <div class="div-main"> <!-- 发表主题框架 -->
            <div class="div-main-head1">发表帖子</div>
            <div class="div-main-body">
                <form action="AddTopic" method="post" onSubmit="return checkadd()">
                    <div class="add-form-group">
                        <label>帖子标题</label>
                        <input class="add-form-control" id="topic" name="topic"  type="text" />                        
                    </div>
                    <div class="add-form-group">
                        <label>版块所在版块</label>
                        <select name="node_id" id="node_id" class="add-form-control" >
                            <option selected="selected" value="-1">请选择分类</option>
                            <optgroup label="&nbsp;&nbsp;话题列表">
                            <% 
                            for(int i=0;i<list.size();i++){
                    			Session session2 = list.get(i);
                         
                            %>
                            <option value="<%=session2.getId()%>"> <%=session2.getName() %> </option>
                            <%
                            }
                            %>
                            </optgroup>
                        </select>
                    </div>
                    <div class="add-form-group">
                        <label>内容</label>
                        <textarea class="add-form-control" id="contents" name="contents"  rows="10" ></textarea>
                    </div>
                    <button type="submit" >创建</button>
                </form>
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

<!--底部	 start
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
