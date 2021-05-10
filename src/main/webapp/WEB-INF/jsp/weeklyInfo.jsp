<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
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
	<table border="0" cellspacing="0" cellpadding="0" style="margin:0 auto;" class="table2excel" id="LAY-EXPORT-TEST">
        <tr>
            <th colspan="11" class="noExl1">${weekly.wNumber }周报表
            <input type="button" 
            onclick="table2Excel('第${weekly.wNumber }周报表')" 
            value="导出周报"></th>
        </tr>
		<tr>
            <th >学院名称</th>
            <th colspan="3">人工智能学院</th>                      
       
        </tr>
        <tr><th>周数</th><th>周报内容</th><th>填写时间</th><th>填写人</th></tr> 
              		
		<tr>		
		<td>${weekly.wNumber }周</td>
			<td>${weekly.wConter }</td>
			<td><fmt:formatDate value="${weekly.time }" pattern="yyyy-MM-dd"/></td>
			<td>${weekly.author }</td></tr>
                
                
         	
	</table>	
	</body>
	<script src="./js/jquery-3.3.1.min.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="./js/table2excel.js"></script>
	<script type="text/javascript">
	function table2Excel(filename){
		$(".table2excel").table2excel({
			exclude: ".noExl",//class="noExl"的列不导出
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
