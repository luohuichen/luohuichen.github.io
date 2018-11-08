<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>登录页面</title>
<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/normalize.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/demo.css" />
<!--必要样式-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/component.css" />
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js">
</script>
<meta content="MSHTML 6.00.2600.0" name=GENERATOR>
<style type="text/css">

.banquan {
	margin-top: 80px;
}

.banquan a {
	line-height: 60px;
	color: #fff;
	font-family: '华文行楷';
	font-size: 22px;
	text-decoration: none;
	text-shadow: 10px 10px 10px #666;
}
</style>
</head>
<body>
	<div class="demo-1">
		<div class="content">
			<div id="large-header" class="large-header">
				<canvas id="demo-canvas"></canvas>
				<div class="logo_box">
					<p id="p01"
						style="font-size: 30px; font-family: '华文行楷'; margin-left: 30px">CRM
						管理系统</p>
					<br>
					<form enctype="multipart/form-data" method="post">
						<div class="input_outer">
							<span class="u_user"></span> <input id="usercode"
								name="user_code" class="text"
								style="color: #FFFFFF !important; font-size: 20px;" type="text"
								placeholder="请输入账户">
						</div>
						<div class="input_outer">
							<span class="us_uer"></span> <input id="password" name="password"
								class="text"
								style="color: #FFFFFF !important; font-size: 20px; position: absolute; z-index: 100;"
								value="" type="password" placeholder="请输入密码">
						</div>
						<!-- <button class="act-but submit" -->
						<div class="mb2">
							<!-- <input class="act-but submit" type="submit" value="点击登录" /> --> 
								<button type="button" class="act-but submit"
						onclick="createtext()">点击登录</button>
							<input
								class="act-but submit" type="button" value="忘记密码"
								data-toggle="modal" data-target="#userEditDialog" />
						</div>
						<br> 
					</form>
					<div class="banquan">
						<a href="#">One Pence总公司版权所有 请勿抄袭</a>
					</div>
				</div>
			</div>
			<!-- 修改客户模态框 -->
			<div class="modal fade" id="userEditDialog" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">找回密码</h4>
						</div>
						<div class="modal-body">
							<form class="form-horizontal" id="edit_user_form">

								<div class="form-group">
									<label for="edit_userName" class="col-sm-3 control-label">您的名字为？</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="edit_userName"
											placeholder="用户名称" name="user_name" />
									</div>
								</div>

								<div class="form-group">
									<label for="edit_age" class="col-sm-3 control-label">您的年龄为？</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="edit_age"
											placeholder="用户年龄" name="user_age" />
									</div>
								</div>
								<div class="form-group">
									<label for="edit_employee" class="col-sm-3 control-label">您的职务为？</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="edit_employee"
											placeholder="用户职位" name="user_employee" />
									</div>
								</div>

							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary"
								onclick="updateuser()">点击找回</button>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- /container -->
	<script
		src="${pageContext.request.contextPath}/js/login/TweenLite.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/login/EasePack.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/login/rAF.js"></script>
	<script src="${pageContext.request.contextPath}/js/login/demo-1.js"></script>
	<!-- 引入js文件 -->
	<!-- jQuery -->
	<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
	<!-- Metis Menu Plugin JavaScript -->
	<script src="<%=basePath%>js/metisMenu.min.js"></script>
	<!-- DataTables JavaScript -->
	<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
	<!-- Custom Theme JavaScript -->
	<script src="<%=basePath%>js/sb-admin-2.js"></script>
	<script src="<%=basePath%>js/jquery.form.js"></script>
	<!-- 编写js代码 -->
	<script type="text/javascript">
	// 判断是登录账号和密码是否为空
	function check() {
		var usercode = $("#usercode").val();
		var password = $("#password").val();
		if (usercode == "" || password == "") {
			alert("账号或密码不能为空！");
			return false;
		}
		return true;
	}
	/* 登录 */
	function createtext(){ 
		$.post("<%=basePath%>login.action", $("input").serialize(),
				function(data) {
					if (data == "ok") {
						alert("登录成功");
					    window.location.href='http://localhost:8080/boot-crm/customer/list.action'; 
					} else {
						if ($("input").val()=="") {
							alert("请输入您的账号密码");
							window.location.reload();
						}
						else{
						alert("你输入的账号或者密码不正确！！");
						window.location.reload();}
					}
				});
	}
    // 执行找回密码操作
	function updateuser() {
		$.post("<%=basePath%>retrieve.action", $("input").serialize(),
					function(data) {
						if (data == "FAIL") {
							alert("您回答的问题有误或者账号不存在！");
							window.location.reload();
						} else {
							alert("问题回答正确，您的密码为：" + data);
							window.location.reload();
						}
					});
		}
	</script>
</body>
</html>