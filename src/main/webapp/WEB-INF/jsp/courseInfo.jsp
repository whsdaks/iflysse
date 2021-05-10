<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="shortcut icon" href="images/log.ico">
		<style type="text/css">
			table{
				border-collapse: collapse;/*让靠在一起的单元格只显示一个边框，边框不进行叠加*/
			}
			
			table tr th{
				border: solid 1px #ccc;
				height: 50px;
				width: 200px;
				background-color: #eee;
			}
			
			table tr td{
				border: solid 1px #ccc;
				height: 100px;
				text-align: center;
			}
			
			table tr:hover
			{
				background-color: rgb(0, 183, 255);/*hover:鼠标移上去就会变成红色*/
			}
		</style>
	</head>
	<body>
	
	<table border="0" cellspacing="0" cellpadding="0" class="table2excel" id="LAY-EXPORT-TEST">     
        <tr>
            <th colspan="11" class="noExl1">${subject.sName }课程表
            <input type="button" 
            onclick="table2Excel('${subject.sName }')" 
            value="导出课表">
            </th>
        </tr>
		<tr>
            <th >课程名称</th>
            <th colspan="5">${subject.sName }</th>
            
            
            <th>班级名称</th>
            <th colspan="4">${subject.sclass }</th>
            
        </tr>
        <tr><th>周数</th><th>星期</th><th>节次</th><th>课程类型</th><th>教学模式</th>
            <th>教室</th><th>讲师</th><th>助教</th><th>是否要求布置作业</th><th>授课内容</th><th>授课目标</th></tr>
        <c:forEach items="${ci }" var="ci">
		<tr><td>${ci.weekTime}</td>
		<td>${ci.week}</td>
		<td>第${ci.sNumber }大节</td><td>
		<c:if test="${subject.type == 0 }">
			    		<span class="form-control">方向课</span>
			    	</c:if>
			    
			      	<c:if test="${subject.type == 1 }">
			    		<span class="form-control">基础课</span>
			    	</c:if>
		 </td>
		 <td>
			<c:if test="${ci.pattern == 0}">
				<span class="form-control">线下-授课</span>
			</c:if>
			<c:if test="${ci.pattern == 1}">
				<span class="form-control">上机-实践</span>
			</c:if>
			<c:if test="${ci.pattern == 2}">
				<span class="form-control">线上-直播</span>
			</c:if>
		</td> 
		<td>${ci.classRoom }</td><td>${subject.teacher }</td>
		<td>${subject.assistant }</td>
        <td><c:if test="${ci.task == 0 }">
		<span class="form-control">无作业</span></c:if>
		<c:if test="${ci.task == 1 }">
		<span class="form-control">有作业</span></c:if>
		</td>
        <td>${ci.content }</td>
        <td>${ci.target }</td></tr>
                
         </c:forEach>

	</table>	
	</body>
	<script src="./js/jquery-3.3.1.min.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="./js/table2excel.js"></script>
	<script type="text/javascript">
        
	function table2Excel(filename){
		$(".table2excel").table2excel({
			exclude: ".noExl", //class="noExl"的列不导出
			name: "Excel Document Name",
			filename: filename,//文件名称
			fileext: ".xls",//文件后缀名
			exclude_img: false,//导出图片
			exclude_links: false,//导出超链接
			exclude_inputs: false//导出输入框内容
		});
	}
	
	
	
	</script>
</html>
