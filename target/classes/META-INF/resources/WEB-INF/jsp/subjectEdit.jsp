<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>博思教师辅助系统-主页</title>
<meta name="keywords">
  <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css" /> 
 <!-- <link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
<link rel="stylesheet" type="text/css" href="layui/css/register.css" />  -->
<style>
body{
	background-color:pink;
}
.user {
	margin: auto;
	margin-top: 30px;
	width: 800px;
	
}

.user ul {
	clear: both;
	height: 40px;
}

.user ul li {
	float: left;
	margin-right: 10px;
	line-height: 24px;
	color: #999;
	list-style: none;
}

.pro {
	font-family: "微软雅黑";
	font-size: 15px;
	font-weight: bold;
	width: 150px;
	text-align: right;
}
</style>
</head>
<body>
	<form action="subject_edit_save" method="post">
	<input type="hidden" value="${subject.sId }" name="sId">
	<div class="user">
		<ul>
			<li class="pro">科目名称</li>
			<li><input class="form-control"
				style="width: 300px; height: 30px;" name="sName" type="text"
				id="sName" onblur="checkName()" value="${subject.sName}"/> <span id="nameErr"></span></li>

			<li>请输入科目名称</li>
		</ul>
		<ul>
			<li class="pro from-control">课程类型</li>
			<li><select class="form-control" id="type" name="type"style="width: 300px; height: 30px;">
				<c:if test="${subject.type ==1 }">
					<option value="0">方向课</option>
					<option value="1">基础课</option>					
				</c:if>
				<c:if test="${subject.type == 0 }"> 
					<option value="0">方向课</option>
					<option value="1">基础课</option>
				</c:if>
			</select></li>
			<li>请输入选择</li>
		</ul>
		<ul>
			<li class="pro">总课时：</li>
			<li><input class="form-control"
				style="width: 300px; height: 30px;" name="classHour" type="text"
				id="classHour" placeholder="仅数字" value="${subject.classHour} "
				oninput="value=value.replace(/[^\d]/g,'')" /></li>
			<li>请输入总课时</li>
		</ul>
		<ul>
			<li class="pro">理论课时：</li>
			<li><input class="form-control"
				style="width: 300px; height: 30px;" name="theoryClass" type="text"
				id="theoryClass" placeholder="仅数字" value="${subject.theoryClass}"
				oninput="value=value.replace(/[^\d]/g,'')" /></li>
			<li>请输入理论课时</li>
		</ul>
		<ul>
			<li class="pro">实践课时：</li>
			<li><input class="form-control"
				style="width: 300px; height: 30px;" name="practiceClass" type="text"
				id="practiceClass" placeholder="仅数字" value="${subject.practiceClass }"
				oninput="value=value.replace(/[^\d]/g,'')" /></li>
			<li>请输入实践课时</li>
		</ul>
		<ul>
			<li class="pro">教师：</li>
			<li><input class="form-control"
				style="width: 300px; height: 30px;" name="teacher" type="text" id="teachar" value="${subject.teacher }"/>
			</li>
			<li>请输入教师名称</li>
		</ul>
		<ul>
			<li class="pro">助教：</li>
			<li><input class="form-control" type="text" style="width: 300px; height: 30px;" id="assistant" 
			name="assistant" value="${subject.assistant} "/></li>
			<li>请输入助教名称</li>
		</ul>
		<ul>
			<li class="pro">班级：</li>
			<li><input class="form-control" value="${subject.sclass }"
				style="width: 300px; height: 30px;" name="sclass" type="text" id="sclass" />
			</li>
			<li>请输入班级名称</li>
		</ul>
		
		 <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			     <br> <button type="submit" class="btn btn-success btn-lg" style="margin-left:25%">编辑完成</button>
			    </div>
			  </div>

	</div> 
	</form>


</body>
<script type="text/javascript">
        function getnext(i){
        	alert(i);
          var sz=new Array("step1");
          for(var j=0;j<sz.length;j++){
            if(i==sz[j]){
              document.getElementById(i).style.display="block";
            }else{
              document.getElementById(sz[j]).style.display="none";
            }
          }
        }
        </script>
</html>