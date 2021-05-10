<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>博思教师辅助系统-主页</title>
<meta name="keywords">
<link rel="shortcut icon" href="images/log.ico">
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
<style>
</style>
</head>
<body>
	<div class="page-header">
		<h2 style="margin-left: 20px;">编辑课程内容(${subject.sName })</h2>
	</div>
	<c:set var="num" value="1" />
	<c:forEach items="${course }" var="cs">
		<form action="course_edit_save" method="post" class="layui-form"
			name="form" id="form"
			style="width: 400px; margin-top: 5%; margin-left: 5%;">
			<input value="${subject.sId }" type="hidden" name="sId"> <input
				value="${cId[num-1] }" type="hidden" name="cId">


			<!-- 课程内容 -->
			<div class="page-header">
				<h3 style="margin-left: 20px;">第${num}节课</h3>
			</div>
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label"
					style="width: 100px; margin: 0 auto;">课程内容：</label>
				<div class="layui-input-block">
					<textarea placeholder="请输入内容" class="layui-textarea" id="content"
						name="content">${cs.content }</textarea>
				</div>
			</div>

			<!-- 课程目标 -->

			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label" style="width: 100px;">课程目标：</label>
				<div class="layui-input-block" style="">
					<textarea placeholder="请输入内容" class="layui-textarea" id="target"
						name="target">${cs.target }</textarea>
				</div>

				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label"
						style="width: 100px; margin-top: 15px">教学模式：</label>
					<div class="layui-input-inline" style="margin: 15px 0 0 10px;">
						<select id="pattern" name="pattern"
							style="width: 100px; height: 30px;">
							<option value="0" ${cs.pattern=="0"?'selected':''}>线下-授课</option>
							<option value="1" ${cs.pattern=="1"?'selected':''}>上机-实践</option>
							<option value="2" ${cs.pattern=="2"?'selected':''}>线上-直播</option>
						</select>
					</div>
				</div>

				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label"
						style="width: 100px; margin-top: 15px">作业：</label>
					<div class="layui-input-inline" style="margin: 15px 0 0 10px;">
						<select id="task" name="task" style="width: 100px; height: 30px;">
							<option value="0" ${cs.task=="0"?'selected':''}>无</option>
							<option value="1" ${cs.task=="1"?'selected':''}>有</option>
						</select>
					</div>
				</div>

			</div>
			<button type="submit" class="layui-btn" style="margin: 2% 0 2% 0;"
				onclick="$.hulla.send('编辑成功', 'success')">保存</button>
			<c:set var="num" value="${num +1}" />
		</form>
	</c:forEach>

	<script src="./js/jquery-3.3.1.min.js"></script>
	<script src="layui/layui.js"></script>
	<script src="layui/layui.all.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/hullabaloo.js"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script>
		function submit() {
			var num = document.getElementsByName('form').length
			console.log(num)
			for (var i = 1; i <= num; i++) {
				var name = "form" + i
				console.log(name)
				$('#' + name).submit();
				alert(name + "提交")
			}
		}
		$.hulla = new hullabaloo();

		$("form").a.setTimeout(function() {
			$.hulla.send("编辑成功！", "success");
		}, 100);
	</script>
</body>
</html>