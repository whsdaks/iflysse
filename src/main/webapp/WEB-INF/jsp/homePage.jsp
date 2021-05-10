<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="shortcut icon" href="images/log.ico">
<style type="text/css">
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.css" />
table {
	border-collapse: collapse; /*让靠在一起的单元格只显示一个边框，边框不进行叠加*/
}

table tr th {
	border: solid 1px #ccc;
	height: 50px;
	width: 200px;
	background-color: #eee;
}

table tr td {
	border: solid 1px #ccc;
	height: 100px;
	text-align: center;
}
</style>
</head>
<body>
<div class="jumbotron">
    <div class="container" style="text-align:center;">
        <h1>欢迎登陆博思教师辅助平台！</h1>
                    
    </div>
    <table border="0" cellspacing="0" cellpadding="0" style="margin: 0 auto;">
		<tr>
			<th colspan="3">当前学期</th>
		</tr>
		<tr>
			<th>学期名称</th>
			<th colspan="2">${termset.eName }</th>
		</tr>
		<tr>
			<th>开始时间</th>
			<th>结束时间</th>
			<th>总周数</th>
			
		<tr>
			<td> ${termset.startDate }</td>
			<td>${termset.endDate } </td>
			
			<td>${termset.totalWeeks }</td>
		</tr>

	</table>
</div>
	
</body>
</html>
