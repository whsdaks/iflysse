
<!-- 编辑周报页 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta property="qc:admins" content="3020656377612414137646375711277">
<title>博思教师辅助系统-主页</title>
<meta name="keywords">
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.css" />
<!-- <link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
<link rel="stylesheet" type="text/css" href="layui/css/register.css" />  -->
<style>
body {
	background-color: pink;
}

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
	font-size: 15px;
	font-weight: bold;
	width: 150px;
	text-align: right;
}
</style>
</head>
<body>
	<div class="page-header ">
		<h2 style="margin-left: 20px;">编辑周报</h2>
	</div>
	<form action="weekly_edit_save" method="post">
		<input type="hidden" name="wId" value="${weekly.wId }">
		<div class="user">
			<ul>
				<li class="pro">周报内容：</li>
				<li><textarea placeholder="请输入内容" class="layui-textarea" id="wConter" name="wConter" 
				style="height: 100px; width: 300px;text-align:left;color:#000">${weekly.wConter }</textarea></li>
				<li>请输入周报内容</li>
			</ul>
			
			<ul><br/>
				<li class="pro">填写人：</li>
				<li><input class="form-control"
					style="width: 300px; height: 30px;" name="author" type="text"
					id="teachar" value="${weekly.author }" /></li>
				<li>请输入作者名称</li>
			</ul>
			
			<ul><br/>
				<li class="pro">周数：</li>
				<li><input class="form-control"
					style="width: 300px; height: 30px;" name="wNumber" type="text"
					id="wNumber" value="${weekly.wNumber }" /></li>
				<li>请输入周报周数</li>
			</ul>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<br>
					<button type="submit" class="btn btn-success btn-lg"
						style="margin-left: 25%">完成</button>
				</div>
			</div>

		</div>
	</form>


</body>
<script type="text/javascript">
	function getnext(i) {
		alert(i);
		var sz = new Array("step1");
		for (var j = 0; j < sz.length; j++) {
			if (i == sz[j]) {
				document.getElementById(i).style.display = "block";
			} else {
				document.getElementById(sz[j]).style.display = "none";
			}
		}
	}
</script>
</html>