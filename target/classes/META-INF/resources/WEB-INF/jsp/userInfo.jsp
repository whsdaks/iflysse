<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人信息</title>
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css" />
</head>
<body>
<div class="container">
			<div class="page-header ">
			  <h2>${user.realName }的个人信息</h2>
			</div>
			
			<form class="form-horizontal">
			  <%-- <div class="form-group">
			    <label class="col-sm-2 control-label">头像</label>
			    <div class="col-sm-10">
			      <span><img src="${user.tx }" width="80px"/></span>
			      <span><a href="/avatar_edit">修改头像</a></span>
			    </div>
			  </div> --%>
			  
			  <div class="form-group">
			    <label class="col-sm-2 control-label">登录账号</label>
			    <div class="col-sm-10">
			      <span class="form-control">${user.username }</span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">真实姓名</label>
			    <div class="col-sm-10">
			      <span class="form-control">${user.realName }</span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">手机号</label>
			    <div class="col-sm-10">
			      <span class="form-control">${user.phone }</span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">性别</label>
			    <div class="col-sm-10">
			      <span class="form-control">${user.sex }</span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">密码</label>
			    <div class="col-sm-10">
			      <span class="form-control">${user.password }</span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">邮箱</label>
			    <div class="col-sm-10">
			      <span class="form-control">${user.email }</span>
			    </div>
			  </div>
			  			  
			  <div class="form-group">
			    <label class="col-sm-2 control-label">类型</label>
			    <div class="col-sm-10">
			    	<c:if test="${user.uType == 0 }">
			    		<span class="form-control">管理员</span>
			    	</c:if>
			      	<c:if test="${user.uType == 1 }">
			    		<span class="form-control">经理</span>
			    	</c:if>
			    	<c:if test="${user.uType == 2 }">
			    		<span class="form-control">普通用户</span>
			    	</c:if>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">状态</label>
			    <div class="col-sm-10">
			    	<c:if test="${user.uState == 0 }">
			    		<span class="form-control">冻结</span>
			    	</c:if>
			      	<c:if test="${user.uState == 1 }">
			    		<span class="form-control">正常</span>
			    	</c:if>
			    </div>
			  </div>			 
			</form>
		</div>
</body>
</html>