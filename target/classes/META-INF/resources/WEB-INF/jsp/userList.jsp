<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bs_用户管理</title>
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
	<div class="container">
		<div class="page-header ">
			<h2>用户管理</h2>
		</div>

		<!-- 高级查询表单 -->
		<form class="form-inline" style="margin-bottom: 20px">
			<div class="form-group">
				<label for="username">用户名</label> <input type="text"
					class="form-control" id="username" name="username"
					placeholder="输入用户名查询" value="${param.username }">
			</div>
			<div class="form-group">
				<label for="phone">手机号</label> <input type="text"
					class="form-control" id="phone" name="phone" placeholder="手机号"
					value="${param.phone }">
			</div>
			<div class="form-group">
				<label for="u_type">类型</label> <input type="text"
					class="form-control" id="uType" name="uType"
					placeholder="0-管理员,1-经理,2-普通用户" value="${param.uType }">
			</div>
			<button type="submit" class="btn btn-default">查询</button>
		</form>

		<form action="/user_del_batch">
			<p>
				<a href="add_user" class="btn btn-primary">新增用户</a>
				<button type="submit" class="btn btn-danger" onclick="return delCheck()">批量冻结</button>
				<button type="button" class="btn btn-success" onclick="return actCheck()">批量激活</button>
			</p>
			<table class="table table-striped">
				<tr>
					<th><input type="checkbox" id="firstCheck"
						onchange="clickAll()"></th>
					<th>编号</th>
					<th>用户名</th>
					<th>手机号</th>
					<th>邮箱</th>
					<th>类型</th>
					<th>操作</th>
				</tr>

				<c:forEach items="${userList }" var="user">
					<tr>
						<td><input type="checkbox" name="uId" value="${user.uId }"></td>
						<td>${user.uId }</td>
						<td>${user.username }</td>
						<td>${user.phone }</td>
						<td>${user.email }</td>

						<c:if test="${user.uType ==1 }">
							<td>经理</td>
						</c:if>
						<c:if test="${user.uType ==2 }">
							<td>普通用户</td>
						</c:if>
						<c:if test="${user.uType ==0 }">
							<td>管理员</td>
						</c:if>
						<td><a href="user_info?uId=${user.uId }" class="btn btn-info">详情</a>
							<a href="user_edit?uId=${user.uId }" class="btn btn-warning"><span
								class="glyphicon glyphicon-pencil"></span> 编辑</a> <%--<a
							href="javascript:;" class="btn btn-danger"
							onclick="confirmDel(${user.uId})">
							 <span
								class="glyphicon glyphicon-trash"></span> 删除</a> --%> <c:if
								test="${user.uState ==1 }">
								<a href="javascript:;" class="btn btn-danger"
									onclick="confirmDelete(${user.uId})"> <span
									class="glyphicon glyphicon-trash"></span> 冻结
								</a>
							</c:if> <c:if test="${user.uState ==0 }">
								<a href="javascript:;" class="btn btn-success btn-large"
									onclick="confirmactivate(${user.uId})"> <span
									class="icon-comment icon-white"><img src="images/activate.jpg" style="width:15px;height:20px;"></span> 激活
								</a>
							</c:if></td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<!-- 分页条 -->
		<%@ include file="common/userPageNav.jsp"%>
	</div>
	<script src="./js/jquery-3.3.1.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script type="text/javascript">
	/* function confirmDel(uId){  <!--物理删除-->
	if(confirm('确定要删除此用户？')){
		location.href="/user_del?uId="  + uId
				alert("删除成功！")
	}
} */

//全选
function clickAll(){
	var ids = $('input[name=uId]')
	for(let i in ids){
		ids[i].checked = $('#firstCheck')[0].checked
	}
}


function checkBatch(){
	if($('input[name=uId]:checked').length == 0){
		alert('请至少选择一个用户')
		return false
	}return true
}
//批量冻结
function delCheck(){
	if(checkBatch()&&confirm('是否要冻结选中的用户？')){
		alert("冻结成功！")
		return true
	}return false
}

//休眠，防止actCheck提交过快
function sleep(milliSeconds) {
    var startTime = new Date().getTime();
    while (new Date().getTime() < startTime + milliSeconds) {
        console.log(new Date().getTime());
    }//暂停一段时间 10000=1S。
}

//批量激活
function actCheck(){
	if(checkBatch()&&confirm('是否要激活选中的用户？')){
		var ids = $('input[name=uId]:checked')
		for(var i=0;i<ids.length;i++){
			var uId = ids[i].value
			 sleep(50);
			location.href="/user_activate?uId=" + uId
		}
		alert("激活成功！")
	}
}


	/*冻结  */
	function confirmDelete(uId){  <!--冻结用户-->
				if(confirm('确定要冻结此用户？')){
					location.href="/user_frozen?uId=" + uId
							alert("冻结成功！")
				}
				
			}
	function confirmactivate(uId){  <!--激活用户-->
		location.href="/user_activate?uId=" + uId
				alert("激活成功！")
	
	
	}
	</script>
</body>
</html>