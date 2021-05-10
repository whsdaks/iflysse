<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>编辑用户</title>
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />

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

	<!-- 编辑用户 -->
	<div class="container">
		<div class="box">
			<div class="page-header ">
				<h2 style="margin-left: 20px;">完善${user.realName}的信息</h2>
			</div>
			<div class="clear"></div>
			<form class="form-inline" role="form" action="save_myinfo"
				method="post">
				<input type="hidden" id="uId" name="uId" value="${user.uId}">
				<div class="user">
					<ul>
						<li class="pro">用户名</li>
						<li><span class="form-control"
							style="width: 200px; height: 30px;" id="username" name="username"
							>${user.username}</span></li>

						<li>请输入用户名</li>
					</ul>
					<ul>
						<li class="pro">真实姓名</li>
						<li><span class="form-control"
							style="width: 200px; height: 30px;" id="realName" name="realName"
							>${user.realName}</span></li>

						<li>请输入真实姓名</li>
					</ul>
					<ul>
						<li class="pro">邮箱</li>
						<li><input type="text" class="form-control"
							style="width: 200px; height: 30px;" id="email" name="email"
							value="${user.email}"></li>

						<li>请输入邮箱</li>
					</ul>
					<ul>
						<li class="pro">电话</li>
						<li><input type="text" class="form-control"
							style="width: 200px; height: 30px;" id="phone" name="phone"
							value="${user.phone}"></li>

						<li>请输入邮箱</li>
					</ul>
					
					<ul>
						<li class="pro from-control">性别</li>
						<li><select class="form-control" id="sex" name="sex">
								<option>${user.sex }</option>
								<option>男</option>
								<option>女</option>
						</select></li>
					</ul>
					
					<button type="submit" class="layui-btn" onclick="add()" style="margin:2% 0 2% 20%;">完成</button>	

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