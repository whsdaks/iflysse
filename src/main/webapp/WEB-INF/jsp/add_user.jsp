<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增用户</title>
<link rel="shortcut icon" href="images/log.ico">
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css" />


<style>
.user {
	margin: auto;
	margin-top: 30px;
	width: 800px;
}

.user ul {
	clear: both;
	height: 40px;
}

.user ul li {
	float: left;
	margin-right: 10px;
	line-height: 24px;
	color: #999;
	list-style: none;
}

.pro {
	font-family: "微软雅黑";
	font-size: 14px;
	font-weight: bold;
	width: 150px;
	text-align: right;
}
</style>
</head>
<body>

	<!-- 添加用户 -->
	<div class="container">
	
		<div class="box">
			<div class="title" style="margin-top: 50px;">
				<ul>
					<li><span style="font-size: 20px;">添加用户</span></li>
				</ul>
			</div>
			<div class="clear"></div>
			<form class="form-inline" role="form" action="/add_user_save" method="post">
			<div class="user">
				<ul>
					<li class="pro">用户名</li>
					<li><input class="form-control"
						style="width: 200px; height: 30px;" name="username" type="text"
						id="username" onblur="checkName()" /> <span id="nameErr"></span></li>

					<li>请输入用户名</li>
				</ul>				
				<ul>
					<li class="pro">真实姓名</li>
					<li><input class="form-control"
						style="width: 200px; height: 30px;" name="realName" type="text"
						id="realName" onblur="" /> <span id="nameErr"></span></li>

					<li>请输入真实姓名</li>
				</ul>
				<ul>
					<li class="pro">密码</li>
					<li><input class="form-control"
						style="width: 200px; height: 30px;" id="password" name="password"
						type="password"></li>
					<li>请输入用户密码</li>
				</ul>
				<ul>
					<li class="pro from-control">性别</li>
					<li><select class="form-control" id="sex" name="sex">
							<option>男</option>
							<option>女</option>
					</select></li>
				</ul>
				<ul>
					<li class="pro from-control">用户类型</li>
					<li><select class="form-control" id="uType" name="uType">
							<option value="2">普通用户</option>
							<option value="0">管理员</option>
							<option value="1">经理</option>
					</select></li>
				</ul>
				<ul>
					<li class="pro">&nbsp;</li>
					<li><input class="form-control" type="submit" name="button2"
						id="button2" value="完成" /></li>
						 <!-- <button >完成</button> -->

				</ul>
				<div class="clear"></div>
				
			</div>
</form>
			
		</div>

	</div>

</body>
<script type="text/javascript">

	function checkName(){
		var name = document.getElementById("username");
		if(name.value==""){
			alert("用户名不能为空")
		}else if(name.length < 6 || name.length >16){
			alert("用户名长度在6-16位之间")
		}
	}
</script>
</html>