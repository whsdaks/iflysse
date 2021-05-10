<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta property="qc:admins" content="3020656377612414137646375711277">
<title>教师辅助系统-主页</title>
<meta name="keywords">
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
<style>
.right {
	height: 100%;
	width: 1350px;
	background-color: #CCFF66;
	float: right;
	margin-left: 100%;
	margin-top: 0;
	/*  border: 1px solid #000; */
	text-align: center;
	vertical-align: middle;
}

.my_form {
	text-align: center;
}

.right input {
	height: 30px;
}

.right select {
	height: 30px;
}

.menu a {
	left: center;
	margin: 50px;
}
</style>
</head>
<body>




	<div class="right">
		<div class="page-header ">
			<h2>编辑上课时间</h2>
		</div>


		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<c:set var="num" value="1" />
				<c:forEach items="${classTime }" var="ct">
					<form action="time_edit_save" role="form" class="my_form"
						id="classTime">
						<input value="${subject.sId }" type="hidden" name="sId"> <input
							value="${tId[num-1] }" type="hidden" name="tId">
						<div>
							<h3>第${num }节课</h3>
						</div>
						<span>第</span> <span><input type="number" name="weekTime"
							value="${ct.weekTime }" style="width: 50px"></span> <span>周,星期</span>
						<span><select id="week1" name="week"
							style="width: 50px; margin: 0px 10px 10px 0px;">
								<option value=" 1 " ${ct.week=="1"?'selected':''}>1</option>
								<option value=" 2 " ${ct.week=="2"?'selected':''}>2</option>
								<option value=" 3 " ${ct.week=="3"?'selected':''}>3</option>
								<option value=" 4 " ${ct.week=="4"?'selected':''}>4</option>
								<option value=" 5 " ${ct.week=="5"?'selected':''}>5</option>
								<option value=" 6 " ${ct.week=="6"?'selected':''}>6</option>
								<option value=" 7 " ${ct.week=="7"?'selected':''}>7</option>
						</select></span> <span><select id="sNum1" name="sNumber"
							style="width: 50px;">
								<option value=" 1 " ${ct.sNumber=="1"?'selected':''}>
									1,2</option>
								<option value=" 2 " ${ct.sNumber=="2"?'selected':''}>
									3,4</option>
								<option value=" 3 " ${ct.sNumber=="3"?'selected':''}>
									5,6</option>
								<option value=" 4 " ${ct.sNumber=="4"?'selected':''}>
									7,8</option>
								<option value=" 5 " ${ct.sNumber=="5"?'selected':''}>
									9,10</option>
								<option value=" 6 " ${ct.sNumber=="6"?'selected':''}>
									11,12</option>
						</select></span> <span>节,</span> <span> <input type="text" name="classRoom"
							style="width: 50px;" value="${ct.classRoom }"></span> <span>教室</span><input
							type="submit" value="提交" style="margin-left: 20px">
							<%-- &nbsp;&nbsp;
							<input type="hidden" name="tId" value="${ClassTime.tId }">
							&nbsp;<a href="time_del?tId=${ClassTime.tId }"><button style="height:30px;">移除</button></a> --%>
						<br>
						<c:set var="num" value="${num +1}" />

					</form>
				</c:forEach>


			</div>
		</div>


	</div>
</body>


<script src="layui/layui.all.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/hullabaloo.js"></script>
<script src="../js/jquery-3.3.1.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="layui/layui.js"></script>
<script src="layui/layui.all.js"></script>



</body>
</html>