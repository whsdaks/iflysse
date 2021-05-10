<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人信息</title>
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
<style>
</style>
</head>
<body>
	<div class="page-header ">
			  <h2 style="margin-left:20px;">我的个人信息</h2>
			</div>
	<form action="/save_myinfo" method="post" class="form-horizontal">
		<div>
			<%-- <div class="form-group">
			    <label class="col-sm-2 control-label">头像</label>
			    <div class="col-sm-10">
			      <span><img src="${user.tx }" width="80px"/></span>
			    </div>
			  </div> --%>		
			<div class="form-group">
				<label class="col-sm-2 control-label">用户名</label>
				<div class="col-sm-10">
					<span class="form-control" style="width: 250px;">${loginUser.username }</span>
				
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">真实姓名</label>
				<div class="col-sm-10">
					<span class="form-control" style="width: 250px;">${loginUser.realName }</span>
				
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">性别</label>
				<div class="col-sm-10">
					<span class="form-control" style="width: 250px;">${loginUser.sex }</span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">手机号</label>
				<div class="col-sm-10">
					<span class="form-control" style="width: 250px;">${loginUser.phone }</span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">邮箱</label>
				<div class="col-sm-10">
					<span class="form-control" style="width: 250px;">${loginUser.email }</span>
				</div>
			</div>
<!-- 			<button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1" onclick="add()" style="margin:2% 0 2% 20%;">保存</button>	 -->
		</div>
	</form>

</body>
</html>