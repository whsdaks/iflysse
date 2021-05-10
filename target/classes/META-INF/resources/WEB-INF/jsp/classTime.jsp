<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta property="qc:admins" content="3020656377612414137646375711277">
<title>博思教师辅助系统-主页</title>
<meta name="keywords">
<link rel="shortcut icon" href="images/log.ico">
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
<style>
.right {
	height: 1000px;
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

	<div class="bs">


		<div class="right">
			<h2 style="margin-top: 2%">上课时间:</h2>

			<button type="submit" class="layui-btn" onclick="add()"
				style="margin: 2% 0 2% 0;">添加上课时间</button>
			<form action="add_time" role="form" class="my_form" id="classTime">
				<input value="${subject.sId }" type="hidden" name="sId">
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">

						<button type="submit" class="btn btn-success btn-lg"
							style="margin-left: 25%"
							onclick="$.hulla.send('创建成功', 'success')">完成</button>

					</div>
				</div>
			</form>

		</div>
		</tbody>
	</div>

	<script src="layui/layui.all.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/hullabaloo.js"></script>
	<script src="../js/jquery-3.3.1.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="layui/layui.js"></script>
	<script src="layui/layui.all.js"></script>
	<script>
		var i = 1;
		op = 1;
		function add() {
			var form = document.getElementById('classTime');
			var input1 = document.createElement('input');
			var input2 = document.createElement('input');
			var select1 = document.createElement('select');
			var select2 = document.createElement('select');
			var input5 = document.createElement('input');
				
			var br = document.createElement('br');
			input1.setAttribute('type', 'number');
			input1.setAttribute('name', 'startTime');
			input2.setAttribute('type', 'number');
			input2.setAttribute('name', 'endTime');
			select1.setAttribute('id', 'week' + op);
			select1.setAttribute('name', 'week');
			select2.setAttribute('id', 'sNum' + op);
			select2.setAttribute('name', 'sNumber');
			input5.setAttribute('type', 'text');
			input5.setAttribute('name', 'classRoom');		
			
			input1.style.width = "50px"
			input2.style.width = "50px"
			select1.style.width = "50px"
			select1.style.margin = "0 10px 10px 0"
			select2.style.width = "50px"
			input5.style.width = "50px"
			var t = i + 10;
			var count = i;
			while (i < t) {
				var span = document.createElement('span');
				span.setAttribute('id', i);
				form.appendChild(span);
				i++;
			}

			form.appendChild(document.createElement('br'));
			$('#' + count).html('从');
			$('#' + (++count)).append(input1);
			$('#' + (++count)).html('到');
			$('#' + (++count)).append(input2);
			$('#' + (++count)).html('周,星期');
			$('#' + (++count)).append(select1);
			$('#' + (++count)).append(select2);
			$('#' + (++count)).html('节,');
			$('#' + (++count)).append(input5);
			$('#' + (++count)).html('教室');
			$('#' + (++count)).html('删除');
			addOption();
			op++;

		}
		function addOption(select1, select2) {
			var sNum = new Array("1,2", "3,4", "5,6", "7,8", "9,10", "11,12");
			var weekInfo = '';
			var sNumInfo = '';
			for (var j = 1; j <= 7; j++) {
				weekInfo += " <option value=' "+j+ " '> " + j + "</option>";
				if (j < 7) {
					sNumInfo += " <option value=' "+j+ " '> " + sNum[j - 1]
							+ "</option>";
				}
			}
			var wo = "week" + op;
			var no = "sNum" + op;
			$("#" + wo).append(weekInfo);
			$("#" + no).append(sNumInfo);
		}
	</script>
	<script>
		$.hulla = new hullabaloo();

		$("form").a.setTimeout(function() {
			$.hulla.send("创建成功！", "success");
		}, 100);
	</script>	
	<script type="text/javascript">
	    
	}
	</script>
	
	
</body>
</html>