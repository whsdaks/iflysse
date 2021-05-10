<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta property="qc:admins" content="3020656377612414137646375711277">
<title>博思教师辅助系统-主页</title>
<link rel="shortcut icon" href="images/log.ico">
<meta name="keywords">
  <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css" /> 
 <!-- <link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
<link rel="stylesheet" type="text/css" href="layui/css/register.css" />  -->
<style>
body{
	background-color:pink;
	height:70%;
	width:auto;
}
.user {
	margin: auto;
	margin-top: 30px;
	width: 700px;
	
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
<div class="page-header ">
			<h2 style="margin-left:20px;">创建课程</h2>
		</div>
	<form action="new_subject" method="post">
	<input value="${loginUser.uId }" type="hidden" name="uId">
	<div class="user">
		<ul>
			<li class="pro">科目名称</li>
			<li><input class="form-control"
				style="width: 300px; height: 30px;" name="sName" type="text"
				id="sName" onblur="checkName()" /> <span id="nameErr"></span></li>

			<li>请输入科目名称</li>
		</ul>
		<ul>
			<li class="pro from-control">课程类型</li>
			<li><select class="form-control" id="type" name="type"
				style="width: 300px; height: 30px;">
					<option value="0">方向课</option>
					<option value="1">基础课</option>

			</select></li>
			<li>请输入选择</li>
		</ul>
		<ul>
			<li class="pro">总课时：</li>
			<li><input class="form-control"
				style="width: 300px; height: 30px;" name="classHour" type="text"
				id="classHour" placeholder="仅数字"
				oninput="value=value.replace(/[^\d]/g,'')" /></li>
			<li>请输入总课时</li>
		</ul>
		<ul>
			<li class="pro">理论课时：</li>
			<li><input class="form-control"
				style="width: 300px; height: 30px;" name="theoryClass" type="text"
				id="theoryClass" placeholder="仅数字"
				oninput="value=value.replace(/[^\d]/g,'')" /></li>
			<li>请输入理论课时</li>
		</ul>
		<ul>
			<li class="pro">实践课时：</li>
			<li><input class="form-control"
				style="width: 300px; height: 30px;" name="practiceClass" type="text"
				id="practiceClass" placeholder="仅数字"
				oninput="value=value.replace(/[^\d]/g,'')" /></li>
			<li>请输入实践课时</li>
		</ul>
		<ul>
			<li class="pro">教师：</li>
			<li><input class="form-control"
				style="width: 300px; height: 30px;" name="teacher" type="text" 
				value="${loginUser.realName }" id="teachar" />
			</li>
			<li>请输入教师名称</li>
		</ul>
		<ul>
			<li class="pro">助教：</li>
			<li><input class="form-control"
				style="width: 300px; height: 30px;" name="assistant" type="text" 
				id="assistant" /></li>
			<li>请输入助教名称</li>
		</ul>
		<ul>
			<li class="pro">班级：</li>
			<li><input class="form-control"
				style="width: 300px; height: 30px;" name="sclass" type="text" 
				id="sclass" /></li>
			<li>请输入班级名称</li>
		</ul>
		
		 <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			     <br> <button type="submit" class="btn btn-success btn-lg" style="margin-left:25%">完成</button>
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