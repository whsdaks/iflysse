<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta property="qc:admins" content="3020656377612414137646375711277">

<title>博思教师辅助系统-学期设置</title>
<meta name="keywords">
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.css" />


<style>
body {
	background-color: pink;
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
<div class="page-header ">
		<h2 style="margin-left: 20px;">创建学期</h2>
	</div>
	<form action="add_term" method="post">
		<input value="${loginUser.uId }" type="hidden" name="uId">
		<div class="user">
			<ul>
				<li class="pro from-control">学期名</li>
				<li><select class="form-control" id="eName" name="eName"
					style="width: 300px; height: 30px;">


						<option selected="selected" value="--选择--">--选择--</option>
						<option value="2020-2021学年第二学期">2020-2021学年第二学期</option>
						<option value="2020-2021学年第一学期">2020-2021学年第一学期</option>
						<option value="2019-2020学年第二学期">2019-2020学年第二学期</option>
						<option value="2019-2020学年第一学期">2019-2020学年第一学期</option>
						<option value="2018-2019学年第二学期">2018-2019学年第二学期</option>
						<option value="2018-2019学年第一学期">2018-2019学年第一学期</option>
						<option value="2017-2018学年第二学期">2017-2018学年第二学期</option>
						<option value="2017-2018学年第一学期">2017-2018学年第一学期</option>
						<option value="2016-2017学年第二学期">2016-2017学年第二学期</option>
						<option value="2016-2017学年第一学期">2016-2017学年第一学期</option>
				</select></li>

				<li>请输入选择</li>
			</ul>
			
			<ul>
				<li class="pro">开始日期</li>
				<li>

					<div class="col-lg-1 col-md-1 text-center p-2"></div>

					<div class="sly col-lg-3 col-md-3">
						<input type="date" class="form-control" id="startDate" name="startDate"
							style="width: 300px; height: 30px;margin-left:-29px;" type="date">

					</div>
				<li>请选择开始日期</li>
			</ul>

			<ul>
				<li class="pro">结束日期</li>
				<li>

					<div class="col-lg-1 col-md-1 text-center p-2"></div>

					<div class="sly col-lg-3 col-md-3">
						<input type="date" class="form-control" id="endDate" name="endDate"
							style="width: 300px; height: 30px;margin-left:-29px;" >

					</div>
				<li>请选择结束日期</li>
			</ul>
			<ul>
				<li class="pro">总周数</li>
				<li><input class="form-control"
					style="width: 300px; height: 30px;" name="totalWeeks" type="text"
					id="totalWeeks" placeholder="仅数字"
					oninput="value=value.replace(/[^\d]/g,'')" /></li>
				
				<li>请填写学期总周数</li>
			</ul>
			<!-- <ul>
				<li class="pro from-control">学期状态</li>
				<li><select class="form-control" id="eState" name="eState">
						<option value="1">激活</option>
						<option value="0">锁定</option>
				</select></li>

			</ul> -->

	
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<br>
					<button type="submit" class="btn btn-success btn-lg"
						style="margin-left: 25%" onclick="$.hulla.send('保存成功', 'success')">完成</button>
				</div>
			</div>

		</div>
	</form>


</body>
<script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/hullabaloo.js"></script>
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
        $.hulla = new hullabaloo();

        $("form").submit.setTimeout(function() {
    	  $.hulla.send("保存成功！", "success");
    	}, 10);
        </script>
</html>