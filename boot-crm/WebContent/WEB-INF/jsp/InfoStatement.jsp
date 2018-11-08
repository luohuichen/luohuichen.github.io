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
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ONE PIECE</title>
<!-- 引入css样式文件 -->
<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
<!-- MetisMenu CSS -->
<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet" />
<!-- DataTables CSS -->
<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet" />
<!-- userom CSS -->
<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet" />
<!-- userom Fonts -->
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">管理员信息管理</h3>
				<a href="#" class="btn btn-primary" data-toggle="modal" 
		           data-target="#newCustomerDialog" onclick="clearCustomer()"><i class="fa fa-plus-square-o fa-fw"></i>添加管理员</a> 
						
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<br>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">管理员信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>编号</th>
								<th>管理员账号</th>
								<th>管理员姓名</th>
								<th>管理员密码</th>
								<th>管理员年龄</th>
								<th>管理员职务</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${page}" var="user">
								<tr style="text-align: center;">
									<td>${user.user_id}</td>
									<td>${user.user_code}</td>
									<td>${user.user_name}</td>
									<td>${user.user_password}</td>
									<td>${user.user_age}</td>
									<td>${user.user_employee}</td>

									<td><a href="#" class="btn btn-primary btn-xs"
										data-toggle="modal" data-target="#useromerEditDialog"
										onclick="edituser(${user.user_id})"><i class="fa fa-rotate-right fa-fw"></i>修改</a> <a href="#"
										class="btn btn-danger btn-xs"
										onclick="deleteuser(${user.user_id})"><i class="fa fa-trash fa-fw"></i>删除</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<%-- <div class="col-md-12 text-right">
							<itheima:page
								url="${pageContext.request.contextPath }/useromer/list2.action" />
						</div> --%>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>
	<!-- 管理员列表查询部分  end-->
		<!-- 创建管理员模态框 -->
	<div class="modal fade" id="newCustomerDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建管理员信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_user_form">
						<div class="form-group">
							<label for="new_code" class="col-sm-3 control-label">
								管理员账号 </label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="new_code"
									placeholder="管理员账号" name="user_code" />
							</div>
						</div>
						
						<div class="form-group">
							<label for="new_name" class="col-sm-3 control-label">管理员姓名</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="new_name"
									placeholder="管理员姓名" name="user_name" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_password" class="col-sm-3 control-label">管理员密码</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="new_password"
									placeholder="管理员密码" name="user_password" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_age" class="col-sm-3 control-label">管理员年龄</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="new_age"
									placeholder="管理员年龄" name="user_age" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_employee" class="col-sm-3 control-label">管理员职务</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="new_employee"
									placeholder="管理员职务" name="user_employee" />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="createUser()">创建管理员</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改管理员模态框 -->
	<div class="modal fade" id="useromerEditDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改管理员信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_user_form">
						<input type="hidden" id="edit_user_id" name="user_id" />
						<div class="form-group">
							<label for="edit_code" class="col-sm-3 control-label">管理员账号</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="edit_code"
									placeholder="管理员账号" name="user_code" />
							</div>
						</div>
					
						<div class="form-group">
							<label for="edit_name" class="col-sm-3 control-label">管理员姓名</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="edit_name"
									placeholder="管理员姓名" name="user_name" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_password" class="col-sm-3 control-label">管理员密码</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="edit_password"
									placeholder="管理员密码" name="user_password" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_age" class="col-sm-3 control-label">年龄</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="edit_age"
									placeholder="年龄" name="user_age" />
							</div>
						</div>
						
						<div class="form-group">
							<label for="edit_employee" class="col-sm-3 control-label">管理员职务</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="edit_employee"
									placeholder="管理员职务" name="user_employee" />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateuser()">保存修改</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 引入js文件 -->
	<!-- jQuery -->
	<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
	<!-- Metis Menu Plugin JavaScript -->
	<script src="<%=basePath%>js/metisMenu.min.js"></script>
	<!-- DataTables JavaScript -->
	<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
	<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
	<!-- userom Theme JavaScript -->
	<script src="<%=basePath%>js/sb-admin-2.js"></script>
	<!-- 编写js代码 -->
	<script type="text/javascript">
	//清空新建客户窗口中的数据
	function clearCustomer() {
	    $("#new_code").val("");
	    $("#new_name").val("")
	    $("#new_password").val("")
	    $("#new_age").val("")
	    $("#new_employee").val("");
	}
	// 通过id获取修改的管理员信息
	function edituser(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>customer/getUserById.action",
	        data:{"id":id},
	        success:function(data) {
	            $("#edit_user_id").val(data.user_id);
	            $("#edit_code").val(data.user_code);
	            $("#edit_name").val(data.user_name);
	            $("#edit_password").val(data.user_password);
	            $("#edit_age").val(data.user_age);
	            $("#edit_employee").val(data.user_employee);
	            
	        }
	    });
	}
	// 创建管理员
	function createUser() {
	$.post("<%=basePath%>customer/usercreate.action",
	$("#new_user_form").serialize(),function(data){
	        if(data =="OK"){
	            alert("管理员创建成功！");
	            window.location.reload();
	        }else{
	            alert("管理员创建失败！");
	            window.location.reload();
	        }
	    });
	}
    // 执行修改管理员操作
	function updateuser() {
		$.post("<%=basePath%>customer/userUpdate.action",$("#edit_user_form").serialize(),function(data){
			if(data =="OK"){
				alert("管理员信息更新成功！");
				window.location.reload();
			}else{
				alert("管理员信息更新失败！");
				window.location.reload();
			}
		});
	}
	// 删除管理员
	function deleteuser(id) {
	    if(confirm('确实要删除该管理员吗?')) {
	$.post("<%=basePath%>customer/userDelete.action",{"id":id},
	function(data){
	            if(data =="OK"){
	                alert("管理员删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除管理员失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>
</body>
</html>