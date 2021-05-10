<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>修改密码</title>
<meta name="description"
	content="particles.js is a lightweight JavaScript library for creating particles.">
<meta name="author" content="Vincent Garreau" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet" media="screen" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/reset.css" />
</head>
<body>

	<div id="particles-js1">
		<div class="login">
			<div class="login-top">
				修改密码
				<hr>
			</div>
			<form action="/pwd_save" method="post" onsubmit="checkAll();">
			<input type="hidden" name="uId" value="${loginUser.uId}">
				<div class="login-center clearfix">
					<div class="login-center-img">
						<img src="images/password.png" />
					</div>
					<div class="login-center-input">
						<input type="password" name="oldpwd" id="oldpwd"
							placeholder="请输入原密码"
							onblur="checkoldpwd();" /> <span id="oldpwdErr"></span>
						<div class="login-center-input-text">原密码</div>
					</div>
				</div>
				<div class="login-center clearfix">
					<div class="login-center-img">
						<img src="images/password.png" />
					</div>
					<div class="login-center-input">
						<input type="password" name="newpwd" id="newpwd"
							placeholder="请输入新密码"
							onblur="checknewpwd();" /> <span id="newpwdErr"></span>
						<div class="login-center-input-text">新密码</div>
					</div>
				</div>
				<div class="login-center clearfix">
					<div class="login-center-img">
						<img src="images/password.png" />
					</div>
					<div class="login-center-input">
						<input type="password" name="password" id="conpwd"
							placeholder="请确认新密码" 
							onblur="checkconpwd();" /> <span id="newpwdErr1"></span>
						<div class="login-center-input-text">确认密码</div>
					</div>
				</div>
				<!-- <div class="login-button" style="margin:10% 0 5px 0">
				确认修改
			</div> 	 -->
				<button class="login-button"
					style="margin: 5% 0 5px 11%; font-size: 18px;">确认修改</button>
			</form>
		</div>

		<div class="sk-rotating-plane"></div>
	</div>

	<!-- scripts -->
	<script src="./js/jquery-3.3.1.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="js/particles.min.js"></script>
	<script src="js/app.js"></script>
	<script src="layui/lay/layui.js"></script>
	<script src="layui/lay/layui.all.js"></script>
	<script type="text/javascript">
		function checkoldpwd() {
			var oldpwd = $('#oldpwd').val()
			if (oldpwd === '') {
				$('#oldpwdErr').html('原密码不能为空')
				$("#oldpwdErr").css("color", "red")
				return false
			} else if (oldpwd.length<6||oldpwd.length>54) {
				$("#oldpwdErr").html('密码长度在6-54位之间')
				$("#oldpwdErr").css("color", "red")
				return false
			} else {
				$('#oldpwdErr').html('')
				return true
			}
		}
		function checknewpwd() {
			var newpwd = $('#newpwd').val()
			if (newpwd === '') {
				$('#newpwdErr').html('新密码不能为空')
				$("#newpwdErr").css("color", "red")
				return false
			} else if (newpwd.length<6||newpwd.length>54) {
				$("#newpwdErr").html('密码长度在6-54位之间')
				$("#newpwdErr").css("color", "red")
				return false
			} else {
				$('#newpwdErr').html('')
				return true
			}
		}
		function checkconpwd() {
			var conpwd = $('#conpwd').val()
			if (conpwd === '') {
				$('#newpwdErr1').html('确认密码不能为空')
				$("#newpwdErr1").css("color", "red")
				return false
			} else if (conpwd.length<6||conpwd.length>54) {
				$("#newpwdErr1").html('密码长度在6-54位之间')
				$("#newpwdErr1").css("color", "red")
				return false
			} else {
				$('#newpwdErr1').html('')
				return true
			}
		}
	</script>
	<script>
		function checkAll() {
			if (!dbuser.getPassword().equals(user.getPassword())) {
				document.write("原密码错误");
			}
		}
	</script>
</body>
</html>