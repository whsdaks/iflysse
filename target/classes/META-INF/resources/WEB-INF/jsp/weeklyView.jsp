<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>周报视图</title>
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.css" />
<style>

tr{
	text-align:center;
}
</style>
</head>
<body>
<table class="table table-striped">
	 <c:forEach items="${weeklylist }" var="weekly">  
		<tr >
			<%-- <td><input type="hidden" name="wNumber" value="${wNumber }"></td> --%>
			<%-- <td>${weekly.wId }</td> --%>
			<td>第${weekly}周</td>
			<td><a href="weeklyinfoall?wNumber=${weekly}" class="btn btn-info">预览</a>
			
				</td>
		</tr>
	</c:forEach>  
	</table>
</body>

</html>