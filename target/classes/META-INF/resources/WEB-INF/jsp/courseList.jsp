<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>查看课表</title>
<link rel="shortcut icon" href="images/log.ico">
<link rel="stylesheet" type="text/css" href="css/course.css" />
<style>
</style>
</head>
<body>

	<%--     <input value="${loginUser.uId }" name="uId" type="hidden"> --%>
	<!-- <div class="page-header ">
			<h2 style="margin-left:20px;">个人课表</h2>
		</div> -->
	<form action="/course_del_batch">
		<!-- <button type="submit" class="btn btn-danger"
			onclick="return delCheck()">删除</button>
		<input type="checkbox" id="firstCheck" onchange="clickAll()"> -->
		<c:forEach items="${subject }" var="subject">

			<div class="about-nnxy" style="display: inline-block">
				<!-- 关于课程列表区块-->
				<ul>
					<li>
					<%-- <input type="checkbox" name="sId" value="${subject.sId }"
						onchange="clickAll()"> --%>
						<div>
							<a href="showCourse?sId=${subject.sId }"> <img
								title="点我预览课程表" src="images/course.gif"
								style="width: 100%; height: 100%; border-radius: 8px;"></a>

						</div>

						<h4 style="margin: 0 0 20px 0;">${subject.sName }</h4> <a
						class="about-nnxy-a" href="addTime?sId=${subject.sId}"
						target="content">添加上课时间</a> <a class="about-nnxy-a"
						href="add_kc1?sId=${subject.sId}" target="content">添加上课内容</a><br>
						<br> <a href="time_edit?sId=${subject.sId }" target="content"
						style="margin-right: 5px;">修改上课时间</a> <a
						href="subject_edit?sId=${subject.sId }" target="content"
						style="margin-right: 5px;">修改课程</a> <a
						href="course_edit?sId=${subject.sId }" target="content">修改课程内容</a>


					</li>
				</ul>
			</div>
		</c:forEach>
	</form>
	<%@ include file="common/pageNav.jsp"%>

	<!-- <script>
	/* 删除学期 */
	function clickAll(){
	var sIds = $('input[name=sId]')
	for(let i in sIds){
		sIds[i].checked = $('#firstCheck')[0].checked
	}
	}
	
	
	function checkBatch(){
	if($('input[name=sId]:checked').length == 0){
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
</script> -->
</body>
</html>