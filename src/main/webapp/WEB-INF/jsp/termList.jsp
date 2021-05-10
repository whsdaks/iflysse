<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学期列表</title>
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.css" />
</head>
<body>
	<div class="container">
		<div class="page-header ">
			<h2>学期管理</h2>
		</div>
		<!-- 高级查询 -->
		<form class="form-inline" style="margin-bottom: 20px">
			<div class="form-group">
				<label for="eName">学期名</label> <input type="text"
					class="form-control" id="eName" name="eName" placeholder="支持模糊查询"
					value="${param.eName }">
			</div>
			<button type="submit" class="btn btn-default">查询</button>
		</form>

		<form action="/termset_del_batch">
			<p>
				<button type="submit" class="btn btn-danger"
					onclick="return delCheck()">删除</button>
			</p>
			<table class="table table-striped">
				<tr>
					<th><input type="checkbox" id="firstCheck"
						onchange="clickAll()"></th>
					<th>编号</th>
					<th>学期名</th>
					<th>开始时间</th>
					<th>结束时间</th>
					<th>状态</th>
					<th>操作</th>
				</tr>

				<c:forEach items="${termset }" var="termset">
					<tr>
						<td><input type="checkbox" name="eId" value="${termset.eId }"></td>
						<td>${termset.eId }</td>
						<td>${termset.eName }</td>
						<td>${termset.startDate }</td>
						<td>${termset.endDate }</td>
						<%-- <td><fmt:formatDate value="${termset.startDate }" pattern="yyyy-MM-dd"/></td>
						<td><fmt:formatDate value="${termset.endDate }" pattern="yyyy-MM-dd"/></td> --%>
						<c:if test="${termset.eState ==1}">
							<td>正常</td>
						</c:if>
						<c:if test="${termset.eState ==0}">
							<td>关闭</td>
						</c:if>
						<td>
							<%-- <a
							href="termset_edit?wId=${termset.eId }" class="btn btn-warning"><span
								class="glyphicon glyphicon-pencil"></span> 编辑</a>  --%> <c:if
								test="${termset.eState ==1 }">
								<a href="javascript:;" class="btn btn-danger"
									onclick="termfrozen(${termset.eId})"> <span
									class="glyphicon glyphicon-trash"></span> 锁定
								</a>
							</c:if> <c:if test="${termset.eState ==0 }">
								<a href="javascript:;" class="btn btn-success btn-large"
									onclick="termactivate(${termset.eId});$.hulla.send('激活成功', 'success')">
									<span class="icon-comment icon-white"><img
										src="images/activate.jpg" style="width: 15px; height: 20px;"></span>
									激活
								</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<%@ include file="common/termPageNav.jsp"%>
	</div>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/hullabaloo.js"></script>
	<script src="./js/jquery-3.3.1.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script>
	function termfrozen(eId){  <!--锁定学期-->
	if(confirm('确定要冻结学期？')){
		location.href="/term_frozen?eId="  + eId
				alert("冻结成功！")
		}
	}
	/* 激活学期 */
	function termactivate(eId){
		location.href="/term_activate?eId="+eId
				/* alert("激活成功") */
	}
	/* 删除学期 */
	function clickAll(){
	var ids = $('input[name=eId]')
	for(let i in ids){
		ids[i].checked = $('#firstCheck')[0].checked
	}
}


function checkBatch(){
	if($('input[name=eId]:checked').length == 0){
		alert('请至少选择一个学期')
		return false
	}return true
}

function delCheck(){
	if(checkBatch()&&confirm('是否要删除所选学期？')){
		alert("删除成功！")
		return true
	}return false
}

	$.hulla = new hullabaloo();

    $("form").a.setTimeout(function() {
	  $.hulla.send("激活成功！", "success");
	}, 100);
</script>
</body>
</html>