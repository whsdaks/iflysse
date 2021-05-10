<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人周报</title>
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.css" />
</head>
<body>
	<div class="container">
		<div class="page-header ">
			<h2>我的周报</h2>
		</div>
		<!-- 高级查询 -->
		<%-- <form class="form-inline" style="margin-bottom: 20px">
			<div class="form-group">
				<label for="wNumber">周数</label> <input type="text"
					class="form-control" id="wNumber" name="wNumber"
					placeholder="输入周数查询" value="${param.wNumber }">
			</div>			
			<button type="submit" class="btn btn-default">查询</button>
		</form> --%>

		<form action="/weekly_del_batch" onsubmit="return checkSubmit()">
			<p>
				<a href="add_weekly" class="btn btn-primary">新增周报</a>
				<!-- <button type="submit" class="btn btn-danger">批量删除</button> -->
			</p>
			<table class="table table-striped">
				<tr>
					<th><input type="hidden" id="firstCheck"
						onchange="changeAll()"></th>
					<!-- <th>编号</th> -->
					<th>周数</th>
					<th>创建时间</th>					
					<th>操作</th>
				</tr>

				<c:forEach items="${weeklymyself }" var="weekly">
					<tr>
					<td><input type="hidden" name="wId" value="${weekly.wId }"></td>																
						<td>第${weekly.wNumber }周</td>
						<td><fmt:formatDate value="${weekly.time }" pattern="yyyy-MM-dd"/></td>						
						<td><a href="weeklyinfo?wId=${weekly.wId }"
							class="btn btn-info">预览</a> <a
							href="weekly_edit2?wId=${weekly.wId }" class="btn btn-warning"><span
								class="glyphicon glyphicon-pencil"></span> 编辑</a> <a
							href="javascript:;" class="btn btn-danger"
							onclick="weeklyDel2(${weekly.wId})"> <span
								class="glyphicon glyphicon-trash"></span> 删除
						</a></td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<%@ include file="common/weeklyPageNav.jsp"%>
	</div>
	<script src="./js/jquery-3.3.1.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script>
	function weeklyDel2(wId){  <!--删除周报-->
	if(confirm('确定要删除此周报？不可恢复！')){
		location.href="/weekl_del2?wId="  + wId
				alert("删除成功！")
		}
	}
	
</script>
</body>
</html>