<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>找回密码</title>
<link rel="shortcut icon" href="images/log.ico">
<style type="text/css">
body {
	margin-top: 10%;
	text-align: center;
}
input{
	width:200px;
	height:30px;
}
button{
	width:50px;
	height:35px;
}
</style>
</head>
<body>
	<p>请输入您账户关联的邮箱</p>
	<form action="/email" method="post" class="form-signin">
		邮箱：<input type="email" name="email" id="email" placeholder="请您输入邮箱"
			required>
		<button type="submit" id="retrievePassword">提交</button>
	</form>
	<script>
		$(document).ready(function() {
			$("#retrievePassword").click(function() {
				var email = $("#email").val();
				if (email == null || email == "") {
					alert("邮箱不能为空");
					return;
				}
				//正则表达式判断邮箱地址是否正确
				var emreg = /^\w{3,}(\.\w+)*@[A-z0-9]+(\.[A-z]{2,5}){1,2}$/;
				if (emreg.test(email.value) == true) {
					alert("您输入的不是一个合法邮箱格式！");
					return;
				}
				var postData = {
					"email" : email
				}
				// ajax后端数据请求
				$.ajax({
					type : "post",
					url : "user/xxx",
					data : postData,
					success : function(data) {

					},
					error : function() {

					}
				});
			});
		});
	</script>
	<script>
		
	</script>
</body>
</html>