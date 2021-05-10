<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师辅助系统-主页</title>
<link rel="shortcut icon" href="images/log.ico">
<meta name="keywords">

<link rel="stylesheet" type="text/css" href="layui/css/main.css" />
<link rel="stylesheet" type="text/css" href="layui/css/menus.css" />
<link rel="stylesheet" type="text/css" href="css/styles.css" />
<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
<style>
</style>
</head>
<body>

	<ul class="layui-nav">
		<!-- <img src="images/logo.png" style="width: 200px; height: 50px;"> -->
			<img src="images/bg1.png" style="width: 150px; height: 50px;">
		<div class="layui-nav-item">
			<p style="font-size: 25px; margin: 0 50px; font-family: STLiti;">Teacher&nbsp;辅助办公平台</p>
		</div>
		<li class="layui-nav-item" style="float: right; margin-right: 5%">
			<a href="javascript:;"><img src="//t.cn/RCzsdCq"
				class="layui-nav-img">${loginUser.realName }<span
				class="layui-nav-more"></span></a>
			<dl class="layui-nav-child layui-anim layui-anim-upbit">
				<dd>
					<a href="/logout">退出</a>
				</dd>
			</dl>
		</li>
	</ul>
	<div class="main">
		<div class="left" style="margin: 0;padding:0">

			<div class="menus">

				<div id="menu_title1" class="menu_title" onclick="openMenu(this)">
					个人中心
					<div class="indicator" id="indicator1">^</div>
				</div>
				<div class="menu" id="menu1">
					<div class="item">
						<a href="/my_info?uId=${loginUser.uId}" target="content">完善个人信息</a>
					</div>
					<li class="item_divider"></li>
					<div class="item">
						<a href="/userinfo" target="content">我的个人信息</a>
					</div>
					<li class="item_divider"></li>
					<div class="item">
						<a href="new_pwd?uId=${loginUser.uId}">修改密码</a>
					</div>

				</div>

				<li class="menu_divider"></li>

				<div id="menu_title2" class="menu_title" onclick="openMenu(this)">
					课程管理
					<div class="indicator" id="indicator2">^</div>
				</div>
				<div class="menu" id="menu2">
					<div class="item">
						<a href="add_kc" target="content">创建课程</a>
					</div>
					<li class="item_divider"></li>
					<!-- <div class="item">
						<a href="#">添加课表</a>
					</div>
					<li class="item_divider"></li> -->
					<div class="item">
						<a href="courselist" target="content">我的课程</a>
					</div>
					<!--<li class="item_divider"></li>
					 <div class="item">
						<a href="all_course">查看所有用户课表</a>
					</div> -->
				</div>

				<li class="menu_divider"></li>
				<div id="menu_title3" class="menu_title" onclick="openMenu(this)">
					周报管理
					<div class="indicator" id="indicator3">^</div>
				</div>
				<div class="menu" id="menu3">
					<div class="item">
						<a href="/add_weekly" target="content">创建周报</a>
					</div>
					<li class="item_divider"></li>
					<div class="item">
						<a href="/weeklymyself" target="content">我的周报</a>
					</div>
					<c:if test="${loginUser.uType == 1 || loginUser.uType == 0}">
					<li class="item_divider"></li>
					<div class="item">
						<a href="/weeklyList" target="content">所有用户周报</a>
					</div>
					</c:if>
				</div>

				<li class="menu_divider"></li>
			<c:if test="${loginUser.uType == 0 }">
				<div id="menu_title4" class="menu_title" onclick="openMenu(this)">
					系统管理
					<div class="indicator" id="indicator4">^</div>
				</div>
				<div class="menu" id="menu4">
					<div class="item">
						<a href="/userlist" target="content">用户管理</a>
					</div>

					<li class="item_divider"></li>
					<div class="item">
						<a href="termset" target="content">创建学期</a>
					</div>
					<li class="item_divider"></li>
					<div class="item">
						<a href="term_all" target="content">学期设置</a>
					</div>
				</div>
				</c:if>
			</div>
		

		</div>
		<!--  嵌套显示 -->
		<div id="courseList">

			<iframe name="content" src="/termset_info" width="100%" height="100%"
				style="border: none;"></iframe>

		</div>
	</div>

	<div class="footer"></div>
	<!--  </div> -->
	<%@ include file="common/footer.jsp"%>
	<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
	<div class="site-tree-mobile layui-hide">
		<i class="layui-icon">&#xe602;</i>
	</div>
	<div class="site-mobile-shade"></div>
	<script src="layui/js/layui.js" charset="utf-8"></script>
	<script src="layui/lay/layui.all.js" charset="utf-8"></script>
<script>
layui.use('element', function(){
  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
  
  //监听导航点击
  element.on('nav(demo)', function(elem){
    //console.log(elem)
    layer.msg(elem.text());
  });
});
</script>
	
 
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?d214947968792b839fd669a4decaaffc";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>

<script>
layui.use('element', function(){
  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
  
  //监听导航点击
  element.on('nav(demo)', function(elem){
    //console.log(elem)
    layer.msg(elem.text());
  });
});
</script>
<script>
layui.use('element', function(){
  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
  
  //监听导航点击
  element.on('nav(demo)', function(elem){
    //console.log(elem)
    layer.msg(elem.text());
  });
});
</script>
	<script type="text/javascript">
		var itemHeight = 40;
		var dividerHeight = 1;

		function openMenu(obj) {
			menuTitleId = obj.id;
			menuId = "menu" + menuTitleId.substring(10);
			indicatorId = "indicator" + menuTitleId.substring(10);

			menu = document.getElementById(menuId);
			indicator = document.getElementById(indicatorId);
			height = menu.style.height;

			if (height == "0px" || height == "") {
				childAmount = menu.getElementsByTagName('div').length;
				dividerAmount = menu.getElementsByTagName('li').length;
				height = childAmount * itemHeight + dividerAmount
						* dividerHeight;
				menu.style.height = height + "px";
				indicator.style.transform = "rotate(180deg)";
			} else {
				menu.style.height = "0px";
				indicator.style.transform = "rotate(0deg)";
			}
		}
	</script>

	<script>
		layui.use('element', function() {
			var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

			//监听导航点击
			element.on('nav(demo)', function(elem) {
				//console.log(elem)
				layer.msg(elem.text());
			});
		});
	</script>

	<script type="text/javascript">
		$.ajax({
			dataType : "text",
			url : basePath + '/courseList',
			data : {
				courseBox : types
			},
			success : function(msg) {
				//列表数据页面渲染
				$('#courseList').html(msg);
			}
		});
	</script>
	
</body>

</html>