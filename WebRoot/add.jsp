<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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

<script type="text/javascript" src="fckeditor/fckeditor.js"></script>		<!--FCKEditor-->
<script type="text/javascript">
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
<!--菜单层 end--> 

<!--中层框架 start-->
<div class="div-content"> 
    <!--中层框架左边 start-->
    <div class="div-contentleft">
        <div class="div-main"> <!-- 发表主题框架 -->
            <div class="div-main-head1">创建新主题</div>
            <div class="div-main-body">
                <form action="AddTopic" id="addtopic" method="post" name="addtopic" >
                    <div class="add-form-group">
                        <label>标题</label>
                        <input class="add-form-control" id="topic" name="topic" value="" type="text" />
                        <span class="help-block red"></span> 
                    </div>
                    <div class="add-form-group">
                        <label>版块</label>
                        <select name="node_id" id="node_id" class="add-form-control" >
                            <option selected="selected" value="">请选择分类</option>
                            <optgroup label="&nbsp;&nbsp;官方专区">
                            <option value="1"> 程序发布 </option>
                            <option value="4"> 开发动态 </option>
                            <option value="15"> 商业用户专区 </option>
                            <option value="16"> StartBBS Team </option>
                            </optgroup>
                            <optgroup label="&nbsp;&nbsp;STB使用">
                            <option value="2"> bug反馈见议 </option>
                            <option value="3"> 程序讨论 </option>
                            <option value="5"> 模板风格 </option>
                            <option value="6"> 插件模块开发 </option>
                            <option value="8"> 教程帮助 </option>
                            <option value="17"> STB@net </option>
                            </optgroup>
                            <optgroup label="&nbsp;&nbsp;其它版区">
                            <option value="7"> 站长交流 </option>
                            <option value="9"> 网站展示 </option>
                            <option value="10"> 唠叨 </option>
                            <option value="11"> PHP/mysql技术 </option>
                            <option value="18"> Laravel </option>
                            <option value="19"> CodeIgniter </option>
                            </optgroup>
                        </select>
                    </div>
                    <div class="add-form-group"> 
                    	<label>内容</label>            
                        <textarea class="add-form-control" id="contents" name="contents" placeholder="话题内容" rows="10"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">创建</button>
                </form>
            </div>
        </div>
    </div>
    <!--中层框架左边 end--> 
    
    <!--中层框架右边 start-->
    <div class="div-contentright"> </div>
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
</body>
</html>
