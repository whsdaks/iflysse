
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>BS_login</title>
<!--  网站图标 -->
<link rel="shortcut icon" href="images/log.ico">
<meta name="description"
	content="particles.js is a lightweight JavaScript library for creating particles.">
<meta name="author" content="Vincent Garreau" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<link href="css/login.css" rel="stylesheet" type="text/css">
</head>
<div id="login">
	<div id="login_t">
		<div id="title">
			<div id="tp">
				<img src="images/ia_100000000.jpg"
					style="width: 65px; height: 65px; border-radius: 8px;" />
			</div>
			<div id="tw">Teacher</div>
			<div id="text">办公系统</div>
		</div>
		<div id="line"></div>
		<div class="lg">
			<form action="/loginCheck" method="post" id="forml" name="forml">
				<div id="left">
				<div>					
						<label><img alt="账号：" src="images/name.png" style="width:30px;height:28px;vertical-align: middle;margin: -5px 10px 0 15px;"></label> <input type="text" id="username"
							name="username" placeholder="请输入用户名" style="height: 30px;" />
																	
					</div>
					<p>
						<label><img alt="密码：" src="images/password.png" style="width:30px;height:28px;vertical-align: middle;margin: -5px 10px 0 15px;"></label> <input type="password" id="password"
							name="password" placeholder="请输入您的密码"
							style="height: 30px;" />
					</p>
					<!-- <p>
						<label>验证码：</label> <input type="text" name="code" size="10"
							style="height: 25px;">
						<samp id="yz">3425</samp>
					</p> -->
				</div>
				<div id="right">
					<button id="an" onClick="inputCheck()">登陆</button>
				</div>
			</form>
			<a href="ademail" style="margin-left:10%;text-decoration:none;font-size:15px;color:red"><i>忘记密码？</i></a>
		</div>

	</div>

</div>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/particles.min.js"></script>
<script src="js/app.js"></script>
<script src="layui/lay/layui.js"></script>
<script src="layui/lay/layui.all.js"></script>
<script>
function inputCheck(){
    var lname = document.forml.username.value;
    if(lname ==""){
        alert("用户名不能为空");
        document.forml.username.focus();
        return false;
    }
    var lpw = document.forml.password.value;
    if(lpw ==""){
        alert("密码不能为空");
        document.forml.login_pw.focus();
        return false;
    }
    var lyz = document.forml.code.value;
    if(lyz==""){
        alert("验证码不能为空");
        document.forml.login_yz.focus();
        return false;
    }
    if(lyz!="3425"){
        alert("验证码不正确");
        return false;
    }
    else{
        self.location='ademail';
    }
    return false;
}	
</script>
</body>
</html>