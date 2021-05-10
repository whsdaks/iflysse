<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=no">
<title>查看用户周报</title>
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.css" />
</head>
<body>
	<div class="container">
		<div class="page-header ">
			<h2>周报管理</h2>
		</div>
		<!-- 高级查询 -->
		<form class="form-inline" style="margin-bottom: 20px">
			<div class="form-group">
				<label for="wNumber">周数</label> <input type="text"
					class="form-control" id="wNumber" name="wNumber"
					placeholder="输入周数1-25查询" value="${param.wNumber }">
			</div>
			<div class="form-group">
				<label for="author">填写人</label> <input type="text"
					class="form-control" id="author" name="author" placeholder="作者"
					value="${param.author }">
			</div>
			<button type="submit" class="btn btn-default">查询</button>
			
		</form>

		<form action="/weekly_del_batch" >
			 <p>
				<!-- <a href="add_weekly" class="btn btn-primary">新增周报</a> -->
				<button type="submit" class="btn btn-danger" onclick="return delCheck()">批量删除</button>
				<!-- <a href="weekly_view" class="btn btn-info" onclick="open_win()">一键预览</a> --> 
				<input type="button" class="btn btn-info" value="一键预览" onclick="open_win()"> 			
							
				
			</p> 
			<table class="table table-striped">
				<tr>
					<th><input type="checkbox" id="firstCheck"
						onchange="clickAll()"></th>
					<!-- <th>编号</th> -->
					<th>周数</th>
					<th>创建时间</th>
					<th>创建人</th>
					<th>操作</th>
				</tr>

				<c:forEach items="${weeklyList }" var="weekly">
					<tr>
						<td><input type="checkbox" name="wIds" value="${weekly.wId }"></td>
						<%-- <td>${weekly.wId }</td> --%>
						<td>第${weekly.wNumber }周</td>
						<td><fmt:formatDate value="${weekly.time }" pattern="yyyy-MM-dd"/></td>
						<td>${weekly.author }</td>

						<td><a href="weeklyinfo?wId=${weekly.wId }"
							class="btn btn-info">预览</a> <a
							href="weekly_edit?wId=${weekly.wId }" class="btn btn-warning"><span
								class="glyphicon glyphicon-pencil"></span> 编辑</a> 
								
								<a href="javascript:;" class="btn btn-danger"
							onclick="weeklyDel(${weekly.wId})"> <span
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
	
	function clickAll(){
		var ids = $('input[name=wIds]')
		for(let i in ids){
			ids[i].checked = $('#firstCheck')[0].checked
		}
	}
	
// 	function deleteConfirm(id){
// 		if(confirm('是否要删除选中的用户？')){
// 			location.href="/weekly_del_batch?wid="+wid
// 		}
// 	}
	
	function checkBatch(){
		if($('input[name=wIds]:checked').length == 0){
			alert('请至少选择一个周报')
			return false
		}return true
	}
	
	function delCheck(){
		if(checkBatch()&&confirm('是否要删除选中的周报？')){
			alert("删除成功！")
			return true
		}return false
	}
	
	function weeklyDel(wId){  <!--删除周报-->
	if(confirm('确定要删除此周报？不可恢复！')){
		location.href="/weekl_del?wId="  + wId
				alert("删除成功！")
		}
	}
	
	function open_win() {
		window.open("weekly_view","newwindow", "height=400, width=800, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no");
	}
</script>

</body>
</html>